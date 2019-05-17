//
//  Adv3ViewController.swift
//  Clothletics
//

//

import UIKit

class Adv3ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set title
        title = "our discount"
        setupUI()
        setUpLabel3()
    }
    
    private var label3 = UILabel()
    private var x_label3: CGFloat = 10
    private var y_label3: CGFloat = 100
    private var w_label3: CGFloat = 200
    private var h_label3: CGFloat = 100


}



extension Adv3ViewController{
    
    private func setupUI(){
        
        
        view.addSubview(label3)
    }
    
    private func setUpLabel3(){
        
        label3.text = "hey this is the discount for out company's starting!"
        label3.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .caption1), size: 16.0)
        label3.textColor = UIColor.black
        label3.frame = CGRect(x: x_label3, y: y_label3, width: w_label3, height: h_label3)
    }
    
    
    
    
    
}
