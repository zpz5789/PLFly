//
//  AppCourse.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/2/7.
//

import Foundation
import ObjectMapper

class Course: Mappable {
    required init?(map: ObjectMapper.Map) {
        
    }
    
    func mapping(map: ObjectMapper.Map) {
        courseId <- map["courseId"]
        courseName <- map["courseName"]
        courseIsPay <- map["courseIsPay"]
        courseCurrentprice <- map["courseCurrentprice"]
        courseLogo <- map["courseLogo"]
        courseMobileLogo <- map["courseMobileLogo"]
        courseKnum <- map["courseKnum"]
        courseViewcount <- map["courseViewcount"]
        courseVommentcount <- map["courseVommentcount"]
        courseWatchpersoncount <- map["courseWatchpersoncount"]
        courseMonthlyPay <- map["courseMonthlyPay"]
        isListen <- map["isListen"]
        gdu <- map["gdu"]
        tnum <- map["tnum"]
        isPay <- map["isPay"]
        sourceprice <- map["sourceprice"]
        losetype <- map["losetype"]
        crsid <- map["crsid"]
        isJoin <- map["isJoin"]
        actFormId <- map["actFormId"]
        courseChannel <- map["courseChannel"]
        tagSubjId <- map["tagSubjId"]
        isclock <- map["isclock"]
        zqtshow <- map["zqtshow"]
        zhyxshow <- map["zhyxshow"]
        courseTop <- map["courseTop"]
        applePrice <- map["applePrice"]
    }
    
    var courseId: String = ""
    var courseName: String = ""
    var courseIsPay: Bool?
    var courseCurrentprice: Float = 0.0
    var courseLogo: String?
    var courseMobileLogo: String = ""
    var courseKnum: Int = 0
    var courseViewcount: String = ""
    var courseVommentcount: Int = 0
    var courseWatchpersoncount: Int = 0
    var courseMonthlyPay: String?
    var isListen: Bool?
    var gdu: String = ""
    var tnum: Int = 0
    var isPay: Bool?
    var sourceprice: Float?
    var losetype: Int?
    var level: String = ""
    var crsid: Int?
    var isJoin: Int?
    var actFormId: Int?
    var courseChannel: Int?
    var tagSubjId: Int?
    var isclock: Int?
    var zqtshow: Int?
    var zhyxshow: Int?
    var courseTop: Int?
    var applePrice: Float?
}
