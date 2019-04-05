//
//  ChatListView.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/5/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit


class ChatListView: BaseCell {
    
//    let lastMessage: UITextView = {
//        let message = UITextView()
//        message.backgroundColor = .red
//        message.font = UIFont.systemFont(ofSize: 12)
//        message.tintColor = .lightGray
//        message.text = "Steave jobs"
//        message.translatesAutoresizingMaskIntoConstraints = false
//        return message
//    }()
//    
//    let dividerLine: UIView = {
//        let line = UIView()
//        line.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
//        line.translatesAutoresizingMaskIntoConstraints = false
//        return line
//    }()
    let profileImage: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .purple
        img.layer.cornerRadius = 25
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let profileName: UITextField = {
        let name = UITextField()
        name.backgroundColor = .blue
        name.font = UIFont.systemFont(ofSize: 16)
        name.text = "Steave jobs"
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let lastMessage: UITextField = {
        let message = UITextField()
        message.backgroundColor = .red
        message.font = UIFont.systemFont(ofSize: 12)
        message.textColor = UIColor(white: 0.3, alpha: 0.5)
        message.text = "like my photos"
        message.translatesAutoresizingMaskIntoConstraints = false
        return message
    }()
    
    let dividerLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(white: 0.3, alpha: 0.5)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    override func setuoViews() {
        super.setuoViews()
 


        addSubview(profileImage)
        profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        profileImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 4).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(profileName)
        profileName.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        profileName.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 10).isActive = true
        profileName.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        addSubview(lastMessage)
        lastMessage.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 4).isActive = true
        lastMessage.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 10).isActive = true
        lastMessage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -100).isActive = true
        
        addSubview(dividerLine)
        dividerLine.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 4).isActive = true
        dividerLine.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        dividerLine.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
        
   }
    
}


class SearchBar: BaseCell, UISearchBarDelegate {
    
    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.barStyle = .default
        search.placeholder = "search name"
        search.barTintColor = UIColor(white: 0.7, alpha: 0.4)
        search.delegate = self 
        search.sizeToFit()
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    override func setuoViews() {
        super.setuoViews()
        
       addSubview(searchBar)
        
       
        searchBar.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        searchBar.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        searchBar.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}
