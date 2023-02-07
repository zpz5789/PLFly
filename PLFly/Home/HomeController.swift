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
import Moya
import Alamofire

class HomeController: UIViewController {
    
    private var topBar: HomeNavBar = HomeNavBar()
    
    private var tabHeader: HomeTabHeader = HomeTabHeader(frame: CGRect(x: 0, y: 0, width: TB.screenWidth, height: 350))
    
    private var homeIndex: HomeIndex?
    
    private var jobDataSource: [Any] = Array()
    
    private lazy var tableView: UITableView = {[weak self] in
        let tableView = UITableView(frame: CGRectZero, style: .plain)
        //        tableView.backgroundColor = UIColor.lightGray
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tb.tableViewNeverAdjustContentInset()
        tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self!, refreshingAction: #selector(headerRefresh))
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self!, refreshingAction: #selector(footerRefresh))
        tableView.tableHeaderView(tabHeader)
        tableView.tb.register(cellClass: HomeAdCell.self)
        tableView.tb.register(cellClass: CourseCell.self)
        tableView.tb.register(cellClass: PositionCell.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden(true)
        // 设置UI
        setupUI()
        // 网络请求
        request()
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
    
    private func request() {

        NetWorkRequest(APIHome.newIndex(parameters: ["sctName":"深圳", "userId":"291952", "ctName":"深圳"]), modelType: HomeIndex.self) { homeIndex, _ in
            self.homeIndex = homeIndex
            self.tableView.reloadData()
            self.tabHeader.bannerDataSource = self.homeIndex?.appBannerVos ?? []
        }
        
        NetWorkRequest(APIHome.job(parameters: ["sctName":"深圳", "userId":"291952", "ctName":"深圳", "currentPage":1, "pageSize": 10]), modelType: [Job].self, tagetMapKey: "jobs") { jobs, _ in
            self.jobDataSource = jobs
            self.tableView.reloadData()
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
        if homeIndex != nil {
            return 2
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.homeIndex!.courseList!.count + 1
        } else {
            return jobDataSource.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let adCell = tableView.tb.dequeueReusableCell(cellType: HomeAdCell.self, cellForRowAt: indexPath)
                adCell.setAppLineCourseBannerList(list: self.homeIndex?.appLineCourseBannerList ?? [])
                return adCell
            } else {
                let courseCell = tableView.tb.dequeueReusableCell(cellType: CourseCell.self, cellForRowAt: indexPath)
                courseCell.setCourse(course: self.homeIndex?.courseList?[indexPath.row - 1])
                return courseCell
            }
        } else {
            let jobCell = tableView.tb.dequeueReusableCell(cellType: PositionCell.self, cellForRowAt: indexPath)
            let job = self.jobDataSource[indexPath.row] as! Job
            jobCell.setJob(job: job)
            return jobCell
        }
    }
}
