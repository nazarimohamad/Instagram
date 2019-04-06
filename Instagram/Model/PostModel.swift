//
//  PostModel.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/6/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit


class Post: NSObject {
    
    var profile: Profile?
    
    var postImage: String?
    var numberOfLikes: NSNumber?
}


class Profile: NSObject {
    
    var profileImage: String?
    var profileName: String?
    
}
