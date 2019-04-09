//
//  Message.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/8/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit


class Friend: NSObject {
    
    var name: String?
    var profileImage: String?

}


class Message: NSObject {
    
    var text: String?
    var date: NSDate?
    
    var friend: Friend?
}
