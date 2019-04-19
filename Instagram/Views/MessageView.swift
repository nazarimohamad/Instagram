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
                textMessage.frame = CGRect(x: 15, y: 0, width: estimatedSize.width + 10, height: estimatedSize.height + 20)
                bubble.frame = CGRect(x: 10, y: 0, width: estimatedSize.width + 15, height: estimatedSize.height + 20)
            }
        }
    }
    
    let textMessage: UITextView = {
        let message1 = UITextView()
        message1.text = "you are the right person"
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
