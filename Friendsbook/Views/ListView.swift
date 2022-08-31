//
//  ListView.swift
//  Friendsbook
//
//  Created by Guntars Reiss on 31/08/2022.
//

import SwiftUI

struct ListRowsView: View {
    
    var users: FetchedResults<LoadedUser>
    
    var body: some View {
        ForEach(users, id: \.self) { user in
            NavigationLink {
                UserDetailView(user: user)
            } label: {
                HStack(spacing: 15) {
                    AvatarImage(user: user)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(user.wrappedName)
                            .bold()

                        Text(user.wrappedCompany)
                            .font(.system(size: 12))
                        
                    }
                    .frame(height: 90)
                }
            }
        }
        .listRowBackground(Color.gray.opacity(0.2))
    }
}

