//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/14/24.
//

import UIKit

final class DatePickerManager: NSObject {
    
    var datePicker: UIDatePicker?
    private var textField: UITextField
    private var formatter: DateFormatter
    
    init(textField: UITextField) {
        self.textField = textField
        self.formatter = DateFormatter()
        super.init()
        setupDatePicker()
    }
    
    private func setupDatePicker() {
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .time
        datePicker?.addTarget(self, action: #selector(reminderFormattedDate), for: .valueChanged)
        textField.inputView = datePicker
    }
    
    func updateDatePickerStyle(_ style: UIDatePickerStyle) {
        datePicker?.preferredDatePickerStyle = style
    }
    
    @objc private func reminderFormattedDate() {
        guard let datePicker = datePicker else { return }
        formatter.dateFormat = "HH:mm"
        textField.text = formatter.string(from: datePicker.date)
        
        NotificationCenter.default.post(name: .datePickerManagerDateChanged, object: datePicker.date)

    }
}
