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
//        backgroundColor = .white
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
        storyImg.layer.cornerRadius = 37
        storyImg.translatesAutoresizingMaskIntoConstraints = false
       return storyImg
    }()
   
    override func setuoViews() {
       super.setuoViews()
        backgroundColor = .blue
        addSubview(storyImage)
        storyImage.widthAnchor.constraint(equalToConstant: 75).isActive = true
        storyImage.heightAnchor.constraint(equalToConstant: 75).isActive = true
        storyImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        storyImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}



