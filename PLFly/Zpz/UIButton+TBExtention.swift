//
//  UIButton+TBExtention.swift
//  TangBull666
//
//  Created by 曾鹏展 on 2023/2/1.
//

import Foundation
import UIKit

// MARK: - 带有样式的button
private enum LineType {
    case none
    case color(_: UIColor)
}

// MARK: - 一、基本的扩展
public extension TBPOP where Base: UIButton {
    enum SmallButtonType {
        case red
        case pink
    }
    
    // MARK: 1.1、创建一个带颜色的 Button
    /// 创建一个带颜色的 Button
    /// - Parameters:
    ///   - type: 类型
    ///   - height: 高度
    /// - Returns: 返回自身
    @discardableResult
    static func small(type: SmallButtonType = .red, height: CGFloat = 45) -> UIButton {
        let normalColor: UIColor
        let disabledColor: UIColor
        let lineTypeNormal: LineType
        let lineTypeDisable: LineType
        let titleColorNormal: UIColor
        let titleColorDisable: UIColor
        
        switch type {
        case .red:
            normalColor = .hexStringColor(hexString: "#E54749")
            disabledColor = .hexStringColor(hexString: "#CCCCCC")
            lineTypeNormal = .none
            lineTypeDisable = .none
            titleColorNormal = .white
            titleColorDisable = .white
        case .pink:
            normalColor = .hexStringColor(hexString: "#FFE8E8")
            disabledColor = .hexStringColor(hexString: "#CCCCCC")
            lineTypeNormal = .color(.hexStringColor(hexString: "#F6CDCD"))
            lineTypeDisable = .color(.hexStringColor(hexString: "#9C9C9C"))
            titleColorNormal = .hexStringColor(hexString: "#E54749")
            titleColorDisable = .white
        }
        
        let btn = UIButton(type: .custom).font(.systemFont(ofSize: 16))
        btn.setTitleColor(titleColorNormal, for: .normal)
        btn.setTitleColor(titleColorDisable, for: .disabled)
        btn.setBackgroundImage(drawSmallBtn(color: normalColor, height: height, lineType: lineTypeNormal), for: .normal)
        btn.setBackgroundImage(drawSmallBtn(color: disabledColor, height: height, lineType: lineTypeDisable), for: .disabled)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 13, right: 0)
        return btn
    }
    
    // MARK: 1.2、创建一个常规的 Button
    /// 创建一个常规的 Button
    /// - Returns: 返回自身
    static func normal() -> UIButton {
        let btn = UIButton(type: .custom).font(.boldSystemFont(ofSize: 18))
        btn.setTitleColor(.white, for: .normal)
        btn.setTitleColor(.white, for: .disabled)
        btn.setBackgroundImage(drawNormalBtn(color: .hexStringColor(hexString: "#E54749"))?.resizableImage(withCapInsets: UIEdgeInsets(top: 10, left: 15, bottom: 15, right: 15)), for: .normal)
        btn.setBackgroundImage(drawNormalBtn(color: .hexStringColor(hexString: "#CCCCCC"))?.resizableImage(withCapInsets: UIEdgeInsets(top: 10, left: 15, bottom: 15, right: 15)), for: .disabled)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0)
        return btn
    }
    
    private static func drawSmallBtn(color: UIColor, height: CGFloat, lineType: LineType) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 200, height: height + 20)
        let path = UIBezierPath(roundedRect: CGRect(x: 10, y: 3, width: 180, height: height), cornerRadius: height / 2)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.addPath(path.cgPath)
        context?.setShadow(offset: CGSize(width: 1, height: 4), blur: 10, color: color.withAlphaComponent(0.5).cgColor)
        context?.fillPath()
        switch lineType {
        case let .color(color):
            color.setStroke()
            path.lineWidth = 1.0 / UIScreen.main.scale
            path.stroke()
        default:
            break
        }
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    private static func drawNormalBtn(color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 260, height: 50)
        let path = UIBezierPath(roundedRect: CGRect(x: 10, y: 3, width: 240, height: 40), cornerRadius: 3)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.addPath(path.cgPath)
        context?.setShadow(offset: CGSize(width: 1, height: 2), blur: 6, color: color.withAlphaComponent(0.5).cgColor)
        context?.fillPath()
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    //MARK: 1.3、设置背景色
    /// 设置背景色
    /// - Parameters:
    ///   - color: 背景色
    ///   - forState: 状态
    func setBackgroundColor(_ color: UIColor, forState: UIControl.State) {
        self.base.setBackgroundImage(backgroundImage(color), for: forState)
    }
    
    private func backgroundImage(_ color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()?.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return colorImage
    }
}

