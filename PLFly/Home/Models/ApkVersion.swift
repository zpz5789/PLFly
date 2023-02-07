//
//  ApkVersion.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/2/7.
//

import Foundation
import ObjectMapper

class ApkVersion: Mappable {
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        currentVersion <- map["currentVersion"]
        versionDescribe <- map["versionDescribe"]
        downloadUrl <- map["downloadUrl"]
        force <- map["force"]
    }
    
    var currentVersion: String?
    var versionDescribe: String?
    var downloadUrl: String?
    var force: Bool = false
}
