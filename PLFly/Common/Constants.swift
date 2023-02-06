//
//  Const.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/1/30.
//  一些常量

import Foundation
import UIKit


struct TB {
    /// 状态栏高度
    public static let statusBarHeight: CGFloat = getStatusBarHeight()

    /// 导航栏高度
    public static let navigionBarHeight: CGFloat = Self.statusBarHeight + 44.0
    
    /// 安全区
    public static let safeAreaInsets: (top: CGFloat, bottom: CGFloat) = getSafeAreaInsets()
    
    /// 顶部安全区高度
    public static let safeAreaInsetsTop: CGFloat = Self.safeAreaInsets.top

    /// 底部安全区高度
    public static let safeAreaInsetsBottom: CGFloat = Self.safeAreaInsets.bottom
        
    /// 屏幕宽度
    public static let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    /// 屏幕高度
    public static let screenHeight: CGFloat = UIScreen.main.bounds.height

    /// 分割线高度
    public static let separatorHeight: CGFloat = 1.0 / UIScreen.main.scale
}

extension TB {
    private static func getStatusBarHeight() -> CGFloat {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.size.height ?? 0
        } else {
            return UIApplication.shared.statusBarFrame.size.height
        }
    }
    
    private static func getSafeAreaInsets () -> (top: CGFloat, bottom: CGFloat) {
        if #available(iOS 11.0, *) {
            let inset = DeviceUtils.keyWindow()?.safeAreaInsets
            return (inset?.top ?? 0, inset?.bottom ?? 0)
        } else {
            return (0, 0)
        }
    }
}

extension TB {
    struct Color {
        /// 主题蓝
        public static let themeBlue: UIColor = UIColor.hexStringColor(hexString: "#2e73ff")
        ///  文本333
        public static let text333: UIColor = UIColor.hexStringColor(hexString: "#333333")
        ///  文本666
        public static let text666: UIColor = UIColor.hexStringColor(hexString: "#333333")
        ///  文本999
        public static let text999: UIColor = UIColor.hexStringColor(hexString: "#333333")
    }

    struct Font {
        /// tabViewSectionTitle 文本
        public static let tabViewSectionTitle: UIFont = UIFont.systemFont(ofSize: 16)
        /// tabViewSectionJump 文本
        public static let tabViewSectionJump: UIFont = UIFont.systemFont(ofSize: 13)
    }
    
    struct Layout {
        public static let sectionMargin: CGFloat = 10.0
        public static let marginLeft: CGFloat = 13.0
        public static let marginRight: CGFloat = -13.0

    }
}
