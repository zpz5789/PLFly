//
//  TBClosure.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/2/2.
//

import Foundation
import UIKit

/// View的闭包
public typealias ViewClosure = ((UITapGestureRecognizer?, UIView, NSInteger) ->Void)
/// 手势的闭包
public typealias RecognizerClosure = ((UIGestureRecognizer) ->Void)
/// UIControl闭包
public typealias ControlClosure = ((UIControl) ->Void)
