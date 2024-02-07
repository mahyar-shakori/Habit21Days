//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 2/7/24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    func start()
}
