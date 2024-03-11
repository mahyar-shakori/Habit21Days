//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 2/4/24.
//

import UIKit

final class HabitLibraryView: UIView {
    
    private let habitCellView = UIView()
    let habitTitleLabel = UILabel()

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
        setupHabitTitleLabel()
    }
    
    private func setupHabitCellView() {
        habitCellView.backgroundColor = UIColor.appCellColor
        habitCellView.addCornerView(corner: 12.5)
        addSubview(habitCellView)
    }
    
    private func setupHabitTitleLabel() {
        habitTitleLabel.numberOfLines = 0
        habitTitleLabel.font = UIFont(name: UIFont.rooneySansBold, size: 20)
        habitCellView.addSubview(habitTitleLabel)
    }
    
    private func setupConstraints() {
        habitCellView.anchor(top: safeTopAnchor, leading: safeLeadingAnchor, bottom: safeBottomAnchor, trailing: safeTrailingAnchor, padding: Padding(top: 5, left: 0, bottom: 5, right: 0))
                
        habitTitleLabel.anchor(leading: habitCellView.leadingAnchor, padding: Padding(left: 15), centerY: habitCellView.centerYAnchor)
    }
}
