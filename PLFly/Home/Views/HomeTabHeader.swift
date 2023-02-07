//
//  HomeTabHeader.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/2/4.
//

import UIKit

class HomeTabHeader: UIView {
    
    /// banner区
    private lazy var bannerView: UIView = {
        let banner = UIImageView(frame: CGRect(x: 0, y: 0, width: TB.screenWidth, height: 250))
        banner.image = UIImage.init(named: "banner2")
        return banner
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
        print(functionView)
        self.addSubview(functionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
