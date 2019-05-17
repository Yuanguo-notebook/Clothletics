//
//  BaseViewController.swift
//  Clothletics
//

//

import UIKit

let lightorange = UIColor.colorWithHexString(hex: "#F26C4F")  //UIColor.colorWithHexString(hex: "#F26C4F")   UIColor(hex: "f26c4f")
let highorange = UIColor.colorWithHexString(hex: "#FF5039")  //#FF5039  ff5039
let grayblack = UIColor.colorWithHexString(hex: "#43464B")   //#43464B   43464b
let lightgray = UIColor.colorWithHexString(hex: "#E3E7ED")
let nagivationbar_y: CGFloat = 20
let navigationbar_height: CGFloat = 64

class BaseViewController: UIViewController{
    
    let screen_s = UIScreen.main.bounds
    lazy var screen_width: CGFloat = screen_s.width
    lazy var screen_height: CGFloat = screen_s.height
    
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0 as CGFloat, y: nagivationbar_y, width: screen_width, height: navigationbar_height))
    
    lazy var navItem = UINavigationItem()
    
    
    //refresh
    var refreshControl: UIRefreshControl?
    
    //up refresh mark
    var isPullup = false
    
    var isUserLogin = true;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        setStatusBarBackgroundColor(color: highorange)
        automaticallyAdjustsScrollViewInsets = false
        setupBaseUI()
        print(screen_height)
        loadData()
    }
    
    
    
    override var title: String?{
        
        didSet{
            navItem.title = title
            
        }
        
    }
    
    @objc func loadData(){
        
        refreshControl?.endRefreshing()
        
        
    }
    
    ///设置状态栏背景颜色
    func setStatusBarBackgroundColor(color : UIColor) {
        let statusBarWindow : UIView = UIApplication.shared.value(forKey: "statusBarWindow") as! UIView
        let statusBar : UIView = statusBarWindow.value(forKey: "statusBar") as! UIView
        
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = color
            
        }
    }
    
    //extension cannot override
    func setupBaseUI(){
        
        view.backgroundColor = UIColor.white
        
        //内容缩进
        automaticallyAdjustsScrollViewInsets = false
        
        setupNavigationBar()
        
        //isUserLogin ? setupTableView() : setupVisitorView()
    }
    
    
    
    
    private func setupVisitorView(){
        
        let visitorView = VisitorView(frame: view.bounds)
        
        //view.insertSubview(visitorView, belowSubview: navigationBar)
        
        
        visitorView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        visitorView.registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        
        
        navItem.rightBarButtonItem = UIBarButtonItem(title: "login", style: .plain, target: self, action: #selector(login))
        
    }
    
    private func setupNavigationBar(){
        navigationBar.barTintColor = highorange
        navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: grayblack]
        
        
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
        //set color   self.navigationController?.
        
    }
    
}

//listen event
extension BaseViewController{
    @objc private func login(){
        print("login")
    }
    
    @objc private func register(){
        print("register")
    }
    
    
    
}






