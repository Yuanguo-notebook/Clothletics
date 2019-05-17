//
//  DialogueViewController.swift
//  Clothletics

//

import UIKit

class DialogueViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupDialogueUI()
        setupTextView()
    }

    var textUIView = UIView()

   

}

extension DialogueViewController{
    
    private func setupDialogueUI(){
        let profileButton = UIBarButtonItem(image: UIImage(named: "tabbar_profile"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(profile))
        profileButton.tintColor = UIColor.white
        
        navItem.rightBarButtonItem = profileButton
    }
    
    @objc private func profile(){
        
        
    }
    
    
    
}


extension DialogueViewController{
    
    private func setupTextView(){  //
        textUIView.frame = CGRect(x: 0, y: screen_height - 44, width: screen_width, height: 44)
        
        textUIView.backgroundColor = lightgray
        
        textUIView.isHidden = false
        view.addSubview(textUIView)
        setupTextButtons()
        setupTextField()
    }
    
    private func setupTextButtons(){
        let add = UIButton(frame: CGRect(x: 5, y: 5, width: 30, height: 30))
        add.setImage(UIImage(named: "add_circle"), for: .normal)
        add.isHidden = false
        textUIView.addSubview(add)
    }
    
    private func setupTextField(){
        let dialogueText = UITextField()
        dialogueText.frame = CGRect(x: 40, y: 5, width: screen_width, height: 35)
        dialogueText.isHidden = false
        dialogueText.borderStyle = UITextBorderStyle.roundedRect
        dialogueText.backgroundColor = UIColor.white
        dialogueText.textAlignment = .left
        dialogueText.clearButtonMode = .unlessEditing
        dialogueText.keyboardType = .default
        dialogueText.returnKeyType = UIReturnKeyType.send
        dialogueText.isUserInteractionEnabled = true
        dialogueText.isEnabled = true
        dialogueText.becomeFirstResponder()
        textUIView.addSubview(dialogueText)
        
        
    }
}