// MARK: - 二、链式调用
public extension UIButton {
    
    // MARK: 2.1、设置title
    /// 设置title
    /// - Parameters:
    ///   - text: 文字
    ///   - state: 状态
    /// - Returns: 返回自身
    @discardableResult
    func title(_ text: String, _ state: UIControl.State = .normal) -> Self {
        setTitle(text, for: state)
        return self
    }
    
    // MARK: 2.2、设置文字颜色
    /// 设置文字颜色
    /// - Parameters:
    ///   - color: 文字颜色
    ///   - state: 状态
    /// - Returns: 返回自身
    @discardableResult
    func textColor(_ color: UIColor, _ state: UIControl.State = .normal) -> Self {
        setTitleColor(color, for: state)
        return self
    }
    
    // MARK: 2.3、设置字体大小(UIFont)
    /// 设置字体大小
    /// - Parameter font: 字体 UIFont
    /// - Returns: 返回自身
    @discardableResult
    func font(_ font: UIFont) -> Self {
        titleLabel?.font = font
        return self
    }
    
    // MARK: 2.4、设置字体大小(CGFloat)
    /// 设置字体大小(CGFloat)
    /// - Parameter fontSize: 字体的大小
    /// - Returns: 返回自身
    @discardableResult
    func font(_ fontSize: CGFloat) -> Self {
        titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        return self
    }
    
    // MARK: 2.5、设置字体粗体
    /// 设置粗体
    /// - Parameter fontSize: 设置字体粗体
    /// - Returns: 返回自身
    @discardableResult
    func boldFont(_ fontSize: CGFloat) -> Self {
        titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        return self
    }
    
    // MARK: 2.6、设置图片
    /// 设置图片
    /// - Parameters:
    ///   - image: 图片
    ///   - state: 状态
    /// - Returns: 返回自身
    @discardableResult
    func image(_ image: UIImage?, _ state: UIControl.State = .normal) -> Self {
        setImage(image, for: state)
        return self
    }
    
    // MARK: 2.7、设置图片(通过Bundle加载)
    /// 设置图片(通过Bundle加载)
    /// - Parameters:
    ///   - bundle: Bundle
    ///   - imageName: 图片名字
    ///   - state: 状态
    /// - Returns: 返回自身
    @discardableResult
    func image(in bundle: Bundle? = nil, _ imageName: String, _ state: UIControl.State = .normal) -> Self {
        let image = UIImage(named: imageName, in: bundle, compatibleWith: nil)
        setImage(image, for: state)
        return self
    }
    
    // MARK: 2.8、设置图片(通过Bundle加载)
    /// 设置图片(通过Bundle加载)
    /// - Parameters:
    ///   - aClass: className bundle所在的类的类名
    ///   - bundleName: bundle 的名字
    ///   - imageName: 图片的名字
    ///   - state: 状态
    /// - Returns: 返回自身
    @discardableResult
    func image(forParent aClass: AnyClass, bundleName: String, _ imageName: String, _ state: UIControl.State = .normal) -> Self {
        guard let path = Bundle(for: aClass).path(forResource: bundleName, ofType: "bundle") else {
            return self
        }
        let image = UIImage(named: imageName, in: Bundle(path: path), compatibleWith: nil)
        setImage(image, for: state)
        return self
    }
    
