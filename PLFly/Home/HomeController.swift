//
//  HomeController.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/1/28.
//

import UIKit
import SnapKit

class HomeController: UIViewController {
    
    private var topBar: HomeNavBar = HomeNavBar()
    
    private lazy var tableView: UITableView = {[weak self] in
        let tableView = UITableView(frame: CGRectZero, style: .grouped)
        tableView.backgroundColor = UIColor.lightGray
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // 设置UI
        setupUI()
        
        Log.info(UIConstant.safeAreaInsets)
        Log.info(UIConstant.safeAreaInsetsTop)
        Log.info(UIConstant.statusBarHeight)
        Log.info(UIConstant.navigionBarHeight)

    }
}

// MARK: - UITableViewDelegate
extension HomeController {
    private func setupUI() {
        self.view.addSubview(topBar)
        topBar.snp.makeConstraints { make in
            make.left.right.top.equalTo(0)
            make.height.equalTo(UIConstant.navigionBarHeight)
        }
    }
}


// MARK: - UITableViewDelegate
extension HomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: - UITableViewDataSource
extension HomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
