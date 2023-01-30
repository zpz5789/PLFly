//
//  MyTabBarController.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/1/11.
//

import UIKit

class MyTabBarController: UITabBarController {

    
    /*
    // MARK: - Navigation 生命周期
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
//        let tabbar = UITabBar.appearance()
//        tabbar.tintColor = UIColor(red: 245 / 255.0, green: 90 / 255.0, blue: 93 / 255.0, alpha: 0)
//        tabbar.backgroundColor = UIColor.lightGray

        let tabbar = PLTabbar.init()
        
        self.setValue(tabbar, forKey: "tabBar")
  
        addChildViewControllers(HomeController.init(), title: "首页", imageName: "home")
        addChildViewControllers(StudyController.init(), title: "学习", imageName: "xuexi")
        addChildViewControllers(DeliveryController.init(), title: "投递", imageName: "toudi")
        addChildViewControllers(MineController.init(), title: "我的", imageName: "mine")
        
        TestMonitor.load()
    }
    
    
    private func addChildViewControllers(_ childController: UIViewController, title: String, imageName: String) {
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_hover")
        childController.title = title
        addChild(childController)
    }

    
    private func setChildViewController() {
        
    }
}
