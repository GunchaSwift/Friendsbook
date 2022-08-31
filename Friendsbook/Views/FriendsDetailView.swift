//
//  FriendsDetailView.swift
//  Friendsbook
//
//  Created by Guntars Reiss on 31/08/2022.
//

import SwiftUI

struct FriendsDetailView: View {
    
    var friend: LoadedFriend
    
    var body: some View {
        VStack {
            Text("Name: \(friend.wrappedName)")
            Text("Id: \(friend.wrappedId)")
        }
    }
}

