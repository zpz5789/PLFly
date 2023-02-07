//
//  AppLineCourseBanner.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/2/7.
//

import Foundation
import ObjectMapper

class AppLineCourseBanner: Mappable {
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        id <- map["id"]
        imagesUrl <- map["imagesUrl"]
        title <- map["title"]
        contentType <- map["contentType"]
        contentId <- map["contentId"]
        sort <- map["sort"]
        mediaType <- map["mediaType"]
        waitingTime <- map["waitingTime"]
    }
    
    var id:Int = 0
    var imagesUrl: String = ""
    var title:String?
    var contentType:Int = 0
    var contentId: String?
    var sort: Int = 0
    var mediaType: Int = 0
    var waitingTime: Float?
}
