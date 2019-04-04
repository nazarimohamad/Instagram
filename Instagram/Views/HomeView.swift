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
    
    let storyName: UITextField = {
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
        storyImage.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        storyImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(storyName)
        storyName.topAnchor.constraint(equalTo: storyImage.bottomAnchor, constant: 4).isActive = true
        storyName.leftAnchor.constraint(equalTo: storyImage.leftAnchor).isActive = true
        storyName.rightAnchor.constraint(equalTo: storyImage.rightAnchor).isActive = true
        storyName.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSubview(dividerLine)
        dividerLine.topAnchor.constraint(equalTo: storyName.bottomAnchor, constant: 8).isActive = true
        dividerLine.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
}

class CardCell: BaseCell {
    
    
    let profileImage: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .purple
        img.layer.cornerRadius = 21
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let profileName: UITextField = {
        let name = UITextField()
        name.backgroundColor = .green
        name.font = UIFont.boldSystemFont(ofSize: 16)
        name.text = "Steave jobs"
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let dotTextField: UITextField = {
        let dtext = UITextField()
        dtext.text = "..."
        dtext.backgroundColor = .red
        dtext.translatesAutoresizingMaskIntoConstraints = false
        return dtext
    }()
    
    let postImage: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .lightGray
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    
    let likeButton: UIButton = {
        let likeBtn = UIButton()
        likeBtn.setTitle("likeButton", for: .normal)
        likeBtn.translatesAutoresizingMaskIntoConstraints = false
        return likeBtn
    }()
    
    let commentButton: UIButton = {
        let commentBtn = UIButton()
        commentBtn.setTitle("commentButton", for: .normal)
        commentBtn.translatesAutoresizingMaskIntoConstraints = false
        return commentBtn
    }()
    
    let shareButton: UIButton = {
        let shareBtn = UIButton()
        shareBtn.setTitle("shareButton", for: .normal)
        shareBtn.translatesAutoresizingMaskIntoConstraints = false
        return shareBtn
    }()
    
    override func setuoViews() {
        super.setuoViews()
        
        addSubview(profileImage)
        profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        profileImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 42).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        addSubview(profileName)
        profileName.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        profileName.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 14).isActive = true
        profileName.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        
        addSubview(dotTextField)
        dotTextField.topAnchor.constraint(equalTo: profileName.topAnchor).isActive = true
        dotTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -4).isActive = true
        dotTextField.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        addSubview(postImage)
        postImage.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 8).isActive = true
        postImage.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        postImage.heightAnchor.constraint(equalToConstant: 362).isActive = true
        
        addSubview(likeButton)
        likeButton.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 8).isActive = true
        likeButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 42).isActive = true
        
        addSubview(commentButton)
        commentButton.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 8).isActive = true
        commentButton.leftAnchor.constraint(equalTo: likeButton.rightAnchor, constant: 4).isActive = true
        commentButton.widthAnchor.constraint(equalToConstant: 42).isActive = true
        
        addSubview(shareButton)
        shareButton.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 8).isActive = true
        shareButton.leftAnchor.constraint(equalTo: commentButton.rightAnchor, constant: 4).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 42).isActive = true
        
    }
}


