//
//  AppDelegate.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/1/11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 2、将字符串转成大写
//        var tempHex = "0xffffff".uppercased()
//        // 检查字符串是否拥有特定前缀
//        // hasPrefix(prefix: String)
//        // 检查字符串是否拥有特定后缀。
//        // hasSuffix(suffix: String)
//        // 3、判断开头： 0x/#/##
//        if tempHex.hasPrefix("0X") || tempHex.hasPrefix("##") {
//            let index = tempHex.index(tempHex.startIndex, offsetBy: 2)
//            tempHex[tempHex.startIndex..<tempHex.endIndex]
//            let a = tempHex[tempHex.index(tempHex.startIndex, offsetBy: 2)..<tempHex.endIndex]
//            tempHex = String(tempHex[tempHex.index(tempHex.startIndex, offsetBy: 2)..<tempHex.endIndex])
//
//            String(a)
//        }
//
//        print(tempHex)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

