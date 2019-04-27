//
//  MessageViewController.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/8/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit
import CoreData


class MessageViewController: UICollectionViewController, NSFetchedResultsControllerDelegate {
    
    var friend: Friend?
    
    let cellId = "cellId"
    
    var bottomConstrant: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = friend?.name
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        
        
        let gauid  = view.safeAreaLayoutGuide
        let height = (view.frame.height) - (view.safeAreaInsets.bottom + 60)
        collectionView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
        
        collectionView.register(MessageCell.self, forCellWithReuseIdentifier: cellId)
        
        setupTextField()
        
        view.addSubview(container)
        NSLayoutConstraint(item: container, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: container, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: container, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50).isActive = true
        bottomConstrant = NSLayoutConstraint(item: container, attribute: .bottom, relatedBy: .equal, toItem: gauid, attribute: .bottom, multiplier: 1, constant: 0)
        view.addConstraint(bottomConstrant!)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        do {
            try fetchResaultController.performFetch()
        } catch {
            print("error to catch message \(LocalizedError.self)")
        }
        
    }
    
    //MARK: Handle Keyboard
    @objc func handleKeyboard(_ notification: Notification) {
        if let keyboaradSize: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue? {
            let keyboardFram = keyboaradSize.cgRectValue
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                
                let height = -(keyboardFram.height - self.view.safeAreaInsets.bottom)
                self.bottomConstrant?.constant = height
                let isKeyboardShowing = notification.name == UIResponder.keyboardWillShowNotification
                self.bottomConstrant?.constant = isKeyboardShowing ? height : 0
                self.view.layoutIfNeeded()
                
            }) { (completion) in
                
                let item = (self.fetchResaultController.sections?[0].numberOfObjects)! - 1
                let lastIndex = IndexPath(item: item, section: 0) as IndexPath
                self.collectionView.scrollToItem(at: lastIndex, at: .bottom, animated: true)
            }
        } else {
            bottomConstrant?.constant = 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        messageTextField.endEditing(true)
    }
    
    
    //MARK: Fetch Messages
    lazy var fetchResaultController: NSFetchedResultsController = { () -> NSFetchedResultsController<Message> in
        let fetchRequest = NSFetchRequest<Message>(entityName: "Message")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        fetchRequest.predicate = NSPredicate(format: "friend.name = %@", self.friend!.name!)
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        return frc
    }()
    
    var blockOperation = [BlockOperation]()
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        if type == .insert {
            blockOperation.append(BlockOperation(block: {
                self.collectionView.insertItems(at: [newIndexPath!])
            }))
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        collectionView.performBatchUpdates({
            for operation in blockOperation {
                operation.start()
            }
        }) { (completed) in
            let item = (self.fetchResaultController.sections?[0].numberOfObjects)! - 1
            let indexPath = NSIndexPath(item: item, section: 0)
            self.collectionView.scrollToItem(at: indexPath as IndexPath, at: .bottom, animated: true)
        }
    }
    
    //MARK: Setup textField
    func setupTextField() {
        
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
        
        container.addSubview(dividerLine)
        dividerLine.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        dividerLine.widthAnchor.constraint(equalTo: container.widthAnchor).isActive = true
        dividerLine.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
    }
    
    
    let container: UIView = {
        let container = UIView()
        container.backgroundColor = .white
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
        send.addTarget(self, action: #selector(handleSendButton), for: .touchUpInside)
        return send
    }()
    
    let dividerLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(white: 0.5, alpha: 0.8)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    
    @objc func handleSendButton() {
        guard let messageText = messageTextField.text else {return}
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            FetchingMessage.createCustomMessage(text: messageText, minAgo: 1, friend: friend!, context: context, isSender: true)
            
            do {
                try context.save()
                messageTextField.text = nil
            } catch {
                print("error to save messageTextField\(LocalizedError.self)")
            }
        }
    }
    
}


//MARK: extension-collection view
extension MessageViewController:  UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = fetchResaultController.sections?[0].numberOfObjects {
            return count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MessageCell
        let message = fetchResaultController.object(at: indexPath) as Message
        cell.message = message
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let message = fetchResaultController.object(at: indexPath) as Message
        if let messageText = message.text {
            let size = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedSize = NSString(string: messageText).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)], context: nil)
            return CGSize(width: view.frame.width, height: estimatedSize.height + 20)
        }
        
        return CGSize(width: view.frame.width, height: 100)
    }
}
