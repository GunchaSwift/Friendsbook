//
//  FriendsbookApp.swift
//  Friendsbook
//
//  Created by Guntars Reiss on 23/08/2022.
//

import SwiftUI

@main
struct FriendsbookApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
