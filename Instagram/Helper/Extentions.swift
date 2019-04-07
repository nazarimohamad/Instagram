//
//  Extentions.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/7/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit


extension UIImageView {
    
    func loadImageUsing(urlString: String) {
        
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
            
            if error != nil {
                print("there is error to get post photo from url \(String(describing: error))")
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }.resume()
    }
}
