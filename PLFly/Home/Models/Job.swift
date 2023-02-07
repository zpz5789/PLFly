//
//  Job.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/2/7.
//

import Foundation
import ObjectMapper

class Job: Mappable {
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        id <- map["id"]
        name <- map["name"]
        cpId <- map["cpId"]
        cpName <- map["cpName"]
        cpImage <- map["cpImage"]
        cpSize <- map["cpSize"]
        cityName <- map["cityName"]
        workTime <- map["workTime"]
        price <- map["price"]
        tags <- map["tags"]
        certifiState <- map["certifiState"]
        jobType <- map["jobType"]
        cpIndustrys <- map["cpIndustrys"]
        degreeValueStr <- map["degreeValueStr"]
        workYear <- map["workYear"]
        regionName <- map["regionName"]
    }
    
    var id: String = ""
    var name: String = ""
    var cpId: String = ""
    var cpName: String = ""
    var cpImage: String = ""
    var cpSize: String = ""
    var cityName: String = ""
    var workTime: String = ""
    var price: String = ""
    var tags: String = ""
    var certifiState: Int = 0
    var jobType: Int = 0
    var cpIndustrys: String = ""
    var degreeValueStr: String = ""
    var workYear: String = ""
    var regionName: String = ""
}
