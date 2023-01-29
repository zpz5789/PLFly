//
//  Monitor.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/1/29.
//

import Foundation

@objcMembers class Monitor: NSObject {
    @objc class func swiftLoad() {
        print("swift load")
    }
    
    @objc class func swiftInitialize() {
        print("swift initialize")
    }
}
