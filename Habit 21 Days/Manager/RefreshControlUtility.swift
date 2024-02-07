//
//  File.swift
//  Habit 21 Days
//
//  Created by Mahyar on 1/9/24.
//

import UIKit

final class RefreshControlManager {
    
    private var refreshControl: UIRefreshControl = UIRefreshControl()
    var onRefresh: (() -> Void)?
    private var refreshInterval: TimeInterval
    
    init(refreshInterval: TimeInterval = 0.5) {
        self.refreshInterval = refreshInterval
        configureRefreshControl()
    }
    
    private func configureRefreshControl() {
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    }
    
    func addToTableView(_ tableView: UITableView) {
        tableView.refreshControl = refreshControl
    }
    
    @objc private func handleRefresh() {
        Timer.scheduledTimer(timeInterval: refreshInterval, target: self, selector: #selector(endRefreshing), userInfo: nil, repeats: false)
    }
    
    @objc private func endRefreshing() {
        onRefresh?()
        refreshControl.endRefreshing()
    }
    
    func setRefreshInterval(_ interval: TimeInterval) {
        refreshInterval = interval
    }
}
