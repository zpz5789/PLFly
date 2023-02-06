//
//  HomeController.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/1/28.
//

import UIKit
import SnapKit
import JKSwiftExtension
import MJRefresh

class HomeController: UIViewController {
    
    private var topBar: HomeNavBar = HomeNavBar()
    
    private lazy var tableView: UITableView = {[weak self] in
        let tableView = UITableView(frame: CGRectZero, style: .plain)
//        tableView.backgroundColor = UIColor.lightGray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tb.tableViewNeverAdjustContentInset()
        tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self!, refreshingAction: #selector(headerRefresh))
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self!, refreshingAction: #selector(footerRefresh))
        tableView.tableHeaderView(HomeTabHeader(frame: CGRect(x: 0, y: 0, width: TB.screenWidth, height: 350)))
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden(true)
        // 设置UI
        setupUI()
    }
}

// MARK: - UITableViewDelegate
extension HomeController {
    private func setupUI() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets.zero)
        }
        
        self.view.addSubview(topBar)
        topBar.snp.makeConstraints { make in
            make.left.right.top.equalTo(0)
            make.height.equalTo(TB.navigionBarHeight)
        }
        
    }
    
    @objc private func footerRefresh() {
        
    }
    
    @objc private func headerRefresh() {
        
    }

}


// MARK: - UITableViewDelegate
extension HomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = HomeTabSectionHeader(frame: CGRectMake(0, 0, TB.screenWidth, 40))
        sectionHeader.title = "学习推荐"
        sectionHeader.jumpTitle = "更多"
        return sectionHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

// MARK: - UITableViewDataSource
extension HomeController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
