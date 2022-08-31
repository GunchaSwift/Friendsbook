//
//  ContentView.swift
//  Friendsbook
//
//  Created by Guntars Reiss on 23/08/2022.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var model = FriendsDataModel()
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var users: FetchedResults<LoadedUser>
    
    var body: some View {
        NavigationView {
            List {
                ListRowsView(users: users)
            }
            .navigationTitle("Friendsbook")
            .background(.teal)
            .task {
                await model.getData()
                await saveDataToCoreData()
            }
        }
        .accentColor(Color.orange)
    }
    
    // Store data in Core Data
    func saveDataToCoreData() async {
        if self.users.isEmpty {
            await MainActor.run {
                for currentUser in model.users {
                    let user = LoadedUser(context: moc)
                    
                    user.id = currentUser.id
                    user.isActive = currentUser.isActive
                    user.name = currentUser.name
                    user.age = Int16(currentUser.age)
                    user.company = currentUser.company
                    user.email = currentUser.email
                    user.address = currentUser.address
                    user.about = currentUser.about
                    user.registered = currentUser.registered
                    user.tags = currentUser.tags.joined(separator: ",")
                    
                    // TODO: Save Friends array
                    var tempFriendArray = Array<LoadedFriend>()
                    
                    for friend in currentUser.friends {
                        let loadedFriend = LoadedFriend(context: moc)
                        loadedFriend.name = friend.name
                        loadedFriend.id = friend.id
                        
                        tempFriendArray.append(loadedFriend)
                    }
                    
                    user.loadedFriend = NSSet(array: tempFriendArray)
                }
                
                if moc.hasChanges {
                    try? self.moc.save()
                }
            }
        } else {
            print("Data is already loaded")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
HomeView()
    }
}
