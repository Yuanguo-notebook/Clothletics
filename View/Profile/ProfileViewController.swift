//
//  ProfileViewController.swift
//  Clothletics

//

import UIKit

class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        y = navigationbar_height + upperView_height + buttonView_width
        icon_width = location_height - 20
    
        setupProfileUI()
         setupProfilePhoto()
        setupButtonView()
        
        setupLocationView()
        setupDescriptionView()
    }

    private var upperView = UIView()
    private var profile_photo_main = UIImageView()
    private let profile_photo_main_width: CGFloat = 100
    private var profile_label = UILabel()
    private let profile_label_width: CGFloat = 150
    private let upperView_height: CGFloat = 200
    
    private var buttonView = UIView()
    private let buttonView_width: CGFloat = 82.6
    private let button_width: CGFloat = 42.6
    private let side_value: CGFloat = 20
    private var btn_like = UIButton()
    private var btn_message = UIButton()
    private var btn_order = UIButton()
    private var btn_profile = UIButton()
    private var btn_photo = UIButton()
    
    private var locationView = UIView()
    private var descriptionView = UIView()
    private var vaguewhite = UIColor.colorWithHexString(hex: "FCFCFC")
    private let location_height: CGFloat = 50
    private var location_label = UILabel()
    private var location_icon = UIImageView()
    private var description_label = UILabel()
    private var write_icon = UIImageView()
    private let slide: CGFloat = 20
    
    
    private var y: CGFloat = 0.0
    private var icon_width: CGFloat = 0.0
}


/**
 upper view which hold
 main photo and name
 */
extension ProfileViewController{
    
    private func setupProfileUI(){
        view.backgroundColor = UIColor.colorWithHexString(hex: "#F2EDEA")
        
        
    }
    
    private func setupProfilePhoto(){
        
        upperView.frame = CGRect(x: 0,
                                 y: navigationbar_height,
                                 width: screen_width,
                                 height: upperView_height)
        upperView.backgroundColor = UIColor.colorWithHexString(hex: "FC6955")
        view.addSubview(upperView)
        let y: CGFloat = 40
        profile_label.text = "Mary Lyon"
        profile_label.textAlignment = .center
        profile_label.frame = CGRect(x: screen_width*0.5 - profile_label_width*0.5,
                                     y:  profile_label_width + 0.3*y,
                                     width: profile_label_width,
                                     height: 30)
        
        upperView.addSubview(profile_label)
        profile_photo_main.frame = CGRect(x: screen_width*0.5 - profile_photo_main_width*0.5,
                                          y: y ,
                                          width: profile_photo_main_width,
                                          height: profile_photo_main_width)
        
        profile_photo_main.image = UIImage(named: "profile_photo_main")
        upperView.addSubview(profile_photo_main)
    }
}


extension ProfileViewController{
    
    private func setupButtonView(){
    
        buttonView.frame = CGRect(x: 0,
                                  y: navigationbar_height + upperView_height,
                                  width: screen_width,
                                  height: buttonView_width)
        buttonView.backgroundColor = UIColor.colorWithHexString(hex: "F7F7F7")
        
        
        btn_like.frame = CGRect(x: side_value,
                                y: side_value,
                                width: button_width,
                                height: button_width)
        btn_like.setImage(UIImage(named: "profile_like"), for: .normal)
        btn_like.addTarget(self, action: #selector(ProfileViewController.button_like), for: .touchUpInside)
        buttonView.addSubview(btn_like)
        
        
        
        
        btn_message.frame = CGRect(x: buttonView_width + side_value,
                                y: side_value,
                                width: button_width,
                                height: button_width)
        btn_message.setImage(UIImage(named: "profile_message"), for: .normal)
        btn_message.addTarget(self, action: #selector(ProfileViewController.button_like), for: .touchUpInside)
        buttonView.addSubview(btn_message)
        
        
        btn_order.frame = CGRect(x: 2*buttonView_width + side_value,
                                   y: side_value,
                                   width: button_width,
                                   height: button_width)
        btn_order.setImage(UIImage(named: "profile_order"), for: .normal)
        btn_order.addTarget(self, action: #selector(ProfileViewController.button_like), for: .touchUpInside)
        buttonView.addSubview(btn_order)
        
        
        
        btn_profile.frame = CGRect(x: 3*buttonView_width + side_value,
                                 y: side_value,
                                 width: button_width,
                                 height: button_width)
        btn_profile.setImage(UIImage(named: "profile_profile"), for: .normal)
        btn_profile.addTarget(self, action: #selector(ProfileViewController.button_like), for: .touchUpInside)
        buttonView.addSubview(btn_profile)
        
        
        
        
        
        btn_photo.frame = CGRect(x: 4*buttonView_width + side_value,
                                 y: side_value,
                                 width: button_width,
                                 height: button_width)
        btn_photo.setImage(UIImage(named: "profile_photo"), for: .normal)
        btn_photo.addTarget(self, action: #selector(ProfileViewController.button_like), for: .touchUpInside)
        buttonView.addSubview(btn_photo)
        
        view.addSubview(buttonView)
        
        
    }
    
    @objc private func button_like(){
        let vc = LikeViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
}


extension ProfileViewController{
    
    private func setupLocationView(){
        
        locationView.frame = CGRect(x: slide,
                                    y: y + slide,
                                    width: screen_width - 2*slide,
                                    height: location_height)
        locationView.backgroundColor = vaguewhite
        
        location_label.text = "Springfied, Massachusetts"
        location_label.frame = CGRect(x: 40, y: 0, width: 300, height: 40)
        locationView.addSubview(location_label)
        
        location_icon.frame = CGRect(x: 7, y: 7, width: icon_width, height: icon_width)
        location_icon.image = UIImage(named: "location_icon")
        locationView.addSubview(location_icon)
        view.addSubview(locationView)
    }
    
    private func setupDescriptionView(){
        
        descriptionView.frame = CGRect(x: slide,
                                    y: navigationbar_height + upperView_height + buttonView_width + location_height + 2*slide,
                                    width: screen_width - 2*slide,
                                    height: 150)
        descriptionView.backgroundColor = vaguewhite
        
        
        description_label.text = "I especially like black and blue. Do not have too many floral patterns. Keep it simple. Need something that I can wear to work."
        description_label.frame = CGRect(x: 40, y: 0, width: 300, height: 100)
        description_label.lineBreakMode = NSLineBreakMode.byWordWrapping
        description_label.numberOfLines = 0
        descriptionView.addSubview(description_label)
        
        write_icon.frame = CGRect(x: 7, y: 7, width: icon_width, height: icon_width)
        write_icon.image = UIImage(named: "write_icon")
        descriptionView.addSubview(write_icon)
        
        
        view.addSubview(descriptionView)
    }
}
