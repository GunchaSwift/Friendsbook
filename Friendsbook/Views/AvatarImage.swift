//
//  AvatarImage.swift
//  Friendsbook
//
//  Created by Guntars Reiss on 31/08/2022.
//

import SwiftUI

struct AvatarImage: View {
    
    var user: LoadedUser
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image("avatar")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            Image(systemName: "circle.fill")
                .font(.system(size: 12))
                .foregroundColor(user.isActive ? .green : .red)
        }
    }
}

