//
//  NavigationController.swift
//  Clothletics
//

//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.isHidden = true
    }

   
    
    //all push will call this func
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        
        
        // 如果不是栈底控制器才需要隐藏，根控制器不需要处理
        if childViewControllers.count > 0 {
            // 隐藏底部的 TabBar
            viewController.hidesBottomBarWhenPushed = true
            
            // 判断控制器的类型
            if let vc = viewController as? BaseViewController {
                
                
                
                
                
                // 取出自定义的 navItem，设置左侧按钮作为返回按钮
                //vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(popToParent), isBack: true)
                let backbtn = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(popToParent))
                backbtn.tintColor = UIColor.white
                vc.navItem.leftBarButtonItem = backbtn
                
            }
        }
        
        super.pushViewController(viewController, animated: true)
        
    }
    
    
    @objc private func popToParent(){
        
        popViewController(animated: true)
        
    }

}
