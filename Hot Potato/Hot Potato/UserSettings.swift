//
//  UserSettings.swift
//  Hot Potato
//
//  Created by Luther Yu on 12/15/19.
//  Copyright © 2019 Luther Yu. All rights reserved.
//

import Foundation
import CoreData

@objc(Person)
public class UserSettings:NSManagedObject, Identifiable {
    
    @NSManaged public var hotPotatoInput: Int32
    @NSManaged public var tapPotatoInput: Int32
    
}

extension UserSettings {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserSettings> {
        return NSFetchRequest<UserSettings>(entityName: "UserSettings")
    }

}
