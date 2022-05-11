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
    var user: User
    var post: Post
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("\(post.location)")
                        .font(.headline)
                    Text("Posted by \(user.username)")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                })
            }
            .padding(.horizontal)
            
            Text(post.review_text)
                .padding()
            
            post.photosTabView
        }
    }
}


struct MapItemView_Previews: PreviewProvider {
    static var previews: some View {
        MapItemView(user: users[0], post: users[0].posts[0])
    }
}
