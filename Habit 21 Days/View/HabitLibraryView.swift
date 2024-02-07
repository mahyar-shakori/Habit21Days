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
        self.backgroundColor = UIColor.systemGray6
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
        habitCellView.backgroundColor = UIColor.systemBackground
        habitCellView.addCornerView(corner: 12.5)
        addSubview(habitCellView)
    }
    
    private func setupHabitTitleLabel() {
        habitTitleLabel.numberOfLines = 0
        habitTitleLabel.font = UIFont(name: UIFont.rooneySansBold, size: 20)
        habitCellView.addSubview(habitTitleLabel)
    }
    
    private func setupConstraints() {
        habitCellView.anchor(top: safeTopAnchor, leading: safeLeadingAnchor, bottom: safeBottomAnchor, trailing: safeTrailingAnchor, padding: UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20))
                
        habitTitleLabel.anchor(top: nil, leading: habitCellView.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0), centerY: habitCellView.centerYAnchor)
    }
}
