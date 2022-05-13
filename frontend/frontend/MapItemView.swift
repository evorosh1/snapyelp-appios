//
//  MapItemView.swift
//  frontend
//
//  Created by Destiny Walcott on 5/1/22.
//

import SwiftUI

/// This creates the view of the post items for the map
/// - Parameters:
///     - user: a collection of profile data for a  user
///     - post: a collection of data for a single post belonging to the user
struct MapItemView: View {
    @Environment(\.presentationMode) var presentationMode
    var user: String
    var post: Post
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("\(post.location)")
                        .font(.headline)
                    Text("Posted by \(user)")
                        .font(.subheadline)
                }
                
                Spacer()
            }
            .padding(.horizontal)
            
            Text(post.review_text)
                .padding()
            
            post.photosTabView
        }
        .padding(.vertical, 20)
        .overlay {
            Rectangle().stroke(.gray)
        }
    }
}


struct MapItemView_Previews: PreviewProvider {
    static var previews: some View {
        MapItemView(user: users[0].username, post: users[0].posts[0])
    }
}
