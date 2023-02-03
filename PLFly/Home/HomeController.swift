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
        self.view.backgroundColor = R.color.text333()
        self.view.backgroundColor = R.color.text666()
        self.view.backgroundColor = R.color.text999()

        // 设置UI
        setupUI()
        
        TBPrint(UIConstant.safeAreaInsets)
        TBPrint(UIConstant.safeAreaInsetsTop)
        TBPrint(UIConstant.statusBarHeight)
        TBPrint(UIConstant.navigionBarHeight)

        self.view.tb.addGestureTap { tap in
            TBPrint("sdfsf")
        }

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
        
        let btn = UIButton.jk.small(type: .red, height: 50).addTo(self.view)
        btn.snp.makeConstraints { make in
            make.top.equalTo(topBar.snp.bottom)
            make.left.equalTo(0)
        }
        
        let btn1 = UIButton.jk.normal().addTo(self.view)
        btn1.snp.makeConstraints { make in
            make.top.equalTo(btn.snp.bottom)
            make.left.equalTo(0)
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
