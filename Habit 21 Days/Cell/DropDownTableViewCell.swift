//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/9/24.
//

import UIKit

final class DropDownTableViewCell: UITableViewCell {
    
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: 50))
        return view
    }()
    
    lazy var itemsImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 15, y: 10, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var itemsLabel: UILabel = {
        let itemsLabel = UILabel(frame: CGRect(x: 60, y: 10, width: frame.width - 80, height: 30))
        itemsLabel.font = UIFont(name:"RooneySans-Regular", size: 17)
        return itemsLabel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        backView.addSubview(itemsImage)
        backView.addSubview(itemsLabel)
    }
}
