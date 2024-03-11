//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/10/24.
//

import UIKit

final class HabitTableViewCell: UITableViewCell {
    
    let habitView = HabitView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(habitView)
        addHabitView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addHabitView() {
        
        habitView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor)
    }
    
    func config(_ habit: Habit) {
        let daysLeft = HabitDaysCountUtility.habitDaysCountUpdate(id: habit.id, createDate: habit.dateCreate)
        let days = Float(22 - daysLeft)
        
        habitView.habitTitleLabel.text = "\(habit.title)"
        habitView.habitDaysCountLabel.text = "\(daysLeft)" + NSLocalizedString("daysCountLabel", comment: "")
        habitView.habitDaysCountCircular.setProgressWithAnimation(value: days/22, duration: 1)
    }
}
