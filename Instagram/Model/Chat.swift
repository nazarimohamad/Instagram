//
//  Message.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/8/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit


class Friend: NSObject {
    
    var name: String
    var message: Message?
    
    init(name: String) {
        self.name = name
    }
}

class Message: NSObject {
    
}
