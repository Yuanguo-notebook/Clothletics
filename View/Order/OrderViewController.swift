//
//  OrderViewController.swift
//  Clothletics
//

//

import UIKit
let orderNameArray:[String] = ["37464773", "4847464743838" , "4847464743838"]
let orderContentArray: [String] = ["hoodie", "skirt", "shoes"]
let orderPhotoArray: [String] = ["order1", "order2", "order3"]
class OrderViewController: BaseViewController , UITableViewDataSource, UITableViewDelegate{

    var tableOrder:UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOrderTable()
        setupOrderNavigation()
    }


   

}

extension OrderViewController{
    
    private func setupOrderNavigation(){
        let addButton = UIBarButtonItem(image: UIImage(named: "order_add"),
                                                    style: .plain,
                                                    target: self,
                                                    action: #selector(addOrder))
        addButton.tintColor = UIColor.white
        
        navItem.rightBarButtonItem = addButton
        
    }
    
    @objc private func addOrder(){
        print("add an order")
    }
}




extension OrderViewController{
    
    //self.view.frame
    private func setupOrderTable(){
        let rect = CGRect(x: 0 as CGFloat,
                          y: navigationbar_height,
                          width: screen_width,
                          height: (screen_height - navigationbar_height) as CGFloat)
        tableOrder = UITableView(frame: rect)
        self.tableOrder.backgroundColor = UIColor.white
        
        
        self.tableOrder.dataSource = self
        
        self.tableOrder.delegate = self
        self.view.insertSubview(tableOrder, belowSubview: navigationBar)
        
        self.tableOrder.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    
}


/**
 table cell delegate
 */
extension OrderViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = OrderCell(style: .default, reuseIdentifier: cellId)
        cell.nameLabel?.text = "order number: " + orderNameArray[indexPath.row]
        cell.picImgView?.image = UIImage(named: orderPhotoArray[indexPath.row])
        cell.contentLabel?.text = "description: " + orderContentArray[indexPath.row]
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return messageCellHeight
    }
    
    
    
    
    
}




class OrderCell: UITableViewCell{
    
    var nameLabel:UILabel?
    var picImgView:UIImageView?
    var timeLabel: UILabel?
    var contentLabel: UILabel?
    
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style:UITableViewCellStyle, reuseIdentifier:String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpOrderUI();
    }
    
    private func setUpOrderUI() {
        let x: CGFloat = 15
        self.nameLabel = UILabel.init()
        self.nameLabel?.backgroundColor = UIColor.clear;
        self.nameLabel?.frame = CGRect(x: x, y: x, width:300, height:30)
        //self.nameLabel?.text = messageNameArray[0]
        self.nameLabel?.textColor = UIColor.black
        self.nameLabel?.font = UIFont.systemFont(ofSize: 17)
        self.nameLabel?.textAlignment = NSTextAlignment.left
        self.addSubview(self.nameLabel!)
        
       
        
        self.timeLabel = UILabel.init()
        self.timeLabel?.text = "03/30/2018 12:13"
        self.timeLabel?.font = UIFont.systemFont(ofSize: 10)
        self.timeLabel?.frame = CGRect(x: 300, y: x, width:100, height:20)
        self.timeLabel?.backgroundColor = UIColor.clear;
        self.addSubview(self.timeLabel!)
        
        self.contentLabel = UILabel.init()
        //self.contentLabel?.text = "Hey this is Mathko!"
        self.contentLabel?.font = UIFont.systemFont(ofSize: 15)
        self.contentLabel?.frame = CGRect(x: x, y: 3*x, width:300, height:30)
        self.contentLabel?.backgroundColor = UIColor.clear;
        self.contentLabel?.textAlignment = NSTextAlignment.left
        self.addSubview(self.contentLabel!)
        
        
        
        self.picImgView = UIImageView()
        self.picImgView?.frame = CGRect(x:300, y: x + 30, width:100, height: 30)
        
        self.addSubview(self.picImgView!)
    }
    
    
    
}

