//
//  Adv2ViewController.swift
//  Clothletics
//

//

import UIKit

class Adv2ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set title
        title = "our newest designer"
        setupUI()
        setUpLabel2()
    }
    
    private var label2 = UILabel()
    private var x_label2: CGFloat = 10
    private var y_label2: CGFloat = 100
    private var w_label2: CGFloat = 200
    private var h_label2: CGFloat = 100


}


extension Adv2ViewController{
    
    private func setupUI(){
        
        
        view.addSubview(label2)
    }
    
    private func setUpLabel2(){
        
        label2.text = "hey this is the newest designer of our company!"
        label2.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .caption1), size: 16.0)
        label2.textColor = UIColor.black
        label2.frame = CGRect(x: x_label2, y: y_label2, width: w_label2, height: h_label2)
    }
    
    
    
    
    
}
