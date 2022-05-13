//
//  SearchBarView.swift
//  frontend
//
//  Created by Destiny Walcott on 5/4/22.
//

import SwiftUI

/// This creates the view for the search bar functionaility
struct SearchBarView: View {
    @State var search_text = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.self) { user in
                    NavigationLink(destination: FriendProfileView(user: user, posts: user.posts)) {
                        HStack(alignment: .center, spacing: 10) {
                            Image(user.profile_pic)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30.0, height: 30.0)
                                .clipShape(Circle())
                                .overlay {
                                    Circle().stroke(.white, lineWidth: 1)
                                }
                                .shadow(radius: 7)
                            Text(user.username)
                        }
                    }
                }
            }
            .searchable(text: $search_text)
            .navigationTitle("Find Friends")
        }
    }
    
    /// This helper method filters the data for a user or all users that match the search query
    var searchResults: [User] {
        if search_text.isEmpty {
            return []
        } else {
            return users.filter { $0.username.contains(search_text) }
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
