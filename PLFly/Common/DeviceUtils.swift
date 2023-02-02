//
//  DeviceUtils.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/2/1.
//

import Foundation

struct DeviceUtils {
    public static func keyWindow() -> UIWindow? {
        var window :UIWindow? = nil
        if #available(iOS 13.0, *) {
            window = UIApplication.shared.connectedScenes.filter({ $0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
            
        } else {
            window = UIApplication.shared.keyWindow
        }
        
        if window == nil || window?.windowLevel != .normal {
            let windows = UIApplication.shared.windows
            for tmpwin in windows {
                window = tmpwin
                break
            }
        }
        
        return window
    }
    
}
