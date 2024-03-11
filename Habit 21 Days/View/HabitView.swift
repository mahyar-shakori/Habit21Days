//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/16/24.
//

import UIKit

final class HabitView: UIView {
    
    private let habitCellView = UIView()
    let habitDaysCountCircular = CircularProgressView()
    let habitTitleLabel = UILabel()
    let habitDaysCountLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = UIColor.clear
        
        setupHabitCellView()
        setupHabitDaysCountCircular()
        setupHabitTitleLabel()
        setupHabitDaysCountLabel()
    }
    
    private func setupHabitCellView() {
        habitCellView.backgroundColor = UIColor.appCellColor
        habitCellView.addCornerView(corner: 12.5)
        addSubview(habitCellView)
    }
    
    private func setupHabitDaysCountCircular() {
        habitDaysCountCircular.trackColor = UIColor.accentColor?.withAlphaComponent(0.3) ?? UIColor.red
        habitDaysCountCircular.progressColor = UIColor.accentColor ?? UIColor.green
        habitCellView.addSubview(habitDaysCountCircular)
    }
    
    private func setupHabitTitleLabel() {
        habitTitleLabel.numberOfLines = 0
        habitTitleLabel.font = UIFont(name: UIFont.rooneySansBold, size: 18)
        habitCellView.addSubview(habitTitleLabel)
    }
    
    private func setupHabitDaysCountLabel() {
        habitDaysCountLabel.numberOfLines = 0
        habitDaysCountLabel.font = UIFont(name: UIFont.rooneySansRegular, size: 14)
        habitDaysCountLabel.text = "21 days left"
        habitCellView.addSubview(habitDaysCountLabel)
    }

    private func setupConstraints() {
        habitCellView.anchor(top: safeTopAnchor, leading: safeLeadingAnchor, bottom: safeBottomAnchor, trailing: safeTrailingAnchor, padding: Padding(top: 5, left: 0, bottom: 5, right: 0))
        
        habitDaysCountCircular.anchor(leading: habitCellView.leadingAnchor, padding: Padding(left: 20), width: 30, height: 30, centerY: habitCellView.centerYAnchor)
     
        habitTitleLabel.anchor(leading: habitDaysCountCircular.trailingAnchor, trailing: safeTrailingAnchor, padding: Padding(left: 20, right: habitDaysCountLabel.width() + 20), centerY: habitCellView.centerYAnchor)
        
        habitDaysCountLabel.anchor(trailing: habitCellView.trailingAnchor, padding: Padding(right: 15), centerY: habitCellView.centerYAnchor)
    }
}
