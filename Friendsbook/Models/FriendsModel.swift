//
//  FriendsModel.swift
//  Friendsbook
//
//  Created by Guntars Reiss on 23/08/2022.
//

import Foundation

struct User: Codable, Hashable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friend]
}

struct Friend: Codable, Hashable {
    var id: String
    var name: String
}
