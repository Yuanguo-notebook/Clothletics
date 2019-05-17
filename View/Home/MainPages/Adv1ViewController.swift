//
//  Adv1ViewController.swift
//  Clothletics
//

//

import UIKit

class Adv1ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //set title
        title = "our company"
        setupUI()
        setUpLabel1()
    }

    private var label1 = UILabel()
    private var x_label1: CGFloat = 10
    private var y_label1: CGFloat = 100
    private var w_label1: CGFloat = 200
    private var h_label1: CGFloat = 100

}

extension Adv1ViewController{
    
    private func setupUI(){
        
        
        view.addSubview(label1)
    }
    
    private func setUpLabel1(){
        
        label1.text = "this is our start company Clothletics!"
        label1.font = UIFont(descriptor: .preferredFontDescriptor(withTextStyle: .caption1), size: 16.0)
        label1.textColor = UIColor.black
        label1.frame = CGRect(x: x_label1, y: y_label1, width: w_label1, height: h_label1)
    }
    
    
    
    
    
}
