//
//  Item+CoreDataClass.swift
//  ListItApp
//
//  Created by Jakub Slawecki on 31.01.2018.
//  Copyright © 2018 Jakub Slawecki. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {

    public override func awakeFromInsert() {
       
        super.awakeFromInsert()
       
        self.created = NSDate() //assaign current date to atribute "created"
    }
    
}
