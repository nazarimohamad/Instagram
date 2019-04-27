//
//  MessageData.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/9/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit
import CoreData


class FetchingMessage: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    func clearData() {

        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {

            do {
                let entityName = ["Friend", "Message"]
                for entityName in entityName {
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
                    let objects = try context.fetch(fetchRequest) as? [NSManagedObject]
                    for object in objects! {
                        context.delete(object)
                    }
                }
                try context.save()

            } catch {
                print("error to clear data \(LocalizedError.self)")
            }

        }

    }
    
    
//    func loadData() {
//
//        let delegate = UIApplication.shared.delegate as? AppDelegate
//        if let context = delegate?.persistentContainer.viewContext {
//
//            if let friends = fetchFriends() {
//
//                messages = [Message]()
//
//                for friend in friends {
//
//                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Message")
//                    fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "date", ascending: false)]
//                    fetchRequest.predicate = NSPredicate(format: "friend.name = %@", friend.name!)
//                    fetchRequest.fetchLimit = 1
//                    do {
//                        let fetchMessages = try context.fetch(fetchRequest) as? [Message]
//                        messages?.append(contentsOf: fetchMessages!)
//                    } catch let err {
//                        print("there is error to load data\(err)")
//                    }
//                }
//                messages = messages?.sorted(by: {$0.date!.compare($1.date! as Date) == .orderedDescending })
//            }
//
//        }
//    }
    
//    private func fetchFriends() -> [Friend]? {
//        let delegate = UIApplication.shared.delegate as? AppDelegate
//        if let context = delegate?.persistentContainer.viewContext {
//            let fetchFriends = NSFetchRequest<NSFetchRequestResult>(entityName: "Friend")
//            do {
//                return try context.fetch(fetchFriends) as? [Friend]
//            } catch {
//                print("error\(LocalizedError.self)")
//            }
//        }
//        return nil
//    }

    
    func setupMessageData() {
        
        clearData()
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            
            let mark = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            mark.name = "mark zuckerberg"
            mark.profileImageName = "mark"
            
            let markMessage = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            markMessage.text = "hello this is steve jobs"
            markMessage.date = NSDate().addingTimeInterval(-6 * 60)
            markMessage.friend = mark
            mark.lastMessage = markMessage
            
            let steve = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            steve.name = "steve"
            steve.profileImageName = "steve"
            
            let steveMessage = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            steveMessage.text = """
            apple is the best product in the world. if you wanna create appliations for apple you should
            learn swift and xcode
            """
            steveMessage.date = NSDate().addingTimeInterval(-5 * 60)
            steveMessage.friend = steve
            steve.lastMessage = steveMessage
            
            let steveMessage2 = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            steveMessage2.text = "just released swift 5.1"
            steveMessage2.date = NSDate().addingTimeInterval(-3 * 60)
            steveMessage2.friend = steve
            steve.lastMessage = steveMessage2
            
//            createCustomMessageForSteve(context: context)
            
            let harvey = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            harvey.name = "Bill gates"
            harvey.profileImageName = "bil"
            
            let harveyMessage = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            harveyMessage.text = "new model is going in the way"
            harveyMessage.date = NSDate().addingTimeInterval(-4 * 60)
            harveyMessage.friend = harvey
            harvey.lastMessage = harveyMessage
            
            
            do {
                try context.save()
            } catch {
                print("error to save data\(LocalizedError.self)")
            }
        }
//        loadData()
        
    }
    
    @discardableResult static func createCustomMessage(text: String, minAgo: Double, friend: Friend, context: NSManagedObjectContext, isSender: Bool = false) -> Message {
            
            let message = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            message.text = text
            message.date = NSDate().addingTimeInterval(-minAgo * 60)
            message.friend = friend
            message.isSender = isSender
        
            friend.lastMessage = message
        return message
    }
    
//    private func createCustomMessageForSteve(context: NSManagedObjectContext) {
//
//        let steve = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
//        steve.name = "steve"
//        steve.profileImageName = "steve"
    
//        ChatViewController.createCustomMessage(text: "this is for test", minAgo: 1, friend: steve, context: context)
//        ChatViewController.createCustomMessage(text: "test 2", minAgo: 0, friend: steve, context: context)
//    }
    
    
}
