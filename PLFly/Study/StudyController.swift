//
//  StudyController.swift
//  PLFly
//
//  Created by 曾鹏展 on 2023/1/28.
//

import UIKit
import JKSwiftExtension

class StudyController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.randomColor

        let image = UIImage.tb.image(color: UIColor.randomColor, size: CGSize(width: jk_kScreenW, height: 200))
        
//        let imageView = UIImageView.init(image: image)
//        self.view.addSubview(imageView)
        
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundImage = image
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        }else{
            self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
