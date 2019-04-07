//
//  Extentions.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/7/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    
    func loadImageUsing(urlString: String) {
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            
            if error != nil {
                print("there is error to get post photo from url \(String(describing: error))")
            }
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                self.image = imageToCache
            }
        }.resume()
    }
}
