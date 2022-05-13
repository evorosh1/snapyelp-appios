//
//  FriendView.swift
//  frontend
//
//  Created by Elizabeth Voroshylo on 3/29/22.
//

import SwiftUI

struct FriendView: View {
    @State private var draftFriend = Friend.default
   // var user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            //if user.username == "Andrew" {
            //FrienddisplayView(profile: Friend(user: users[2], post: users[2].posts[0]))
           // }
            FrienddisplayView(friend: draftFriend)
        }
        .padding()
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView()
    }
}
