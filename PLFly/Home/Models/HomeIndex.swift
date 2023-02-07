//
//  HomeIndex.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/2/7.
//

import Foundation
import ObjectMapper

class HomeIndex: Mappable {
    required init?(map: ObjectMapper.Map) {
    }
    
    func mapping(map: ObjectMapper.Map) {
        unReadNum <- map["unReadNum"]
        jobCount <- map["jobCount"]
        articleCount <- map["articleCount"]
        quizProblemCount <- map["quizProblemCount"]
        appBannerVos <- map["appBannerVos"]
        courseList <- map["courseList"]
        appLineCourseBannerList <- map["appLineCourseBannerList"]
        appIndexCustomBanner <- map["appIndexCustomBanner"]
        apkVersion <- map["apkVersion"]
    }
    
    var unReadNum: Int = 0
    var jobCount: String?
    var articleCount: String?
    var quizProblemCount: String?
    var appBannerVos: [BannerVo]?
    var courseList: [Course]?
    var appLineCourseBannerList: [AppLineCourseBanner]?
    var appIndexCustomBanner: [Any]?
    var apkVersion: [ApkVersion]?
}
