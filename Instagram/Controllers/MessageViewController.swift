//
//  MessageViewController.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/8/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit
import CoreData


class MessageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var messages: [Message]?
    
    var friend: Friend? {
        didSet {
            navigationItem.title = friend?.name
            
            messages = friend?.messages?.allObjects as? [Message]
        }
    }
    
    let cellId = "cellId"
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        let width = view.frame.width
        let height = view.frame.height - 50
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: width).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        collectionView.register(MessageCell.self, forCellWithReuseIdentifier: cellId)
        
        setupTextField()
        NotificationCenter.default.addObserver(self, selector: #selector(handleShowKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    @objc func handleShowKeyboard() {
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = messages?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MessageCell
       
        cell.message = messages?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
    
    func setupTextField() {
        
        
        view.addSubview(container)
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        container.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        container.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        container.addSubview(messageTextField)
        messageTextField.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        messageTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10).isActive = true
        messageTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -60).isActive = true
        messageTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        container.addSubview(sendButton)
        sendButton.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        sendButton.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    
    let container: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let messageTextField: UITextField = {
        let message = UITextField()
        message.textColor = .black
        message.placeholder = "write message"
        message.font = UIFont.systemFont(ofSize: 16)
        message.translatesAutoresizingMaskIntoConstraints = false
        return message
    }()
    
    let sendButton: UIButton = {
        let send = UIButton(type: .system)
        send.setTitle("send", for: .normal)
        send.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        send.titleColor(for: .normal)
        send.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        send.translatesAutoresizingMaskIntoConstraints = false
        return send
    }()
    
    
}
