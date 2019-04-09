//
//  ChatListView.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/5/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit


class ChatListCell: BaseCell {
    
    var message: Message? {
        
        didSet {
            
            lastMessage.text = message?.text
            profileName.text = message?.friend?.name
            
            if let date = message?.date {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "hh:mm a"
                let elapsedTimeInSecond = NSDate().timeIntervalSince(date as Date)
                let secondsInday: TimeInterval = 60 * 60 * 24
                if elapsedTimeInSecond > 7 * secondsInday {
                    dateFormatter.dateFormat = "mm/DD/YYYY"
                } else if elapsedTimeInSecond > secondsInday {
                    dateFormatter.dateFormat = "EEE"
                }
                timeLable.text = dateFormatter.string(from: date as Date)
            }
            
            if let profileImageName = message?.friend?.profileImage {
                profileImage.image = UIImage(named: profileImageName)
            }
            
        }
    }
   
  
    
    override func setupViews() {
        super.setupViews()

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
        
        addSubview(timeLable)
        timeLable.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 4).isActive = true
        timeLable.leftAnchor.constraint(equalTo: lastMessage.rightAnchor, constant: 8).isActive = true
        
        addSubview(dividerLine)
        dividerLine.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 4).isActive = true
        dividerLine.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        dividerLine.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 0.3).isActive = true
        
   }
    
    let profileImage: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 25
        img.image = UIImage(named: "steve")
        img.contentMode = .scaleAspectFill
        img.layer.masksToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let profileName: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 16)
        name.text = "Steave jobs"
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let timeLable: UILabel = {
        let time = UILabel()
        time.text = "7:35 pm"
        time.font = UIFont.systemFont(ofSize: 12)
        time.textColor = UIColor(white: 0.3, alpha: 0.5)
        time.translatesAutoresizingMaskIntoConstraints = false
        return time
    }()
    
    let lastMessage: UILabel = {
        let message = UILabel()
        message.font = UIFont.systemFont(ofSize: 12)
        message.textColor = UIColor(white: 0.3, alpha: 0.5)
        message.text = "like my photos and share with your friends"
        message.translatesAutoresizingMaskIntoConstraints = false
        return message
    }()
    
    let dividerLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(white: 0.3, alpha: 0.5)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
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
    
    override func setupViews() {
        super.setupViews()
        
       addSubview(searchBar)
        
       
        searchBar.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        searchBar.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        searchBar.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
}


