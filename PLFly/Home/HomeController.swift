//
//  HomeController.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/1/28.
//

import UIKit

class HomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.randomColor

        /// 通知名
        let notificationName = "LXNotification"
        /// 自定义通知
        NotificationCenter.default.addObserver(self, selector: #selector(notificationAction), name: NSNotification.Name(rawValue: notificationName), object: nil)
    }
    
    /// 接受到通知后的方法回调
    @objc private func notificationAction(noti: Notification) {
       /// 获取键盘的位置/高度/时间间隔...
       print(noti)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "LXNotification"), object: "Hello 2017")
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "HomeTitleAddButtonClicked"), object: nil)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        NotificationCenter.default.post(name: NSNotification.Name("homeTitleAddButtonClicked"), object: nil)
//    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