    // MARK: 2.9、设置图片(纯颜色的图片)
    /// 设置图片(纯颜色的图片)
    /// - Parameters:
    ///   - color: 图片颜色
    ///   - state: 状态
    /// - Returns: 返回自身
    @discardableResult
    func image(_ color: UIColor, _ size: CGSize = CGSize(width: 20.0, height: 20.0), _ state: UIControl.State = .normal) -> Self {
        let image = UIImage.tb.image(color: color, size: size)
        setImage(image, for: state)
        return self
    }
    
    // MARK: 2.10、设置背景图片
    /// 设置背景图片
    /// - Parameters:
    ///   - image: 图片
    ///   - state: 状态
    /// - Returns: 返回自身
    @discardableResult
    func bgImage(_ image: UIImage?, _ state: UIControl.State = .normal) -> Self {
        setBackgroundImage(image, for: state)
        return self
    }
    
    // MARK: 2.11、设置背景图片(通过Bundle加载)
    /// 设置背景图片(通过Bundle加载)
    /// - Parameters:
    ///   - aClass: className bundle所在的类的类名
    ///   - bundleName: bundle 的名字
    ///   - imageName: 图片的名字
    ///   - state: 状态
    /// - Returns: 返回自身
    @discardableResult
    func bgImage(forParent aClass: AnyClass, bundleName: String, _ imageName: String, _: UIControl.State = .normal) -> Self {
        guard let path = Bundle(for: aClass).path(forResource: bundleName, ofType: "bundle") else {
            return self
        }
        let image = UIImage(named: imageName, in: Bundle(path: path), compatibleWith: nil)
        setBackgroundImage(image, for: state)
        return self
    }
    
    // MARK: 2.12、设置背景图片(通过Bundle加载)
    /// 设置背景图片(通过Bundle加载)
    /// - Parameters:
    ///   - bundle: Bundle
    ///   - imageName: 图片的名字
    ///   - state: 状态
    /// - Returns: 返回自身
    @discardableResult
    func bgImage(in bundle: Bundle? = nil, _ imageName: String, _ state: UIControl.State = .normal) -> Self {
        let image = UIImage(named: imageName, in: bundle, compatibleWith: nil)
        setBackgroundImage(image, for: state)
        return self
    }
    
    // MARK: 2.13、设置背景图片(纯颜色的图片)
    /// 设置背景图片(纯颜色的图片)
    /// - Parameters:
    ///   - color: 背景色
    ///   - state: 状态
    /// - Returns: 返回自身
    @discardableResult
    func bgImage(_ color: UIColor, _ state: UIControl.State = .normal) -> Self {
        let image = UIImage.tb.image(color: color)
        setBackgroundImage(image, for: state)
        return self
    }
    
