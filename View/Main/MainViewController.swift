//
//  MainViewController.swift
//  Clothletics

//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildController()
        //self.tabBarController?.tabBar.barTintColor = lightorange
        tabBar.barTintColor = lightorange
    }

  
}




//cut part of code
//put similar function into one extension
//good to maintain
extension MainViewController{
    
    
    
    //set up all child view controller
    private func setupChildController(){
        
       
        
        
         let array: [[String: Any]] = [
         ["clsName": "HomeViewController" , "title" : "Home", "imageName": "home"],
         ["clsName": "PeopleViewController" , "title" : "People", "imageName": "people"],
         ["clsName": "MessageViewController" , "title" : "Message", "imageName": "message"],
         ["clsName": "OrderViewController" , "title" : "Order", "imageName": "order"],
         ["clsName": "ProfileViewController" , "title" : "Profile", "imageName": "profile"],
         ]
         
        
        
        var arrayM = [UIViewController]()
        for dict in array{
            
            arrayM.append(controller(dict: dict))
        }
        
        viewControllers = arrayM
    }
    
    //use dict to create one view controller
    //dict  [clsName, title, imageName
    //return child view controller
    private func controller(dict: [String: Any]) -> UIViewController{
        //1.get dict indo
        guard let clsName = dict["clsName"] as? String,
            let title = dict["title"] as? String,
            let imageName = dict["imageName"] as? String,
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? BaseViewController.Type
            //let visitorDict = dict["visitorInfo"] as? [String: String]
            
            else{
                return UIViewController()
        }
        
        //2. create view controller
        let vc = cls.init()
        vc.title = title
        
        //set controller's visitorInfo dict
        //vc.visitorInfoDictionary = visitorDict
        
        //3.set image
        
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_highlighted")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        //4.set tabbar title, font
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.white], for: .highlighted)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : grayblack], for: .normal)
        
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font : UIFont.systemFont(ofSize: 12)], for: UIControlState(rawValue: 0))
        
        
        let nav = NavigationController(rootViewController: vc)
        
        return nav
    }
    
    
}



