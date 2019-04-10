//
//  MessageData.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/9/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit


extension ChatViewController {
    
    
    func setupMessageData() {
        
        
        let mark = Friend()
        mark.name = "mark zuckerberg"
        mark.profileImage = "steve"
        
        let markMessage = Message()
        markMessage.text = "hello this is steve jobs"
        markMessage.date = NSDate()
        markMessage.friend = mark
        
        let steve = Friend()
        steve.name = "steve jobs"
        steve.profileImage = "steve"
        
        let steveMessage = Message()
        steveMessage.text = "apple is the best product in the world"
        steveMessage.date = NSDate()
        steveMessage.friend = steve
        
        let harvey = Friend()
        harvey.name = "harvey spector"
        harvey.profileImage = "steve"
        
        let harveyMessage = Message()
        harveyMessage.text = "new model is going in the way"
        harveyMessage.date = NSDate()
        harveyMessage.friend = harvey
        
        createCustomMessage(message: "this is for test", date: NSDate(), name: "steve 2", profileImageName: "steve")
     
        messages?.append(harveyMessage)
        messages?.append(markMessage)
        messages?.append(steveMessage)
    }
    
    private func createCustomMessage(message: String, date: NSDate, name: String, profileImageName: String) {
        
        let friend = Friend()
        friend.name = name
        friend.profileImage = profileImageName
        
        let newMessage = Message()
        newMessage.text = message
        newMessage.date = date
        newMessage.friend = friend
        messages = [newMessage]
    }
}
