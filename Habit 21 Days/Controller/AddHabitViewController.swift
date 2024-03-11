//
//  AddHabitViewController.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/9/24.
//

import UIKit
import RealmSwift

final class AddHabitViewController: UIViewController, AlertDisplay {
    
    private let addHabitView = AddHabitView()
    private var datePickerManager: DatePickerManager?
    private let addHabitTextFieldDelegate = TextFieldDelegateHandler()
    private var realmManager = RealmManager()
    private var reminderList = [Reminder]()
    private var habit = Habit()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAddHabitView()
        updateAddHabitView()
        realmManagerHandler()
        addHabitTextFieldDelegateConfig()
        reminderTableViewConfigs()
        handleKeyboardDismiss()
        checkNotificationStatus()
        datePickerSetup()
        reminderSwitchSetup()
        cancelButtonTappedSetup()
        saveButtonTappedSetup()
        addReminderButtonTappedSetup()
    }
    
    private func addAddHabitView() {
        view.addSubview(addHabitView)
        addHabitView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    private func updateAddHabitView() {
        updateReminderSwitchIsOff()
        addHabitView.saveButton.isEnabled = false
        addHabitView.saveButton.setTitleColor(UIColor.accentColor?.withAlphaComponent(0.5), for: .normal)
        addHabitView.reminderSwitch.isEnabled = false
        addHabitView.reminderSwitch.isOn = false
    }
    
    private func realmManagerHandler() {
        realmManager = RealmManager()
    }
    
    private func addHabitTextFieldDelegateConfig() {
        addHabitView.addHabitTextField.delegate = addHabitTextFieldDelegate
        addHabitView.addHabitTextField.accessibilityIdentifier = "addHabitTextField"
        addHabitTextFieldDelegate.uiHandlerTextChange = self
    }
    
    private func reminderTableViewConfigs() {
        addHabitView.reminderTableView.delegate = self
        addHabitView.reminderTableView.dataSource = self
        addHabitView.reminderTableView.register(ReminderTableViewCell.self, forCellReuseIdentifier: "reminderCell")
    }
    
    private func handleKeyboardDismiss() {
        addKeyboardDismissTapGesture()
        addDoneButtonToKeyboard(for: addHabitView.addHabitTextField)
        addDoneButtonToKeyboard(for: addHabitView.dateTextField)
    }
    
    @objc func appDidBecomeActive() {
        checkNotificationAuthorization()
    }
    
    private func checkNotificationStatus() {
        NotificationCenter.default.addObserver(self, selector: #selector(appDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    private func checkNotificationAuthorization() {
        NotificationManager.shared.checkNotificationAuthorization { authorized in
            if authorized {
                DispatchQueue.main.async {
                    self.updateUIForAuthorizedNotifications()
                }
            } else {
                DispatchQueue.main.async {
                    NotificationManager.shared.promptForNotificationAuthorization(on: self)
                    self.updateUIForDeniedNotifications()
                }
            }
        }
    }
    
    private func updateUIForAuthorizedNotifications() {
        self.addHabitView.dateTextField.isEnabled = true
        self.addHabitView.dateLabel.textColor = UIColor.label
    }
    
    private func updateUIForDeniedNotifications() {
        self.addHabitView.dateTextField.isEnabled = false
        self.addHabitView.dateLabel.textColor = UIColor.label.withAlphaComponent(0.3)
    }
    
    private func datePickerSetup() {
        datePickerManager = DatePickerManager(textField: addHabitView.dateTextField)
        datePickerManager?.updateDatePickerStyle(.wheels)
        NotificationCenter.default.addObserver(self, selector: #selector(dateChanged), name: .datePickerManagerDateChanged, object: nil)
    }
    
    @objc func dateChanged(notification: Notification) {
        if notification.object is Date {
            addHabitView.dateLabel.isHidden = true
            addHabitView.addReminderButton.setTitleColor(UIColor.label.withAlphaComponent(1.0), for: .normal)
        }
    }
    
    private func reminderSwitchSetup() {
        addHabitView.reminderSwitch.addTarget(self, action: #selector(reminderSwitchValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func reminderSwitchValueChanged(_ sender: UISwitch) {
        if addHabitView.reminderSwitch.isOn {
            updateReminderSwitchIsOn()
        } else {
            updateReminderSwitchIsOff()
        }
    }
    
    private func cancelButtonTappedSetup() {
        addHabitView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    @objc private func cancelButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func saveButtonTappedSetup() {
        addHabitView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc private func saveButtonTapped() {
        habit.title = addHabitView.addHabitTextField.text ?? ""
        habit.id = realmManager.incrementID(for: Habit.self)
        realmManager.addObject(habit)
        
        for reminder in reminderList {
            let notificationIdentifier = "\(reminder.id)"
            let title = NSLocalizedString("reminderLabel", comment: "")
            let message = NSLocalizedString("notificationReminderMessage", comment: "") + (addHabitView.addHabitTextField.text ?? "") + "."
            let date = reminder.reminderTime.toDate(withFormat: "HH:mm") ?? Date()
            
            NotificationManager.shared.setNotification(identifier: notificationIdentifier, title: title, message: message, date: date)
        }
        reminderList.removeAll()
        navigationController?.popViewController(animated: true)
    }
    
    private func addReminderButtonTappedSetup() {
        addHabitView.addReminderButton.addTarget(self, action: #selector(addReminderButtonTapped), for: .touchUpInside)
    }
    
    @objc private func addReminderButtonTapped() {
        if addHabitView.dateTextField.text?.isEmpty == true {
            
            showAlert(title: NSLocalizedString("dateTextFieldEmptyTitle", comment: ""), message: "", primaryButtonTitle: NSLocalizedString("alertOkButton", comment: ""), primaryAction: {},secondaryButtonTitle: nil, secondaryAction: nil)
        } else{
            addHabitView.addReminderButton.setTitleColor(UIColor.label.withAlphaComponent(0.3), for: .normal)
            addHabitView.dateLabel.isHidden = false
            
            let reminder = Reminder()
            reminder.reminderTime = addHabitView.dateTextField.text ?? ""
            reminder.id = realmManager.incrementID(for: Reminder.self)
            reminderList.append(reminder)
            habit.reminders.append(reminder)
            realmManager.addObject(reminder)
            addHabitView.reminderTableView.reloadData()
            dismissKeyboard()
            addHabitView.dateTextField.text = nil
        }
    }
    
    private func updateReminderSwitchIsOn() {
        addHabitView.saveButton.isEnabled = true
        addHabitView.saveButton.setTitleColor(UIColor.accentColor, for: .normal)
        addHabitView.fourthSeparator.isHidden = false
        addHabitView.dateView.isHidden = false
        addHabitView.dateLabel.isHidden = false
        addHabitView.fifthSeparator.isHidden = false
        addHabitView.addReminderView.isHidden = false
        checkNotificationAuthorization()
    }
    
    private func updateReminderSwitchIsOff() {
        addHabitView.addReminderButton.setTitleColor(UIColor.label.withAlphaComponent(0.3), for: .normal)
        addHabitView.dateTextField.isEnabled = true
        addHabitView.dateLabel.textColor = UIColor.label
        addHabitView.fourthSeparator.isHidden = true
        addHabitView.dateView.isHidden = true
        addHabitView.dateTextField.text = ""
        addHabitView.fifthSeparator.isHidden = true
        addHabitView.addReminderView.isHidden = true
        reminderList.removeAll()
        addHabitView.reminderTableView.reloadData()
    }
}

extension AddHabitViewController: TextFieldDelegateUIHandlerTextChange {
    
    func userNameTextFieldDidChange(textFieldName: String, isEmpty: Bool) {
        if textFieldName == "addHabitTextField" {
            if isEmpty {
                updateAddHabitView()
            }
            else {
                addHabitView.saveButton.isEnabled = true
                addHabitView.saveButton.setTitleColor(UIColor.accentColor, for: .normal)
                addHabitView.reminderSwitch.isEnabled = true
            }
        }
    }
}

extension AddHabitViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reminderCell") as? ReminderTableViewCell else {
            fatalError("Unable to dequeue ReminderTableViewCell")
        }
        cell.config(reminderList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let reminder = reminderList[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title:  "") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
            
            self.showAlert(title: NSLocalizedString("deleteReminderAlertTitle", comment: ""), message: NSLocalizedString("deleteHabitAlertMessage", comment: "") + reminder.reminderTime + "?", primaryButtonTitle: NSLocalizedString("alertYesButton", comment: ""), primaryButtonStyle: .destructive, primaryAction: {
                self.reminderList.remove(at: indexPath.row)
                self.addHabitView.reminderTableView.deleteRows(at: [indexPath], with: .fade)
                if let index = self.reminderList.firstIndex(of: reminder) {
                    self.reminderList.remove(at: index)
                }
                actionPerformed(true)
            }, secondaryButtonTitle: NSLocalizedString("alertNoButton", comment: ""), secondaryButtonStyle: .default, secondaryAction: {
                actionPerformed(false)
            })
        }
        
        let deleteIcon = UIImage.addBackgroundCircle(withSymbol: "trash", color: .red, diameter: 35, tintColor: .white)
            deleteAction.image = deleteIcon
        deleteAction.image = deleteIcon
        deleteAction.backgroundColor = UIColor.appBackgroundColor
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
