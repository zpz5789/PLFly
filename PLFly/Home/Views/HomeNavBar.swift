//
//  HomeNavBar.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/2/1.
//

import Foundation
import UIKit
import SnapKit
class HomeNavBar: UIView {
    
    private lazy var locationBtn: UIButton = {
        var btn = UIButton()
        btn.setImage(R.image.downArrow_gray(), for: .normal)
        btn.setTitle("深圳", for: .normal)
//        btn.backgroundColor = UIColor.red
        btn.boldFont(15).textColor(UIColor.hexIntColor(hexInt: 0x333333))
        btn.tb.touchExtendInset = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -50)
        btn.addTarget(self, action: #selector(goLocationCityPick), for: .touchUpInside)
        return btn
    }()
    
    private lazy var scanBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "downArrow"), for: .normal)
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(goScanQRcode), for: .touchUpInside)
        return btn
    }()
    
    private lazy var searchPlaceView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        let imageView = UIImageView(image: R.image.nav_search())
        let textLabel = UILabel().text("搜索我感兴趣的内容")
        view.addSubview(imageView)
        view.addSubview(textLabel)
        imageView.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.centerY.equalTo(view)
        }
        textLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp_rightMargin).offset(10)
            make.centerY.equalTo(view)
        }
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Theme.blue
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        self.addSubview(locationBtn)
        self.addSubview(scanBtn)
        self.addSubview(searchPlaceView)
        locationBtn.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.bottom.equalTo(0)
//            make.height.equalTo(40)
            make.width.equalTo(locationBtn.intrinsicContentSize.width)
        }
        scanBtn.snp.makeConstraints { make in
            make.right.equalTo(-20)
            make.bottom.equalTo(0)
        }
        searchPlaceView.snp.makeConstraints { make in
            make.left.equalTo(locationBtn.snp_rightMargin).offset(15)
            make.centerY.equalTo(locationBtn)
            make.right.equalTo(scanBtn.snp_leftMargin).offset(-10)
            make.height.equalTo(30)
//            make.width.greaterThanOrEqualTo(100)
        }
        locationBtn.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)
        searchPlaceView.setContentCompressionResistancePriority(UILayoutPriority.required, for: .horizontal)
    }
    
    @objc private func goLocationCityPick() {
//        TBPrint("goLocationCityPick")
    }
    
    @objc private func goScanQRcode() {
//        TBPrint("goScanQRcode")
    }

}
