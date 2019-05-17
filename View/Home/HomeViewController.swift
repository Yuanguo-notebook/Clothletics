//
//  HomeViewController.swift
//  Clothletics
//

//

import UIKit
var homeCellHeight: CGFloat = 150

class HomeViewController: BaseViewController , UITableViewDataSource, UITableViewDelegate{
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentInsetsScrollView()
        setupScrollView()
        setupPageControl()
        pictureDisplay()
        setupHomeTable()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
         contentInsetsScrollView()
    }

    // picture scroll
    private var pictureScrollView = UIScrollView()
    
    //picturescrollview's height
    var pictureScrollViewHeight: CGFloat = 300
    
    private var num_page = 3
    
    private var pageControl_width = 20
    
    //remind current scroll page
    private var picturePageControl = UIPageControl()
    
    private var timer = Timer()
    
    private var picture_button_array: [UIButton] = []
    
    
    
    private lazy var title_table_home = [String]()
    
    private let arrayHome:[String] = ["First news" ,"Our new customer review", "Our new designer",  "This is our first product", "Our team"]
    private let homePhotoArray: [String] = ["home_image1", "home_image5" , "home_image2", "home_image3", "home_image4"]
    private var tableHome: UITableView!
    
    
    
    
    
    
}

/**
 picture scroll
 
 */
extension HomeViewController{
    
    private func contentInsetsScrollView(){
        
        automaticallyAdjustsScrollViewInsets = false
        self.parent?.automaticallyAdjustsScrollViewInsets = false
        self.edgesForExtendedLayout = []
        pictureScrollView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        
    }
    
    private func setupScrollView(){
        pictureScrollView.frame = CGRect(x: 0 as CGFloat, y: navigationbar_height, width: screen_width, height: pictureScrollViewHeight)
        pictureScrollView.backgroundColor = grayblack
        pictureScrollView.isPagingEnabled = true
        pictureScrollView.isScrollEnabled = true
        pictureScrollView.isUserInteractionEnabled = true
        
        if #available(iOS 11.0, *) {
            pictureScrollView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
      
        let empty_v = UIView(frame: CGRect(x: 0.0, y: 0.0, width: screen_width, height: 0.1))
        view.addSubview(empty_v)
        view.addSubview(pictureScrollView)
        
    }
    
    private func setupPageControl(){
        picturePageControl.frame = CGRect(x: Int(0.8*screen_width), y: Int(pictureScrollViewHeight + 15), width: pageControl_width, height: pageControl_width)
        picturePageControl.numberOfPages = num_page
        picturePageControl.currentPage = 0
        picturePageControl.tintColor = UIColor.white
        
        view.addSubview(picturePageControl)
    }
    private func pictureDisplay()
    {
        let imageW = pictureScrollView.frame.width
        let imageH = pictureScrollView.frame.height
        var px: Int = 0
        for index in 0..<num_page{
            let btn = UIButton()
            let pic_string = "adv"
            
            let rect = CGRect(x: CGFloat(px)  , y:  navigationbar_height , width: imageW, height: imageH)
            btn.frame = rect
            
            btn.setImage(UIImage(named: (pic_string + "\(index+1)")), for: .normal)
            
            
            
            picture_button_array.append(btn)
            pictureScrollView.addSubview(picture_button_array[index])
            picturePageControl.currentPage = index
            px = px + Int(imageW)
        }
        
        
        let contentW: CGFloat = imageW * CGFloat(num_page)
        pictureScrollView.contentSize = CGSize(width: contentW, height: pictureScrollViewHeight)
        
        
        
        picture_button_array[0].addTarget(self,  action: #selector(HomeViewController.pic_btn_adv1), for: .touchUpInside)
        picture_button_array[1].addTarget(self,  action: #selector(HomeViewController.pic_btn_adv2), for: .touchUpInside)
        picture_button_array[2].addTarget(self,  action: #selector(HomeViewController.pic_btn_adv3), for: .touchUpInside)
        
        addTimer()
    }
    
    @objc private func nextImage()
    {
        
        var page: Int = picturePageControl.currentPage
        
        if(page == num_page - 1){
            page = 0
            
        }else{
            page = page + 1
        }
        
        picturePageControl.currentPage = page
        let x: CGFloat = CGFloat(page) * pictureScrollView.frame.size.width
        pictureScrollView.contentOffset = CGPoint(x: x, y: navigationbar_height )   //navigationbar_height y
        
    }
    
    
    
    private func addTimer(){   //图片轮播的定时器。
        
        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(HomeViewController.nextImage), userInfo: nil, repeats: true);
    }
    
    @objc private func pic_btn_adv1()
    {
    
        let vc = Adv1ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func pic_btn_adv2()
    {
        
        let vc = Adv2ViewController()
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    @objc private func pic_btn_adv3()
    {
        let vc = Adv3ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}


extension HomeViewController{
    
    private func setupHomeTable(){
        let rect = CGRect(x: 0 as CGFloat,
                          y: (navigationbar_height + pictureScrollViewHeight) as CGFloat,
                          width: screen_width,
                          height: (screen_height - navigationbar_height - pictureScrollViewHeight) as CGFloat)
        tableHome = UITableView(frame: rect)
        self.tableHome.backgroundColor = UIColor.white
        
        
        self.tableHome.dataSource = self
        
        self.tableHome.delegate = self
        self.view.insertSubview(tableHome, belowSubview: navigationBar)
        
        self.tableHome.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    
    
}

/**
 table cell
 */
extension HomeViewController{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayHome.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = (tableHome.dequeueReusableCell(withIdentifier: cellId, for: indexPath) ) as UITableViewCell
        //cell.textLabel?.text = arrayHome[indexPath.row]
        
        
        let cell = HomeCell(style: .default, reuseIdentifier: cellId)
        cell.nameLabel?.text = arrayHome[indexPath.row]
        cell.picImgView?.image = UIImage(named: homePhotoArray[indexPath.row])
        
        
        
        return cell
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return homeCellHeight
    }

    
    
    
    
}




class HomeCell: UITableViewCell{
    
    var nameLabel:UILabel?
    var picImgView:UIImageView?
    
    
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style:UITableViewCellStyle, reuseIdentifier:String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI();
    }
    
    private func setUpUI(){
    
        let x: CGFloat = 15
        let label_width: CGFloat = 250
        self.nameLabel = UILabel.init()
        self.nameLabel?.backgroundColor = UIColor.clear;
        self.nameLabel?.frame = CGRect(x: x, y: 3 * x, width: label_width, height:30)
        
        self.nameLabel?.textColor = UIColor.black
        self.nameLabel?.font = UIFont.systemFont(ofSize: 17)
        self.nameLabel?.textAlignment = NSTextAlignment.left
        self.addSubview(self.nameLabel!)
        
        
        self.picImgView = UIImageView()
        self.picImgView?.frame = CGRect(x: label_width + x, y:x, width:(homeCellHeight - 2*x), height: (homeCellHeight - 2*x))
        
        self.addSubview(self.picImgView!)
        
    
    }
}













