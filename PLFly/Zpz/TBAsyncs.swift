//
//  TBAsyncs.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/2/2.
//

import Foundation

// 事件闭包
public typealias TBTask = () -> Void

// MARK: - 延迟事件
public struct TBAsyncs {
    // MARK: 1.1、异步做一些任务
    /// 异步做一些任务
    /// - Parameter TBTask: 任务
    @discardableResult
    public static func async(_ TBTask: @escaping TBTask) -> DispatchWorkItem {
        return _asyncDelay(0, TBTask)
    }
    
    // MARK: 1.2、异步做任务后回到主线程做任务
    /// 异步做任务后回到主线程做任务
    /// - Parameters:
    ///   - TBTask: 异步任务
    ///   - mainTBTask: 主线程任务
    @discardableResult
    public static func async(_ TBTask: @escaping TBTask,
                             _ mainTBTask: @escaping TBTask) -> DispatchWorkItem{
        return _asyncDelay(0, TBTask, mainTBTask)
    }
    
    // MARK: 1.3、异步延迟(子线程执行任务)
    /// 异步延迟(子线程执行任务)
    /// - Parameter seconds: 延迟秒数
    /// - Parameter TBTask: 延迟的block
    @discardableResult
    public static func asyncDelay(_ seconds: Double,
                                  _ TBTask: @escaping TBTask) -> DispatchWorkItem {
        return _asyncDelay(seconds, TBTask)
    }
    
    // MARK: 1.4、异步延迟回到主线程(子线程执行任务，然后回到主线程执行任务)
    /// 异步延迟回到主线程(子线程执行任务，然后回到主线程执行任务)
    /// - Parameter seconds: 延迟秒数
    /// - Parameter TBTask: 延迟的block
    /// - Parameter mainTBTask: 延迟的主线程block
    @discardableResult
    public static func asyncDelay(_ seconds: Double,
                                  _ TBTask: @escaping TBTask,
                                  _ mainTBTask: @escaping TBTask) -> DispatchWorkItem {
        return _asyncDelay(seconds, TBTask, mainTBTask)
    }
}

// MARK: - 私有的方法
extension TBAsyncs {
    
    /// 延迟任务
    /// - Parameters:
    ///   - seconds: 延迟时间
    ///   - TBTask: 任务
    ///   - mainTBTask: 任务
    /// - Returns: DispatchWorkItem
    fileprivate static func _asyncDelay(_ seconds: Double,
                                        _ TBTask: @escaping TBTask,
                                        _ mainTBTask: TBTask? = nil) -> DispatchWorkItem {
        let item = DispatchWorkItem(block: TBTask)
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + seconds,
                                          execute: item)
        if let main = mainTBTask {
            item.notify(queue: DispatchQueue.main, execute: main)
        }
        return item
    }
}
