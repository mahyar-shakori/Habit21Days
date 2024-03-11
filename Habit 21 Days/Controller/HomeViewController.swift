//
//  HomeViewController.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/8/24.
//

import UIKit

final class HomeViewController: UIViewController, AlertDisplay {
    
    private let homeView = HomeView()
    private var dropDownTableViewHandler: DropDownTableViewHandler! = nil
    private var refreshControlManager = RefreshControlManager()
    private let typingAnimationHandler = TypingAnimationHandler()
    private var realmManager = RealmManager()
    private var habitList = [Habit]()
    private var habitLibraryList = [HabitLibrary]()
    private var dropDownButtonFlag = false
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addHomeView()
        updateHomeView()
        realmManagerHandler()
        appEnteredForegroundSetup()
        habitTableViewConfigs()
        dropDownTableViewConfigs()
        dropDownTableViewOnSelectHandler()
        pullToRefreshHandler()
        handleKeyboardDismiss()
        doneButtonTappedSetup()
        dropDownButtonTappedSetup()
        saveButtonTappedSetup()
        
        DispatchQueue.delay(0.1) {
            self.typeAnimation()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.habitTableViewLoadValues()
            self.emptyView()
            self.updateButtonsAndTableViews()
        }
    }
    
    private func addHomeView() {
        view.addSubview(homeView)
        homeView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    private func updateHomeView() {
        if UserDefaultsManager.shared.isQuoteOff == false {
            homeView.dropDownButton.isHidden = true
        } else {
            homeView.quoteLabel.text = ""
        }
        updateButtonsAndTableViews()
    }
    
    private func updateButtonsAndTableViews() {
        homeView.doneButton.isHidden = true
        homeView.habitTableView.isHidden = false
        homeView.habitLibraryTableView.isHidden = true
        homeView.addHabitView.isHidden = true
        homeView.addHabitTextField.isHidden = true
        homeView.saveButton.isHidden = true
    }
    
    private func habitTableViewLoadValues() {
        habitList = realmManager.fetchObjects(ofType: Habit.self)
        DispatchQueue.delay(0.08) {
            self.homeView.habitTableView.reloadData()
        }
    }
    
    private func emptyView() {
        homeView.habitTableView.reloadData()
        if habitList.isEmpty {
            homeView.emptyView.isHidden = false
        } else{
            homeView.emptyView.isHidden = true
        }
    }
    
    private func realmManagerHandler() {
        realmManager = RealmManager()
    }
    
    private func appEnteredForegroundSetup() {
        NotificationCenter.default.addObserver(self, selector: #selector(appEnteredForeground), name: NSNotification.Name("AppEnteredForeground"), object: nil)
    }
    
    @objc func appEnteredForeground() {
        DispatchQueue.delay(0.08) {
            self.homeView.habitTableView.reloadData()
        }
    }
    
    private func habitTableViewConfigs() {
        homeView.habitTableView.delegate = self
        homeView.habitTableView.dataSource = self
        homeView.habitTableView.register(HabitTableViewCell.self, forCellReuseIdentifier: "habitCell")
        homeView.habitLibraryTableView.delegate = self
        homeView.habitLibraryTableView.dataSource = self
        homeView.habitLibraryTableView.register(HabitLibraryTableViewCell.self, forCellReuseIdentifier: "otherHabitCell")
    }
    
    private func dropDownTableViewConfigs() {
        dropDownTableViewHandler = DropDownTableViewHandler(items: [NSLocalizedString("dropDownTableViewFirstItem", comment: ""),NSLocalizedString("dropDownTableViewSecondItem", comment: ""),NSLocalizedString("dropDownTableViewThirdItem", comment: ""),NSLocalizedString("dropDownTableViewFourthItem", comment: ""),NSLocalizedString("dropDownTableViewFifthItem", comment: "")])
        homeView.dropDownTableView.delegate = dropDownTableViewHandler
        homeView.dropDownTableView.dataSource = dropDownTableViewHandler
    }
    
    private func dropDownTableViewOnSelectHandler() {
        dropDownTableViewHandler.onSelect = { [self] selectedItem in
            let caseName = dropDownTableViewHandler.items
            onClickTransparentView()
            
            switch selectedItem {
            case caseName[0]:
                coordinator?.navigateToAddHabitPage()

            case caseName[1]:
                homeView.habitTableView.isHidden.toggle()
                homeView.habitLibraryTableView.isHidden.toggle()
                homeView.addHabitView.isHidden.toggle()
                homeView.addHabitTextField.isHidden.toggle()
                homeView.saveButton.isHidden.toggle()

                if homeView.saveButton.isHidden {
                    emptyView()
                    homeView.quoteLabel.isHidden = false
                    homeView.homeTitleLabel.text = NSLocalizedString("firstHomeTitleLabel", comment: "")
                } else {
                    homeView.emptyView.isHidden = true
                    homeView.quoteLabel.isHidden = true
                    homeView.homeTitleLabel.text = NSLocalizedString("secondHomeTitleLabel", comment: "")
                }
                dismissKeyboard()
                homeView.addHabitTextField.text = ""
                habitLibraryList = realmManager.fetchObjects(ofType: HabitLibrary.self)
                homeView.habitLibraryTableView.reloadData()
                
            case caseName[2]:
                dropDownButtonFlag = true
                if habitList.isEmpty == true && homeView.habitTableView.isEditing == false {
                    homeView.dropDownButton.isHidden = false
                    homeView.doneButton.isHidden = true
                    
                    showAlert(title: NSLocalizedString("habitListEmptyAlertTitle", comment: ""), message: "", primaryButtonTitle: NSLocalizedString("alertOkButton", comment: ""), primaryAction: {}, secondaryButtonTitle: nil, secondaryAction: nil)
                } else{
                    homeView.habitTableView.isEditing = !homeView.habitTableView.isEditing
                    homeView.dropDownButton.isHidden = true
                    homeView.doneButton.isHidden = false
                }
                
            case caseName[3]:
                UserDefaultsManager.shared.isQuoteOff = true
                homeView.quoteLabel.text = ""
                
            case caseName[4]:
                UserDefaultsManager.shared.isLogin = false
                UserDefaultsManager.shared.isQuoteOff = false
                coordinator?.navigateToSetNamePage()
            
            default:
                debugPrint ("None of the options were clicked")
            }
        }
    }
    
    private func pullToRefreshHandler() {
        refreshControlManager = RefreshControlManager(refreshInterval: 1.0)
        refreshControlManager.addToTableView(homeView.habitTableView)
        refreshControlManager.onRefresh = { [weak self] in
            self?.homeView.habitTableView.reloadWithAnimation()
        }
    }
    
    private func typeAnimation() {
        if QuoteData.shared.quote != "" {
            typingAnimationHandler.animateTyping(for: homeView.quoteLabel, withText: QuoteData.shared.quote ?? "", audioSoundID: 1306, typingDelay: 0.05) {
                self.homeView.dropDownButton.isHidden = false
            }
        }
    }
    
    private func buttonWhenListIsEmpty() {
        if dropDownButtonFlag && habitList.isEmpty {
            doneButtonActions()
        }
    }
    
    private func handleKeyboardDismiss() {
        addKeyboardDismissTapGesture()
        addDoneButtonToKeyboard(for: homeView.addHabitTextField)
    }
    
    private func saveButtonTappedSetup() {
        homeView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc private func saveButtonTapped() {
        let habitLibrary = HabitLibrary()
        
        habitLibrary.title = homeView.addHabitTextField.text ?? ""
        habitLibrary.id = realmManager.incrementID(for: HabitLibrary.self)
        habitLibraryList.append(habitLibrary)
        realmManager.addObject(habitLibrary)
        homeView.habitLibraryTableView.reloadData()
    }
    
    private func doneButtonTappedSetup() {
        homeView.doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
    }
    
    @objc private func doneButtonTapped() {
        doneButtonActions()
    }
    
    private func doneButtonActions() {
        homeView.habitTableView.isEditing = !homeView.habitTableView.isEditing
        
        homeView.doneButton.isHidden.toggle()
        homeView.dropDownButton.isHidden.toggle()
    }
    
    private func dropDownButtonTappedSetup() {
        homeView.dropDownButton.addTarget(self, action: #selector(dropDownButtonTapped), for: .touchUpInside)
    }
    
    @objc private func dropDownButtonTapped() {
        let keyWindow = UIApplication.shared.connectedScenes.filter { $0.activationState == .foregroundActive }.compactMap { $0 as? UIWindowScene }.flatMap { $0.windows }.first(where: { $0.isKeyWindow })
        homeView.dropDownTransparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        homeView.dropDownTransparentView.frame = view.frame
        keyWindow?.addSubview(homeView.dropDownTransparentView)
        
        let screenSize = UIScreen.main.bounds.size
        homeView.dropDownTableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: dropDownTableViewHandler.dropDownTableViewHeight)
        keyWindow?.addSubview(homeView.dropDownTableView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickTransparentView))
        homeView.dropDownTransparentView.addGestureRecognizer(tapGesture)
        
        homeView.dropDownTransparentView.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.homeView.dropDownTransparentView.alpha = 0.5
            self.homeView.dropDownTableView.frame = CGRect(x: 0, y: screenSize.height - self.dropDownTableViewHandler.dropDownTableViewHeight, width: screenSize.width, height: self.dropDownTableViewHandler.dropDownTableViewHeight)
        }, completion: nil)
    }
    
    @objc func onClickTransparentView() {
        let screenSize = UIScreen.main.bounds.size
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.homeView.dropDownTransparentView.alpha = 0
            self.homeView.dropDownTableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.dropDownTableViewHandler.dropDownTableViewHeight)
        }, completion: nil)
    }
    
    private func removeHabit(habit: Habit) {
        for reminder in habit.reminders {
            let notificationIdentifier = "\(reminder.id)"
            NotificationManager.shared.cancelNotification(identifier: notificationIdentifier)
        }
        realmManager.deleteObject(habit)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if self.traitCollection.userInterfaceStyle != previousTraitCollection?.userInterfaceStyle {
            updateColor()
        }
    }
    
    private func updateColor() {
        homeView.dropDownButton.setImage(UIImage.dropDownButtonImage?.withColor(UIColor.label), for: .normal)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == homeView.habitTableView {
            return habitList.count
        } else {
            return habitLibraryList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == homeView.habitTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell") as? HabitTableViewCell else {
                fatalError("Unable to dequeue HabitTableViewCell")
            }
            cell.backgroundColor = UIColor.clear
            cell.config(habitList[indexPath.row])
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "otherHabitCell") as? HabitLibraryTableViewCell else {
                fatalError("Unable to dequeue HabitTableViewCell")
            }
            cell.backgroundColor = UIColor.clear
            cell.config(habitLibraryList[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if tableView == homeView.habitTableView {
            let moveObjTemp = habitList[sourceIndexPath.item]
            habitList.remove(at: sourceIndexPath.item)
            habitList.insert(moveObjTemp, at: destinationIndexPath.item)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if tableView == homeView.habitTableView {
            return 100
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        if tableView == homeView.habitTableView {
            let selectedHabit = habitList[indexPath.row]
            let editAction = UIContextualAction(style: .normal, title: nil) { [weak self] (action, view, actionPerformed) in
                guard let self = self else { return }
            
                coordinator?.navigateToEditHabitPage(withHabit: selectedHabit)
                
                actionPerformed(true)
            }

            let editIcon = UIImage.addBackgroundCircle(withSymbol: "pencil", color: .blue, diameter: 50, tintColor: .white)
            editAction.image = editIcon
            editAction.backgroundColor = .appBackgroundColor
            
            let deleteAction = UIContextualAction(style: .destructive , title: nil) { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
                
                self.showAlert(title: NSLocalizedString("deleteHabitAlertTitle", comment: ""), message: NSLocalizedString("deleteHabitAlertMessage", comment: "") + selectedHabit.title + "?", primaryButtonTitle: NSLocalizedString("alertYesButton", comment: ""), primaryButtonStyle: .destructive,primaryAction: {
                    let habitToDelete = self.habitList[indexPath.row]
                    self.removeHabit(habit: habitToDelete)
                    self.habitList.remove(at: indexPath.row)
                    self.homeView.habitTableView.deleteRows(at: [indexPath], with: .fade)
                    actionPerformed(true)
                    self.buttonWhenListIsEmpty()
                    self.emptyView()                },secondaryButtonTitle: NSLocalizedString("alertNoButton", comment: ""), secondaryButtonStyle: .default,secondaryAction: {
                        actionPerformed(false)
                    })
            }

            let deleteIcon = UIImage.addBackgroundCircle(withSymbol: "trash", color: .red, diameter: 50, tintColor: .white)
            deleteAction.image = deleteIcon
            deleteAction.backgroundColor = UIColor.appBackgroundColor
            
            let config = UISwipeActionsConfiguration(actions: [deleteAction, editAction])
                config.performsFirstActionWithFullSwipe = false
            return config
        } else {
            let selectedHabit = habitLibraryList[indexPath.row]
            let deleteAction = UIContextualAction(style: .destructive, title:  "") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
                
                self.showAlert(title: NSLocalizedString("deleteHabitAlertTitle", comment: ""), message: NSLocalizedString("deleteHabitAlertMessage", comment: "") + selectedHabit.title + "?", primaryButtonTitle: NSLocalizedString("alertYesButton", comment: ""), primaryButtonStyle: .destructive, primaryAction: {
                    self.realmManager.deleteObject(selectedHabit)
                    self.habitLibraryList.remove(at: indexPath.row)
                    self.homeView.habitLibraryTableView.deleteRows(at: [indexPath], with: .fade)
                    actionPerformed(true)
                }, secondaryButtonTitle: NSLocalizedString("alertNoButton", comment: ""), secondaryButtonStyle: .default, secondaryAction: {
                    actionPerformed(false)
                })
            }

            let deleteIcon = UIImage.addBackgroundCircle(withSymbol: "trash", color: .red, diameter: 35, tintColor: .white)
            deleteAction.image = deleteIcon
            deleteAction.backgroundColor = UIColor.appBackgroundColor
            
            return UISwipeActionsConfiguration(actions: [deleteAction])
        }
    }
}
