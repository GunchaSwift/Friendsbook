//
//  FriendsDataModel.swift
//  Friendsbook
//
//  Created by Guntars Reiss on 23/08/2022.
//

import CoreData
import Foundation

class FriendsDataModel: ObservableObject {
    
    @Published var users = [User]()
    
    // Fetch JSON Data
    func getData() async -> [User] {
        // Create URL and check it
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return [User]()
        }
        
        // Parse the data
        do {
            // Get data from url using URLSession
            let (data, _) = try await URLSession.shared.data(from: url)
            // Create JSONDecoder and add date decoding strategy
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            // Decode data and populate the property
            let decodedData = try decoder.decode([User].self, from: data)
            DispatchQueue.main.async {
                self.users = decodedData
            }
        } catch {
            print("Error creating URLSession from URL")
            return [User]()
        }        
        return [User]()
    }
}
