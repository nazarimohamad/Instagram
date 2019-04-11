//
//  ContactViewController .swift
//  Instagram
//
//  Created by Ryan Nazari on 4/7/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit
import JTMaterialTransition


class contactViewController: UIViewController {
    
     var transition: JTMaterialTransition?
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationItem.title = "contact"
        tabBarController?.navigationItem.rightBarButtonItem = nil
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        self.transition = JTMaterialTransition(animatedView: self.signupButton)
    }
    
    func setupView() {
        
        view.addSubview(upperView)
        upperView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        upperView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        upperView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        
        view.addSubview(avatar)
        avatar.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        avatar.centerXAnchor.constraint(equalTo: upperView.centerXAnchor).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: 128).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: 128).isActive = true
        
        
        view.addSubview(loginButton)
        let width = (view.frame.width / 2) - 20
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: width).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        
        view.addSubview(signupButton)
        signupButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        signupButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        signupButton.widthAnchor.constraint(equalToConstant: width).isActive = true
        signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        
        
    }
    
    let upperView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let avatar: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.red.cgColor
        image.layer.cornerRadius = 64
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("SIGNUP", for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        return button
    }()
    
    @objc func handleSignup() {
        
        didPresentControllerButtonTouch()

    }


func didPresentControllerButtonTouch () {
    let controller = SigupViewController()
    
    controller.modalPresentationStyle = .custom
    controller.transitioningDelegate = self.transition
    
    self.present(controller, animated: true, completion: nil)
}
    
    
}
