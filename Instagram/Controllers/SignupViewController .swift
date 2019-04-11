//
//  SignupViewController .swift
//  Instagram
//
//  Created by Ryan Nazari on 4/10/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit
import FirebaseAuth


class SigupViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
  
    let closButton: UIButton = {
        let close = UIButton()
        close.setImage(UIImage(named: "close"), for: .normal)
        close.translatesAutoresizingMaskIntoConstraints = false
        close.addTarget(self, action: #selector(handleCloseButton), for: .touchUpInside)
        return close
    }()
    
    @objc func handleCloseButton() {
         self.dismiss(animated: true, completion: nil)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        self.setNeedsStatusBarAppearanceUpdate()
//    }
//
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 54/256, green: 70/256, blue: 93/256, alpha: 1)
        
        
        view.addSubview(closButton)
        closButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        closButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        closButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        closButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(profileImage)
        profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        profileImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        view.addSubview(addPhoto)
        addPhoto.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 8).isActive = true
        addPhoto.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 93).isActive = true
        addPhoto.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        view.addSubview(userName)
        userName.topAnchor.constraint(equalTo: view.topAnchor, constant: 125).isActive = true
        userName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 12).isActive = true
        userName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        userName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        
        view.addSubview(emailAddress)
        emailAddress.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30).isActive = true
        emailAddress.heightAnchor.constraint(equalToConstant: 50).isActive = true
        emailAddress.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        emailAddress.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        
        view.addSubview(password)
        password.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
        password.heightAnchor.constraint(equalToConstant: 50).isActive = true
        password.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        password.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        
        view.addSubview(registerButton)
        registerButton.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        
    }
    
    let profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.contentMode = .scaleAspectFill
        profileImage.image = UIImage(named: "")
        profileImage.backgroundColor = .lightGray
        profileImage.layer.cornerRadius = 75
        profileImage.layer.masksToBounds = true
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        return profileImage
    }()
    
    let userName: UITextField = {
        let userName = UITextField()
        userName.placeholder = " Enter your name"
        userName.font = UIFont.systemFont(ofSize: 18)
        userName.textAlignment = .center
        userName.textColor = .black
        userName.backgroundColor = UIColor.white
        userName.translatesAutoresizingMaskIntoConstraints = false
        return userName
    }()
    
    let addPhoto: UIButton = {
        let addPhoto = UIButton(type: .contactAdd)
        addPhoto.setTitle("Add photo", for: .normal)
        addPhoto.setTitleColor(UIColor.white, for: .normal)
        addPhoto.tintColor = .white
        addPhoto.translatesAutoresizingMaskIntoConstraints = false
        addPhoto.addTarget(self, action: #selector(addPhotoFromActionSheet), for: .touchUpInside)
        return addPhoto
    }()
    
    let emailAddress: UITextField = {
        let emailAddress = UITextField()
        emailAddress.placeholder = " Enter your email address"
        emailAddress.font = UIFont.systemFont(ofSize: 18)
        emailAddress.textAlignment = .center
        emailAddress.textColor = .black
        emailAddress.backgroundColor = UIColor.white
        emailAddress.translatesAutoresizingMaskIntoConstraints = false
        return emailAddress
    }()
    
    
    let password: UITextField = {
        let password = UITextField()
        password.placeholder = " Enter password"
        password.font = UIFont.systemFont(ofSize: 18)
        password.textAlignment = .center
        password.textColor = .black
        password.backgroundColor = UIColor.white
        password.isSecureTextEntry = true
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    
    let registerButton: UIButton = {
        let registerButton = UIButton(type: .system)
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(UIColor.black, for: .normal)
        registerButton.backgroundColor = .green
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return registerButton
    }()
    
    
    @objc func handleRegister() {
        
        if let email = emailAddress.text, let password = password.text {
            createUserWith(email: email, password: password)
        }
    }
    
    func createUserWith(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if error != nil {
                
                let alertController = UIAlertController(title: "womethings wronge", message: "there is problem to register", preferredStyle: .alert)
                let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
                alertController.addAction(action)
                self.present(alertController, animated: true, completion: nil)
            }
            else {
                
                self.present(CompleteProfileViewController(), animated: true, completion: nil)
            }
        }
    }
    
    
    @objc func addPhotoFromActionSheet() {
        print("add new photo button pressed")
        let alert = UIAlertController(title: "select photo", message: "this is message", preferredStyle: .actionSheet)
        let galery = UIAlertAction(title: "Gallery", style: .default) { (galery) in
            self.takeImage(1)
        }
        let camera = UIAlertAction(title: "Camera", style: .default) { (camera) in
            self.takeImage(2)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(galery)
        alert.addAction(camera)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func takeImage(_ source: Int) {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        switch source {
        case 1:
            imagePicker.sourceType = .photoLibrary
        case 2:
            imagePicker.sourceType = .camera
        default:
            imagePicker.sourceType = .photoLibrary
        }
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let userPickerImage = info[.editedImage] as! UIImage
        profileImage.image = userPickerImage
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
}


