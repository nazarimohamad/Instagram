//
//  Message+CoreDataProperties.swift
//  Instagram
//
//  Created by Ryan Nazari on 4/17/19.
//  Copyright © 2019 Ryan Nazari. All rights reserved.
//
//

import Foundation
import CoreData


extension Message {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Message> {
        return NSFetchRequest<Message>(entityName: "Message")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var text: String?
    @NSManaged public var friend: Friend?

}
