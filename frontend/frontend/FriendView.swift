//
//  FriendView.swift
//  frontend
//
//  Created by Elizabeth Voroshylo on 3/29/22.
//

import SwiftUI

struct FriendView: View {
    @State private var draftFriend = Friend.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
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
