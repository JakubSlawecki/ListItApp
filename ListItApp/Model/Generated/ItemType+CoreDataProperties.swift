//
//  ItemType+CoreDataProperties.swift
//  ListItApp
//
//  Created by Jakub Slawecki on 31.01.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType")
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
