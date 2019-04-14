//
//  FetchingUserProfile.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/14/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage


class FetchingUserProfile: NSObject {
    
    static let shareInstance = FetchingUserProfile()
    
    func fetchUsername(completion: @escaping ([User]) -> ()) {
        
        var currentUser = [User]()
        
        if Auth.auth().currentUser != nil {
            
            let uid = Auth.auth().currentUser?.uid
            let dbRefrence = Database.database().reference(withPath: "users/profile/\(uid!)")
            dbRefrence.observeSingleEvent(of: .value) { (snapshot) in
                if snapshot.exists() {
                    let user = snapshot.value as? [String : AnyObject] ?? [:]
                    let username = user["username"] as! String
//                    self.userLabel.text = username
                    let cUser = User()
                    cUser.username = username
                    
                    let profileUrl = user["photoURL"] as! String
                    cUser.usernameImageUrl = profileUrl
                    
                    currentUser.append(cUser)
                }
                 completion(currentUser)
            }
           
        }
        
    }
    
}
