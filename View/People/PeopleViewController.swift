//
//  PeopleViewController.swift
//  Clothletics
//

//

import UIKit

class PeopleViewController: BaseViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentInsetsScrollView()
        setupPeopleScrollView()
        setupPeoplePageControl()
        peoplePictureDisplay()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        contentInsetsScrollView()
    }
    
    // picture scroll
    private var peopleScrollView = UIScrollView()
    
    //picturescrollview's height
    var peopleScrollViewHeight: CGFloat = 630
    
    private var people_num_page = 5
    
    private var peoplePageControl_width = 20
    
    //remind current scroll page
    private var peoplePageControl = UIPageControl()
    
    private var people_timer = Timer()
    
    private var people_picture_button_array: [UIButton] = []
    
    
    
    private lazy var title_table_people = [String]()
    
    private let array_people:[String] = ["first news", "this is our new disigner", "this is our team", "this is our first product", "our new customer review"]
    
    
    
    
    

    

}



/**
 picture scroll
 
 */
extension PeopleViewController{
    
    private func contentInsetsScrollView(){
        
        automaticallyAdjustsScrollViewInsets = false
        self.parent?.automaticallyAdjustsScrollViewInsets = false
        self.edgesForExtendedLayout = []
        peopleScrollView.contentInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        
    }
    
    private func setupPeopleScrollView(){
        peopleScrollView.frame = CGRect(x: 0 as CGFloat, y: navigationbar_height, width: screen_width, height: peopleScrollViewHeight)
        peopleScrollView.backgroundColor = grayblack
        peopleScrollView.isPagingEnabled = true
        peopleScrollView.isScrollEnabled = true
        peopleScrollView.isUserInteractionEnabled = true
        
        if #available(iOS 11.0, *) {
            peopleScrollView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        
        
        view.addSubview(peopleScrollView)
        
    }
    
    private func setupPeoplePageControl(){
        peoplePageControl.frame = CGRect(x: Int(0.5*screen_width), y: Int(peopleScrollViewHeight + 15), width: peoplePageControl_width, height: peoplePageControl_width)
        peoplePageControl.numberOfPages = people_num_page
        peoplePageControl.currentPage = 0
        peoplePageControl.tintColor = UIColor.white
        
        view.addSubview(peoplePageControl)
    }
    private func peoplePictureDisplay()
    {
        let imageW = peopleScrollView.frame.width
        let imageH = peopleScrollViewHeight
        var px: Int = 0
        for index in 0..<people_num_page{
            let btn = UIButton()
            let pic_string = "member_image"
            
            let rect = CGRect(x: CGFloat(px)  , y:  navigationbar_height , width: screen_width, height: peopleScrollViewHeight)
            
            let imag = UIImage(named: (pic_string + "\(index+1)"))
            
            btn.frame = rect
            
            btn.setImage(imag , for: .normal)
            
            
            
            people_picture_button_array.append(btn)
            peopleScrollView.addSubview(people_picture_button_array[index])
            peoplePageControl.currentPage = index
            px = px + Int(imageW)
        }
        
        
        let contentW: CGFloat = imageW * CGFloat(people_num_page)
        peopleScrollView.contentSize = CGSize(width: contentW, height: peopleScrollViewHeight)
        
        
        
        people_picture_button_array[0].addTarget(self,  action: #selector(PeopleViewController.pic_btn_adv1), for: .touchUpInside)
        people_picture_button_array[1].addTarget(self,  action: #selector(PeopleViewController.pic_btn_adv2), for: .touchUpInside)
        people_picture_button_array[2].addTarget(self,  action: #selector(PeopleViewController.pic_btn_adv3), for: .touchUpInside)
        
        addTimer()
    }
    
    @objc private func nextImage()
    {
        
        var page: Int = peoplePageControl.currentPage
        
        if(page == people_num_page - 1){
            page = 0
            
        }else{
            page = page + 1
        }
        
        peoplePageControl.currentPage = page
        let x: CGFloat = CGFloat(page) * peopleScrollView.frame.size.width
        peopleScrollView.contentOffset = CGPoint(x: x, y: navigationbar_height )   //navigationbar_height y
        
    }
    
    
    
    private func addTimer(){   //图片轮播的定时器。
        
        self.people_timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(PeopleViewController.nextImage), userInfo: nil, repeats: true);
    }
    
    @objc private func pic_btn_adv1()
    {
        
        let vc = Founder1ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func pic_btn_adv2()
    {
        
        let vc = Founder2ViewController()
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    @objc private func pic_btn_adv3()
    {
        let vc = Founder3ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
