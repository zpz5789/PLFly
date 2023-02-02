//
//  Bool+TBExtention.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/2/2.
//

import Foundation

extension Bool: TBPOPCompatible {}
// MARK: - 一、基本的扩展
public extension TBPOP where Base == Bool {
 
    // MARK: 1.1、Bool 值转 Int
    /// Bool 值转 Int
    var boolToInt: Int { return self.base ? 1 : 0 }
}
