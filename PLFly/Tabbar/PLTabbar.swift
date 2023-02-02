//
//  PLTabbar.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/1/11.
//


import UIKit
import Foundation
import JKSwiftExtension

class PLTabbar: UITabBar {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        NotificationCenter.default.addObserver(self, selector: #selector(homeTitleAddButtonClicked), name: NSNotification.Name("HomeTitleAddButtonClicked"), object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    
    /// 点击了加号按钮
    @objc private func homeTitleAddButtonClicked(notification: Notification) {
        TBPrint("dfdsfsfsfsfd")
    }
}

//NSFontAttributeName
extension PLTabbar : NSSwiftLoadProtocol {
    public static func swiftLoad() {
        print("调用 MYNetworkConfig swiftLoad 方法初始化网络数据成功~~~")
    }
    public static func swiftInitialize() {
        let color = UIColor(hexString: "5f5f6b")
        var attrs = Dictionary<NSAttributedString.Key, Any>()
        attrs[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 10, weight: .medium)
        attrs[NSAttributedString.Key.foregroundColor] = color
        
        let selectColor = UIColor(hexInt: 0x2e73ff)
        var selAttrs = Dictionary<NSAttributedString.Key, Any>()
        selAttrs[NSAttributedString.Key.font] = UIFont.systemFont(ofSize: 10, weight: .medium)
        selAttrs[NSAttributedString.Key.foregroundColor] = selectColor
        
        let tabbarItem = UITabBarItem.appearance();
        tabbarItem.setTitleTextAttributes(attrs, for: .normal)
        tabbarItem.setTitleTextAttributes(selAttrs, for: .selected)
        
        let tabbar = PLTabbar.appearance()
        if #available(iOS 13.0, *) {
            tabbar.unselectedItemTintColor = color
        }
        tabbar.isTranslucent = false
        tabbar.backgroundImage = UIImage.jk.image(color: UIColor.white)
    }
}
