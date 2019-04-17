//
//  MessageData.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/9/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//

import UIKit
import CoreData


extension ChatViewController {
    
    
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
    
    
    func setupMessageData() {
        
        clearData()
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            
            let mark = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            mark.name = "mark zuckerberg"
            mark.profileImageName = "steve"
            
            let markMessage = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            markMessage.text = "hello this is steve jobs"
            markMessage.date = NSDate().addingTimeInterval(-6 * 60)
            markMessage.friend = mark
            
            let steve = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            steve.name = "steve"
            steve.profileImageName = "steve"
            
            let steveMessage = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            steveMessage.text = "apple is the best product in the world"
            steveMessage.date = NSDate().addingTimeInterval(-5 * 60)
            steveMessage.friend = steve
            
            let steveMessage2 = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            steveMessage2.text = "just released swift 5.1"
            steveMessage2.date = NSDate().addingTimeInterval(-1 * 60)
            steveMessage2.friend = steve
            
            let harvey = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            harvey.name = "harvey spector"
            harvey.profileImageName = "steve"
            
            let harveyMessage = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            harveyMessage.text = "new model is going in the way"
            harveyMessage.date = NSDate().addingTimeInterval(-4 * 60)
            harveyMessage.friend = harvey
            
            createCustomMessage(message: "this is for test", secAgo: 2, name: "steve 2", profileImageName: "steve")
            
            messages?.append(harveyMessage)
            messages?.append(markMessage)
            messages?.append(steveMessage)
            
            do {
                try context.save()
            } catch {
                print("error to save data\(LocalizedError.self)")
            }
        }
        loadData()
        
    }
    
    private func createCustomMessage(message: String, secAgo: Double, name: String, profileImageName: String) {
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            let friend = NSEntityDescription.insertNewObject(forEntityName: "Friend", into: context) as! Friend
            friend.name = name
            friend.profileImageName = profileImageName
            
            let newMessage = NSEntityDescription.insertNewObject(forEntityName: "Message", into: context) as! Message
            newMessage.text = message
            newMessage.date = NSDate().addingTimeInterval(-secAgo * 60)
            newMessage.friend = friend
            messages = [newMessage]
        }
    }
    
    
    func loadData() {
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
           
            if let friends = fetchFriends() {
                
                messages = [Message]()
                
                for friend in friends {
                    
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Message")
                    fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "date", ascending: false)]
                    fetchRequest.predicate = NSPredicate(format: "friend.name = %@", friend.name!)
                    fetchRequest.fetchLimit = 1
                    do {
                        let fetchMessages = try context.fetch(fetchRequest) as? [Message]
                        messages?.append(contentsOf: fetchMessages!)
                    } catch let err {
                        print("there is error to load data\(err)")
                    }
                }
                messages = messages?.sorted(by: {$0.date!.compare($1.date! as Date) == .orderedDescending })
            }
        
        }
    }
    
    
    private func fetchFriends() -> [Friend]? {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
           let fetchFriends = NSFetchRequest<NSFetchRequestResult>(entityName: "Friend")
            do {
                return try context.fetch(fetchFriends) as? [Friend]
            } catch {
                print("error\(LocalizedError.self)")
            }
        }
        return nil
    }
    
}
