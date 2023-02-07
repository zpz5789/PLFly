//
//  HomeTabHeader.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/2/4.
//

import UIKit
import FSPagerView
import Kingfisher

class HomeTabHeader: UIView {
    
    var bannerDataSource: [BannerVo] = [] {
        didSet {
            pageControl.numberOfPages = bannerDataSource.count
            pageControl.currentPage = 0
            bannerView.reloadData()
        }
    }
    
    /// banner区
    private lazy var bannerView: FSPagerView = { [weak self] in
        let pagerView = FSPagerView(frame: CGRectMake(0, 0, TB.screenWidth, 250))
        pagerView.delegate = self
        pagerView.dataSource = self
        pagerView.automaticSlidingInterval = 3
        pagerView.isInfinite = true
        pagerView.itemSize = FSPagerView.automaticSize
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "bannerCell")
        return pagerView
    }()
    
    private lazy var pageControl: FSPageControl = {
        let pageControl = FSPageControl(frame: CGRectMake(CGRectGetWidth(self.bannerView.frame)/2.0 - 40, CGRectGetMaxY(self.bannerView.frame) - 30, 100, 30))
//        pageControl.backgroundColor = UIColor.lightGray
        pageControl.numberOfPages = self.bannerDataSource.count
        pageControl.contentHorizontalAlignment = .center
        pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        pageControl.hidesForSinglePage = true
        return pageControl
    }()
    
    /// 功能区
    private lazy var functionView: UIStackView = {
        var buttons: [UIButton] = Array()
        var titles: [(String, UIImage)] = [
            ("课程", R.image.homepage_course()!),
            ("职位", R.image.homepage_job()!),
            ("学院", R.image.homepage_school()!),
            ("发现", R.image.homepage_find()!)
        ]
        for (title, image) in titles {
            let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 100)).title(title).image(image).textColor(TB.Color.text333)
            btn.tb.setImageTitleLayout(.imgTop)
            buttons.append(btn)
        }
        let functionView = UIStackView(frame: CGRectMake(0, CGRectGetMaxY(bannerView.frame), TB.screenWidth, 100)).set(distribution: .fillEqually)
        buttons.forEach { button in
            functionView.addArrangedSubview(button)
        }
        return functionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(bannerView)
        self.addSubview(functionView)
        self.addSubview(pageControl)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - FSPagerViewDataSource
extension HomeTabHeader: FSPagerViewDataSource, FSPagerViewDelegate {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return bannerDataSource.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "bannerCell", at: index)
        let banner = self.bannerDataSource[index]
        let url = URL(string: TBImageBaseURL + banner.imagesUrl)
        cell.imageView?.kf.setImage(with: url)
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControl.currentPage = targetIndex
    }
    
    func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        self.pageControl.currentPage = index
    }
}
