//
//  FetchImagePosts.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/7/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit


class FetchImagePosts: NSObject {

    static let shareInstant = FetchImagePosts()
    
    func fetchPosts(completion: @escaping ([Post]) -> ()) {
        
        let url = NSURL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            if error != nil {
                print("there is error to fetch data \(String(describing: error))")
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                var posts = [Post]()
                
                for dictionary in json as! [[String: AnyObject]] {
                    
                    let post = Post()
                    post.numberOfLikes = dictionary["number_of_views"] as? NSNumber
                    post.postImage = dictionary["thumbnail_image_name"] as? String
                    
                    let profileDictionary = dictionary["channel"] as! [String: AnyObject]
                    let profile = Profile()
                    profile.profileName = profileDictionary["name"] as? String
                    profile.profileImage = profileDictionary["profile_image_name"] as? String
                    
                    post.profile = profile
                    posts.append(post)
                }
                
                DispatchQueue.main.async {
                    completion(posts)
                }
                
            } catch let jsonError{
                print("error in json\(jsonError)")
            }
            }.resume()
    }
}
