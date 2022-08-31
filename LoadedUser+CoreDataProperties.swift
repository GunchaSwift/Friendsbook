//
//  LoadedUser+CoreDataProperties.swift
//  Friendsbook
//
//  Created by Guntars Reiss on 31/08/2022.
//
//

import Foundation
import CoreData


extension LoadedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LoadedUser> {
        return NSFetchRequest<LoadedUser>(entityName: "LoadedUser")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var friends: NSObject?
    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: String?
    @NSManaged public var tags: String?
    @NSManaged public var loadedFriend: NSSet?
    
    public var wrappedAbout: String {
        about ?? "Unknown about"
    }
    
    public var wrappedAddress: String {
        address ?? "Unknown address"
    }
    
    public var wrappedCompany: String {
        company ?? "Unknown company"
    }
    
    public var wrappedEmail: String {
        email ?? "Unknown email"
    }
    
    public var wrappedId: String {
        id ?? "Unknown id"
    }
    
    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    public var wrappedRegistered: String {
        registered ?? "Unknown date of registration"
    }
    
    public var wrappedTags: String {
        tags ?? "Unknown tags"
    }
    
    var friendsArray: [LoadedFriend] {
        get {
            let newSet = loadedFriend as? Set<LoadedFriend> ?? []
            
            return newSet.sorted {
                $0.name ?? "" < $1.name ?? ""
            }
        }
        set {
            let newSet = loadedFriend as? Set<LoadedFriend> ?? []
            var sortedSet = newSet.sorted {
                $0.name ?? "" < $1.name ?? ""
            }
            sortedSet = newValue
        }
    }
    
}

// MARK: Generated accessors for loadedFriend
extension LoadedUser {

    @objc(addLoadedFriendObject:)
    @NSManaged public func addToLoadedFriend(_ value: LoadedFriend)

    @objc(removeLoadedFriendObject:)
    @NSManaged public func removeFromLoadedFriend(_ value: LoadedFriend)

    @objc(addLoadedFriend:)
    @NSManaged public func addToLoadedFriend(_ values: NSSet)

    @objc(removeLoadedFriend:)
    @NSManaged public func removeFromLoadedFriend(_ values: NSSet)

}

extension LoadedUser : Identifiable {

}
