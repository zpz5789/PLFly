//
//  API.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/2/6.
//

import Foundation
import Moya

enum APIHome {
    /// 首页接口
    case newIndex(parameters:[String: Any])
    /// 首页职位
    case job(parameters:[String: Any])
}

extension APIHome: TargetType {
    var baseURL: URL {
        URL.init(string: "http://www.zhiqiantong.cn/app/")!
    }
    
    var path: String {
        switch self {
        case .newIndex:
            return "newIndex"
        case .job:
            return "newIndex/job"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Moya.Task {
        switch self {
        case let .newIndex(parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        case let .job(parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return [
            "User-Agent" : "ZhiQianTong/0.10 (iPhone; iOS 15.7.1; Scale/2.00)"]
//                "Content-Type" : "application/x-www-form-urlencoded",
//                "Accept-Language" : "zh-Hans-CN;q=1",
//                "Accept-Encoding" : "gzip, deflate",
//                "Host" : "www.zhiqiantong.cn",
//                "Accept" : "*/*"]
    }
    
    
}
