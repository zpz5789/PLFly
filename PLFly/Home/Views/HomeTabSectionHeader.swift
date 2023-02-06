//
//  HomeTabSectionHeader.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/2/4.
//

import UIKit

class HomeTabSectionHeader: UIView {
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var jumpTitle: String = "" {
        didSet {
            jumpTitleLabel.text = jumpTitle
        }
    }
    
    private var titleLabel: UILabel = {
        let label = UILabel().color(TB.Color.text333).font(TB.Font.tabViewSectionTitle)
        return label
    }()
    
    private var jumpTitleLabel: UILabel = {
        let label = UILabel().color(TB.Color.text999).font(TB.Font.tabViewSectionJump)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.yellow
        
        let topView = UIView().backgroundColor(UIColor.hexIntColor(hexInt: 0xf5f5f5))
        self.addSubview(topView)

        let bottomView = UIView().backgroundColor(UIColor.white)
        self.addSubview(bottomView)

        bottomView.addSubview(titleLabel)
        bottomView.addSubview(jumpTitleLabel)
        
        topView.snp.makeConstraints { make in
            make.left.top.right.equalTo(0)
            make.height.equalTo(TB.Layout.sectionMargin)
        }
        
        bottomView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(0)
            make.top.equalTo(topView.snp.bottom)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(TB.Layout.marginLeft)
            make.centerY.equalTo(bottomView.snp.centerY)
        }
        
        jumpTitleLabel.snp.makeConstraints { make in
            make.right.equalTo(TB.Layout.marginRight)
            make.centerY.equalTo(bottomView.snp.centerY)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
