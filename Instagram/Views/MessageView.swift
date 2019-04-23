//
//  MessageView.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/8/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit


class MessageCell: BaseCell {
    
    var message: Message? {
        didSet {
            
            textMessage.text = message?.text
            
            if let messageText = message?.text {
                let size = CGSize(width: 250, height: 1000)
                let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
                let estimatedSize = NSString(string: messageText).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)], context: nil)
                if message?.isSender == false {
                    textMessage.frame = CGRect(x: 15, y: 0, width: estimatedSize.width + 10, height: estimatedSize.height + 20)
                    bubble.frame = CGRect(x: 10, y: 0, width: estimatedSize.width + 20, height: estimatedSize.height + 20)
                } else {
                    let x = UIScreen.main.bounds.width - estimatedSize.width - 25
                    textMessage.frame = CGRect(x: x, y: 0, width: estimatedSize.width + 10, height: estimatedSize.height + 20)
                    bubble.frame = CGRect(x: x - 5 , y: 0, width: estimatedSize.width + 20, height: estimatedSize.height + 20)
                    textMessage.textColor = .white
                    bubble.backgroundColor = UIColor(red: 125/255, green: 170/255, blue: 250/255, alpha: 1)
                }
            }
        }
    }
    
    let textMessage: UITextView = {
        let message1 = UITextView()
        message1.text = "you are right here"
        message1.font = UIFont.systemFont(ofSize: 18)
        message1.isEditable = false
        message1.backgroundColor = .clear
        message1.translatesAutoresizingMaskIntoConstraints = false
        return message1
    }()
    
    
    let bubble: UIView = {
        let bubble = UIView()
        bubble.backgroundColor = UIColor(white: 0.8, alpha: 0.5)
        bubble.layer.cornerRadius = 15
        bubble.layer.masksToBounds = true
        bubble.translatesAutoresizingMaskIntoConstraints = false
        return bubble
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(bubble)
        addSubview(textMessage)
        
    }
    
 
}




