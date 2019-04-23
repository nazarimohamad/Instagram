//
//  MessageViewController.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/8/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit
import CoreData


class MessageViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, NSFetchedResultsControllerDelegate{
    
    var friend: Friend?
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        navigationItem.title = friend?.name
        
        do {
            try fetchResaultController.performFetch()
        } catch {
            print("error to catch message \(LocalizedError.self)")
        }
        
        collectionView.register(MessageCell.self, forCellWithReuseIdentifier: cellId)
        
        setupTextField()
        
        let gauid  = view.safeAreaLayoutGuide
        view.addSubview(container)
        container.bottomAnchor.constraint(equalTo: gauid.bottomAnchor).isActive = true
        container.leadingAnchor.constraint(equalTo: gauid.leadingAnchor).isActive = true
        container.rightAnchor.constraint(equalTo: gauid.rightAnchor).isActive = true
        container.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleShowKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleHideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func handleShowKeyboard(_ notification: Notification) {
        if let keyboaradSize: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue? {
            let keyboardFram = keyboaradSize.cgRectValue
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.view.frame.origin.y -= self.view.safeAreaInsets.bottom
                self.view.frame.origin.y -= keyboardFram.height
                self.view.layoutIfNeeded()
                
            }) { (completion) in
                
            }
        }
    }
    
    @objc func handleHideKeyboard(_ notification: Notification) {
        if let keyboaradSize: NSValue = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! NSValue? {
            let keyboardFram = keyboaradSize.cgRectValue
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {

                self.view.frame.origin.y += self.view.safeAreaInsets.bottom
                self.view.frame.origin.y += keyboardFram.height
                self.view.layoutIfNeeded()

            }) { (completion) in

            }
        }
    }
    
    
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

