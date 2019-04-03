//
//  HomeView.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/3/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setuoViews()
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setuoViews() {
        
    }
}


class StoryCell: BaseCell {
    
    let storyImage: UIImageView = {
        let storyImg = UIImageView()
        storyImg.backgroundColor = .red
        storyImg.layer.cornerRadius = 22
        storyImg.translatesAutoresizingMaskIntoConstraints = false
       return storyImg
    }()
   
    override func setuoViews() {
       super.setuoViews()
//        backgroundColor = .blue
        addSubview(storyImage)
        storyImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        storyImage.widthAnchor.constraint(equalToConstant: 44).isActive = true
        storyImage.heightAnchor.constraint(equalToConstant: 44).isActive = true
        storyImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}



