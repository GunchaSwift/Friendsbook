//
//  LoadedFriend+CoreDataProperties.swift
//  Friendsbook
//
//  Created by Guntars Reiss on 31/08/2022.
//
//

import Foundation
import CoreData


extension LoadedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LoadedFriend> {
        return NSFetchRequest<LoadedFriend>(entityName: "LoadedFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var loadedUser: LoadedUser?
    
    public var wrappedId: String {
        id ?? "Unknown id"
    }
    
    public var wrappedName: String {
        name ?? "Unknown name"
    }

}

extension LoadedFriend : Identifiable {

}
