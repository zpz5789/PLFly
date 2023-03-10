//
//  TBPOP.swift
//  TangBull666
//
//  Created by 曾鹏展 on 2023/1/30.
//

import Foundation
import UIKit

public struct TBPOP<Base> {
    let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

public protocol TBPOPCompatible {}

public extension TBPOPCompatible {
    static var tb: TBPOP<Self>.Type {
        get {
            TBPOP<Self>.self
        }
        set {}
    }
    
    var tb: TBPOP<Self> {
        get {TBPOP(self)}
        set {}
    }
}

/// Define Property protocol
internal protocol TBSwiftPropertyCompatible {
  
    /// Extended type
    associatedtype T
    
    ///Alias for callback function
    typealias SwiftCallBack = ((T?) -> ())
    
    ///Define the calculated properties of the closure type
    var swiftCallBack: SwiftCallBack?  { get set }
}



