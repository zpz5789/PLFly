//
//  UIButton+TBExtention.swift
//  TangBull666
//
//  Created by 曾鹏展 on 2023/2/1.
//

import Foundation
import UIKit

extension UIButton: TBPOPCompatible {}

public extension TBPOP where Base: UIButton {
    
    enum ButtonContentLayoutStyle {
        case imageTopTextBottom
        case imageLeftTextRight
        case imageBottomTextTop
        case imageRightTextLeft
    }

    func contentLayoutStyle(style: ButtonContentLayoutStyle, space: CGFloat) -> Void {
        /**
         *  知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
         *  如果只有title，那它上下左右都是相对于button的，image也是一样；
         *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
         */
        // 1. 得到imageView和titleLabel的宽、高
        let imageWith = base.imageView?.frame.size.width ?? 0
        let imageHeight = base.imageView?.frame.size.height ?? 0
        
        let labelWidth = base.titleLabel?.intrinsicContentSize.width ?? 0
        let labelHeight = base.titleLabel?.intrinsicContentSize.height ?? 0
        
        // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets: UIEdgeInsets = UIEdgeInsets.zero;
        var labelEdgeInsets: UIEdgeInsets = UIEdgeInsets.zero;
                
        // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch (style) {
            case .imageTopTextBottom:
            imageEdgeInsets = UIEdgeInsets(top: (-labelWidth - space)/2.0, left: 0, bottom: 0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith, bottom: -imageHeight-space/2.0, right: 0)
            case .imageLeftTextRight:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: space/2.0)
            labelEdgeInsets = UIEdgeInsets(top: 0, left: space/2.0, bottom: 0, right: -space/2.0)
            case .imageBottomTextTop:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-space/2.0, right: -labelWidth)
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight-space/2.0, left: -imageWith, bottom: 0, right: 0);
            case .imageRightTextLeft:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+space/2.0, bottom: 0, right: -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith-space/2.0, bottom: 0, right: imageWith+space/2.0);
        }
        
        // 4. 赋值
        base.titleEdgeInsets = labelEdgeInsets;
        base.imageEdgeInsets = imageEdgeInsets;
    }
}

// MARK: Button扩大点击事件
private var TBUIButtonExpandSizeKey = "TBUIButtonExpandSizeKey"
public extension UIButton {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if self.tb.touchExtendInset == .zero || isHidden || !isEnabled {
            super.point(inside: point, with: event)
        }
        var hitFrame = bounds.inset(by: self.tb.touchExtendInset)
        hitFrame.size.width = max(hitFrame.size.width, 0)
        hitFrame.size.height = max(hitFrame.size.height, 0)
        return hitFrame.contains(point)
    }
}

public extension TBPOP where Base: UIButton {
    
    // MARK: 6.1、扩大UIButton的点击区域，向四周扩展10像素的点击范围
    /// 扩大按钮点击区域 如UIEdgeInsets(top: -50, left: -50, bottom: -50, right: -15)将点击区域上下左右各扩充50
    ///
    /// 提示：theView 扩展点击相应区域时，其扩展的区域不能超过 superView 的 frame ，否则不会相应改点击事件；如果需要响应点击事件，需要对其 superView 进行和 theView 进行同样的处理
    var touchExtendInset: UIEdgeInsets {
        get {
            if let value = objc_getAssociatedObject(self.base, &TBUIButtonExpandSizeKey) {
                var edgeInsets: UIEdgeInsets = UIEdgeInsets.zero
                (value as AnyObject).getValue(&edgeInsets)
                return edgeInsets
            } else {
                return UIEdgeInsets.zero
            }
        }
        set {
            objc_setAssociatedObject(self.base, &TBUIButtonExpandSizeKey, NSValue(uiEdgeInsets: newValue), .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