    // MARK: 2.14、按钮点击的变化
    /// 按钮点击的变化
    /// - Returns: 返回自身
    @discardableResult
    func confirmButton() -> Self {
        let normalImage = UIImage.tb.image(color: UIColor.hexStringColor(hexString: "#E54749"), size: CGSize(width: 10, height: 10), corners: .allCorners, radius: 4)?.resizableImage(withCapInsets: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        let disableImg = UIImage.tb.image(color: UIColor.hexStringColor(hexString: "#E6E6E6"), size: CGSize(width: 10, height: 10), corners: .allCorners, radius: 4)?.resizableImage(withCapInsets: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        setBackgroundImage(normalImage, for: .normal)
        setBackgroundImage(disableImg, for: .disabled)
        return self
    }
}

// MARK: - 三、UIButton 图片 与 title 位置关系
/// UIButton 图片与title位置关系 https://www.jianshu.com/p/0f34c1b52604
public extension TBPOP where Base: UIButton {
    
    /// 图片 和 title 的布局样式
    enum ImageTitleLayout {
        case imgTop
        case imgBottom
        case imgLeft
        case imgRight
    }
    
    // MARK: 3.1、设置图片和 title 的位置关系(提示：title和image要在设置布局关系之前设置)
    /// 设置图片和 title 的位置关系(提示：title和image要在设置布局关系之前设置)
    /// - Parameters:
    ///   - layout: 布局
    ///   - spacing: 间距
    /// - Returns: 返回自身
    @discardableResult
    func setImageTitleLayout(_ layout: ImageTitleLayout, spacing: CGFloat = 0) -> UIButton {
        switch layout {
        case .imgLeft:
            alignHorizontal(spacing: spacing, imageFirst: true)
        case .imgRight:
            alignHorizontal(spacing: spacing, imageFirst: false)
        case .imgTop:
            alignVertical(spacing: spacing, imageTop: true)
        case .imgBottom:
            alignVertical(spacing: spacing, imageTop: false)
        }
        return self.base
    }
    
    /// 水平方向
    /// - Parameters:
    ///   - spacing: 间距
    ///   - imageFirst: 图片是否优先
    private func alignHorizontal(spacing: CGFloat, imageFirst: Bool) {
        let edgeOffset = spacing / 2
        base.imageEdgeInsets = UIEdgeInsets(top: 0, left: -edgeOffset,
                                            bottom: 0,right: edgeOffset)
        base.titleEdgeInsets = UIEdgeInsets(top: 0, left: edgeOffset,
                                            bottom: 0, right: -edgeOffset)
        if !imageFirst {
            base.transform = CGAffineTransform(scaleX: -1, y: 1)
            base.imageView?.transform = CGAffineTransform(scaleX: -1, y: 1)
            base.titleLabel?.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
        base.contentEdgeInsets = UIEdgeInsets(top: 0, left: edgeOffset, bottom: 0, right: edgeOffset)
    }
    
    /// 垂直方向
    /// - Parameters:
    ///   - spacing: 间距
    ///   - imageTop: 图片是不是在顶部
    private func alignVertical(spacing: CGFloat, imageTop: Bool) {
        guard let imageSize = self.base.imageView?.image?.size,
              let text = self.base.titleLabel?.text,
              let font = self.base.titleLabel?.font
        else {
            return
        }
        let labelString = NSString(string: text)
        let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: font])
        
        let imageVerticalOffset = (titleSize.height + spacing) / 2
        let titleVerticalOffset = (imageSize.height + spacing) / 2
        let imageHorizontalOffset = (titleSize.width) / 2
        let titleHorizontalOffset = (imageSize.width) / 2
        let sign: CGFloat = imageTop ? 1 : -1
        
        base.imageEdgeInsets = UIEdgeInsets(top: -imageVerticalOffset * sign,
                                            left: imageHorizontalOffset,
                                            bottom: imageVerticalOffset * sign,
                                            right: -imageHorizontalOffset)
        base.titleEdgeInsets = UIEdgeInsets(top: titleVerticalOffset * sign,
                                            left: -titleHorizontalOffset,
                                            bottom: -titleVerticalOffset * sign,
                                            right: titleHorizontalOffset)
        // increase content height to avoid clipping
        let edgeOffset = (min(imageSize.height, titleSize.height) + spacing) / 2
        base.contentEdgeInsets = UIEdgeInsets(top: edgeOffset, left: 0, bottom: edgeOffset, right: 0)
    }
}

// MARK: - 五、Button的基本事件
private var buttonCallBackKey: Void?
extension UIButton: TBSwiftPropertyCompatible {
    internal typealias T = UIButton
    internal var swiftCallBack: SwiftCallBack? {
        get { return tb_getAssociatedObject(self, &buttonCallBackKey) }
        set { tb_setRetainedAssociatedObject(self, &buttonCallBackKey, newValue) }
    }
    
    @objc internal func swiftButtonAction(_ button: UIButton) {
        self.swiftCallBack?(button)
    }
}

public extension TBPOP where Base: UIButton {
    
    // MARK: 5.1、button的事件
    /// button的事件
    /// - Parameters:
    ///   - controlEvents: 事件类型，默认是 valueChanged
    ///   - buttonCallBack: 事件
    /// - Returns: 闭包事件
    func setHandleClick(controlEvents: UIControl.Event = .touchUpInside, buttonCallBack: ((_ button: UIButton?) -> ())?){
        base.swiftCallBack = buttonCallBack
        base.addTarget(base, action: #selector(base.swiftButtonAction), for: controlEvents)
    }
}

// MARK: - 六、Button扩大点击事件
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


