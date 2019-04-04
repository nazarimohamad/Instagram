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
        storyImg.contentMode = .scaleAspectFill
        storyImg.translatesAutoresizingMaskIntoConstraints = false
       return storyImg
    }()
    
    let name: UITextField = {
        let name = UITextField()
        name.text = "  your story"
        name.textColor = .black
        name.font = UIFont.systemFont(ofSize: 13)
        name.minimumFontSize = 8
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let dividerLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
   
    override func setuoViews() {
       super.setuoViews()
        
        backgroundColor = .blue
        addSubview(storyImage)
        storyImage.widthAnchor.constraint(equalToConstant: 75).isActive = true
        storyImage.heightAnchor.constraint(equalToConstant: 75).isActive = true
        storyImage.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        storyImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(name)
        name.topAnchor.constraint(equalTo: storyImage.bottomAnchor, constant: 4).isActive = true
        name.leftAnchor.constraint(equalTo: storyImage.leftAnchor).isActive = true
        name.rightAnchor.constraint(equalTo: storyImage.rightAnchor).isActive = true
        name.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSubview(dividerLine)
        dividerLine.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8).isActive = true
        dividerLine.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
}



