//
//  MessageViewController.swift
//  Clothletics
//

//

import UIKit
var cellId = "cellID"
let messageNameArray:[String] = ["Guangwei Cao", "Andy Zhou"]
let messagePhotoArray: [String] = ["message_photo1", "message_photo2"]
let messageContentArray: [String] = ["Sure, no problem!", "Thank you!"]
let messageCellHeight: CGFloat = 100
class MessageViewController: BaseViewController , UITableViewDataSource, UITableViewDelegate{
    
    
    var tableMessage:UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMesageTable()
        
    }

    
    
    
    
    

}

extension MessageViewController{
    
    //self.view.frame
    private func setupMesageTable(){
        let rect = CGRect(x: 0 as CGFloat,
                          y: navigationbar_height,
                          width: screen_width,
                          height: (screen_height - navigationbar_height) as CGFloat)
        tableMessage = UITableView(frame: rect)
        self.tableMessage.backgroundColor = UIColor.white
        
        
        self.tableMessage.dataSource = self
        
        self.tableMessage.delegate = self
        self.view.insertSubview(tableMessage, belowSubview: navigationBar)
        
        self.tableMessage.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
    }
    
    
}

/**
 set up photo in cell
 */
extension MessageViewController{
    
    private func setupCell(){
        
        
        
    }
    
    
}


/**
 table cell delegate
 */
extension MessageViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = (tableMessage.dequeueReusableCell(withIdentifier: cellId, for: indexPath)) as UITableViewCell
        //cell.textLabel?.text = messageNameArray[indexPath.row]
        
        let cell = MessageCell(style: .default, reuseIdentifier: cellId)
        cell.nameLabel?.text = messageNameArray[indexPath.row]
        cell.picImgView?.image = UIImage(named: messagePhotoArray[indexPath.row])
        cell.contentLabel?.text = messageContentArray[indexPath.row]
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return messageCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            message_cell1()
        }
        else{
            message_cell2()
        }
    }
    
    private func message_cell1()
    {
        
        let vc = Dialogue1ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func message_cell2()
    {
        
        let vc = Dialogue2ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}




class MessageCell: UITableViewCell{
    
    var nameLabel:UILabel?
    var picImgView:UIImageView?
    var timeLabel: UILabel?
    var contentLabel: UILabel?
    
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style:UITableViewCellStyle, reuseIdentifier:String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI();
    }
    
    private func setUpUI() {
        let x: CGFloat = 15
        self.nameLabel = UILabel.init()
        self.nameLabel?.backgroundColor = UIColor.clear;
        self.nameLabel?.frame = CGRect(x: (messageCellHeight + 2*x), y: x, width:100, height:30)
        //self.nameLabel?.text = messageNameArray[0]
        self.nameLabel?.textColor = UIColor.black
        self.nameLabel?.font = UIFont.systemFont(ofSize: 15)
        self.nameLabel?.textAlignment = NSTextAlignment.left
        self.addSubview(self.nameLabel!)
        
        self.picImgView = UIImageView()
        self.picImgView?.frame = CGRect(x:x, y:x, width:(messageCellHeight - x), height: (messageCellHeight - 2*x))
        //self.picImgView?.image = UIImage(named: messagePhotoArray[0])
        self.addSubview(self.picImgView!)
        
        self.timeLabel = UILabel.init()
        self.timeLabel?.text = "03/30/2018 12:13"
        self.timeLabel?.font = UIFont.systemFont(ofSize: 10)
        self.timeLabel?.frame = CGRect(x: 300, y: x, width:100, height:30)
        self.timeLabel?.backgroundColor = UIColor.clear;
        self.addSubview(self.timeLabel!)
        
        self.contentLabel = UILabel.init()
        //self.contentLabel?.text = "Hey this is Mathko!"
        self.contentLabel?.font = UIFont.systemFont(ofSize: 13)
        self.contentLabel?.frame = CGRect(x: (messageCellHeight + 2*x), y: 3*x, width:300, height:30)
        self.contentLabel?.backgroundColor = UIColor.clear;
        self.contentLabel?.textAlignment = NSTextAlignment.left
        self.addSubview(self.contentLabel!)
        
    }
    
    
    
}
