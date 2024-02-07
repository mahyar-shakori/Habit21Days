//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 2/4/24.
//

import UIKit

final class HabitLibraryTableViewCell: UITableViewCell {
    
    let habitLibraryView = HabitLibraryView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(habitLibraryView)
        addHabitLibraryView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addHabitLibraryView() {
        habitLibraryView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            habitLibraryView.topAnchor.constraint(equalTo: contentView.topAnchor),
            habitLibraryView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            habitLibraryView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            habitLibraryView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func config(_ habitLibrary: HabitLibrary) {
        habitLibraryView.habitTitleLabel.text = "\(habitLibrary.title)"
    }
}
