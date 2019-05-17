//
//  Dialogue1ViewController.swift
//  Clothletics
//

//

import UIKit

class Dialogue1ViewController: DialogueViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Guangwei Cao"
        setupDialogue1()
        setupUserLabel()
        setupDesignerLabel()
    }

    private let user_photo = UIImageView()
    private let designer1_photo = UIImageView()

    private let user_label = UILabel()
    private let designer_label = UILabel()
}

extension Dialogue1ViewController{
    
    private func setupDialogue1(){
        user_photo.frame = CGRect(x: 300, y: 100, width: 80, height: 80)
        user_photo.image = UIImage(named:"profile_photo_main")
        self.view.addSubview(user_photo)
        
        
        
        //message_photo1
        designer1_photo.frame = CGRect(x: 15, y: 200, width: 80, height: 80)
        designer1_photo.image = UIImage(named:"message_photo1")
        self.view.addSubview(designer1_photo)
        
    }
    
    private func setupUserLabel(){
        user_label.font = UIFont.systemFont(ofSize: 13)
        user_label.frame = CGRect(x: 30, y: 90, width: 250, height: 80)
        user_label.text = "Hi, are you there? I want to change my mind. I prefer my dress to be more minimalistic."
        user_label.lineBreakMode = NSLineBreakMode.byWordWrapping
        user_label.numberOfLines = 0
        //user_label.layer.borderColor = UIColor.gray.cgColor
       // user_label.layer.borderWidth = 1;
        self.view.addSubview(user_label)
        
        
    }
    
    
    private func setupDesignerLabel(){
        //Sure, no problem!
        designer_label.font = UIFont.systemFont(ofSize: 13)
        designer_label.frame = CGRect(x: 120, y: 215, width: 280, height: 60)
        designer_label.text = "Sure, no problem!"
        designer_label.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.view.addSubview(designer_label)
        
    }
}
