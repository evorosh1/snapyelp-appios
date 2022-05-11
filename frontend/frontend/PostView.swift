//
//  PostView.swift
//  frontend
//
//  Created by Destiny Walcott on 3/6/22.
//

import SwiftUI

/// This creates the view of the posts for the newsfeed and profile pages
/// - Parameters:
///     - user: a collection of profile data for a  user
///     - post: a collection of data for a single post belonging to the user
struct PostView: View {
    @State var likeButtonBool: Bool = false
    @State var showComments: Bool = false
    @State var showNewPostForm =  false
    var user: User
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                user.image
                
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text(user.username)
                            .font(.headline)
                        Spacer()
                        Image(systemName: post.post_type == "public" ? "globe" : "lock.fill")
                            .foregroundColor(.gray)
                    }
                    
                    if post.location != "" {
                        Text(post.location)
                            .font(.subheadline)
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, 2.0)
                
                Spacer()
            }
            
            Divider()
            
            Text(post.review_text)
                .font(.body)
            
            if post.photos.count > 0 {
                post.photosTabView
                    .frame(width: nil, height: 450)
            }

            Divider()
            
            HStack(alignment: .center) {
                Button(action: {
                    likeButtonBool.toggle()
                }, label: {
                    HStack(alignment: .center, spacing: 5.0) {
                        Image(systemName: likeButtonBool || post.liked ? "hand.thumbsup.fill" : "hand.thumbsup")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text("\(likeButtonBool ? post.total_likes + 1 : post.total_likes)")
                    }
                })
                .padding(.trailing)
                
                Button(action: {
                    showComments.toggle()
                }, label: {
                    HStack(alignment: .center, spacing: 10.0) {
                        Image(systemName: "text.bubble")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text("\(post.total_comments)")
                    }
                })
                .sheet(isPresented: $showComments) {
                    CommentsView(total_comments: post.total_comments)
                }
                
                Spacer()
                
                if user.username == "Destiny" {
                    Button(action: {}, label: {
                        Image(systemName: "xmark.bin.fill")
                            .resizable()
                            .frame(width: 25, height: 24)
                            .foregroundColor(.red)
                    })
                    
                    Button(action: {
                        showNewPostForm.toggle()
                    }, label: {
                        Image(systemName: "pencil.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.gray)
                    })
                    .padding(.leading)
                    .fullScreenCover(isPresented: $showNewPostForm, content: CreatePostForm.init)
                }
            }
        }
        .padding()
        .overlay {
            Rectangle().stroke(.gray)
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(user: users[0], post: users[0].posts[0])
    }
}
