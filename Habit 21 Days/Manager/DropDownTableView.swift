//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/9/24.
//

import UIKit

final class DropDownTableViewHandler: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var items: [String]
    private var cellHeight: CGFloat = 50
    var dropDownTableViewHeight: CGFloat = 90
    var onSelect: ((String) -> Void)?
    
    init(items: [String]) {
        self.items = items
        dropDownTableViewHeight = (cellHeight * CGFloat(items.count)) + 40
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "dropDownCell", for: indexPath) as? DropDownTableViewCell else {
            fatalError("Cell not found")
        }
        cell.itemsLabel.text = items[indexPath.row]
        cell.selectionStyle = .none
        cell.itemsImage.image = UIImage(named: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onSelect?(items[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
