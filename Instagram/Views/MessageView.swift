//
//  MessageView.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/8/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit


class MessageCell: BaseCell {
    
    
    
    let textMessage: UITextView = {
        var messages: [Message]?
        let message1 = UITextView()
        message1.text = "you are the right person"
        message1.font = UIFont.systemFont(ofSize: 18)
        message1.backgroundColor = .lightGray
        message1.translatesAutoresizingMaskIntoConstraints = false
        return message1
    }()
    
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .blue
        
        
        addSubview(textMessage)
        textMessage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textMessage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        textMessage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        textMessage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
 
}
