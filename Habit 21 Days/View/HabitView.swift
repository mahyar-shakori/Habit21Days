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
        self.backgroundColor = UIColor.systemGray6
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
        habitCellView.backgroundColor = UIColor.systemBackground
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
        habitCellView.addSubview(habitDaysCountLabel)
    }
    
    private func setupHabitDaysCountCircularConstraints() {
        habitDaysCountCircular.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            habitDaysCountCircular.leadingAnchor.constraint(equalTo: habitCellView.leadingAnchor, constant: 20),
            habitDaysCountCircular.centerYAnchor.constraint(equalTo: habitCellView.centerYAnchor),
            habitDaysCountCircular.heightAnchor.constraint(equalToConstant: 30),
            habitDaysCountCircular.widthAnchor.constraint(equalTo: habitDaysCountCircular.heightAnchor)
        ])
    }
    
    private func setupConstraints() {
        habitCellView.anchor(top: safeTopAnchor, leading: safeLeadingAnchor, bottom: safeBottomAnchor, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20))
        
        setupHabitDaysCountCircularConstraints()
        
        habitTitleLabel.anchor(top: nil, leading: habitDaysCountCircular.trailingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0), centerY: habitCellView.centerYAnchor)
        
        habitDaysCountLabel.anchor(top: nil, leading: nil, bottom: nil, trailing: habitCellView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15), centerY: habitCellView.centerYAnchor)
    }
}
