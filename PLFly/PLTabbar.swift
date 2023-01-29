//
//  PLTabbar.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/1/11.
//


import UIKit
import Foundation

class PLTabbar: UITabBar {
    
    override class func initialize() {
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(r: 100, g: 100, b: 100)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
