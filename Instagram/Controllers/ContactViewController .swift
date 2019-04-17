//
//  ContactViewController .swift
//  Instagram
//
//  Created by Ryan Nazari on 4/7/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
//import FirebaseUI
import JTMaterialTransition


class contactViewController: UIViewController {
    
     var user: [User]?
     var transition: JTMaterialTransition?
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.navigationItem.title = "contact"
        tabBarController?.navigationItem.rightBarButtonItem = nil
        view.backgroundColor = .white
        fetchUsername()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        self.transition = JTMaterialTransition(animatedView: self.signupButton)
        self.transition = JTMaterialTransition(animatedView: self.loginButton)
        
//        fetchUserProfile()
    }
    
    
    func fetchUsername() {
        
        FetchingUserProfile.shareInstance.fetchUsername { (user: [User]) in
            self.user = user
            
            self.setupProfile()
        }
    }
    
    
    func setupProfile() {
        let firstUser = user![0]
        userLabel.text = firstUser.username
        
        let usernameImageUrl = firstUser.usernameImageUrl
        let storageRef = Storage.storage().reference(forURL: usernameImageUrl!)
        storageRef.downloadURL(completion: { (url, error) in
            if error != nil {
                //faied
                print("error to fetch image \(LocalizedError.self)")
            }
            do {
                let data = try Data(contentsOf: url!)
                let image = UIImage(data: data as Data)
                self.avatar.image = image
            } catch {
                print("error to fetch image\(LocalizedError.self)")
            }
        })
    }
    
    
//    func fetchUserProfile() {
//        if Auth.auth().currentUser != nil {
//
//            let uid = Auth.auth().currentUser?.uid
//            let pathReference = Storage.storage().reference(withPath: "users\(uid!)")
//
//            let imageView: UIImageView = avatar
//            let placeholderImage = UIImage(named: "placeholder.jpg")
//            imageView.sd_setImage(with: pathReference, placeholderImage: placeholderImage)
//        }
//
//    }
    
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
        
        view.addSubview(userLabel)
        userLabel.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 50).isActive = true
        userLabel.centerXAnchor.constraint(equalTo: upperView.centerXAnchor).isActive = true
        
        if Auth.auth().currentUser != nil {
            
            view.addSubview(logoutButton)
            logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
            logoutButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        }
        else {
            
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

        
        
    }
    
    @objc func handleSignup() {
        didPresentControllerButtonTouch()
    }
    
    func didPresentControllerButtonTouch () {
        let controller = SigupViewController()
        
        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = self.transition
        
        self.present(controller, animated: true, completion: nil)
    }
    
    
    @objc func handleLogin() {
        let controller = LoginViewController()
        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = self.transition
        
        self.present(controller, animated: true, completion: nil)
    }
    
    
    @objc func handleLogout() {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                self.dismiss(animated: true, completion: nil)
            } catch {
                print("error to signout")
            }
        }
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
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.cornerRadius = 64
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.backgroundColor = UIColor(displayP3Red: 54/256, green: 70/256, blue: 93/256, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var signupButton: UIButton = {
        let button = UIButton()
        button.setTitle("SIGNUP", for: .normal)
        button.backgroundColor = UIColor(displayP3Red: 54/256, green: 70/256, blue: 93/256, alpha: 1)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        return button
    }()
    
    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("LOGOUT", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        return button
    }()
    
    
    let userLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "please login first"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
