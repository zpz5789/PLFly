//
//  DateFormatter+TBExtension.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/2/2.
//

import Foundation

/*
 DateFormatter 创建实例很耗时，如果多次创建 DateFormatter 实例，它可能会减慢app 响应速度，甚至更快地耗尽手机电池的电量。
 */
public let tb_formatter = DateFormatter()

// MARK: - 一、基本扩展
public extension DateFormatter {

    // MARK: 1.1、格式化快捷方式
    /// 格式化快捷方式
    /// - Parameter format: 格式
    convenience init(format: String) {
        self.init()
        dateFormat = format
    }
}
