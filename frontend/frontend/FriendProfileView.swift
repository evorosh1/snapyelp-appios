//
//  FriendProfileView.swift
//  frontend
//
//  Created by Elizabeth Voroshylo on 3/29/22.
//

import SwiftUI

struct FriendProfileView: View {
    @State var backhome = false
    @State private var showFriends = false
    var user: User
    var posts: [Post]
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image(user.profile_pic)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60.0, height: 60.0)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .shadow(radius: 7)
                Text(user.username)
                    .bold()
                    .font(.title)
                
                Spacer()
                
                Button (action: {
                    showFriends.toggle()
                }, label: {
                    Image(systemName: "person.2.fill")
                        .resizable()
                        .frame(width: 32.0, height: 25.0)
                })
                .padding(.trailing)
                .sheet(isPresented: $showFriends) {
                    VStack (alignment: .leading, spacing: 10) {
                        ScrollView {
                            Spacer()
                            Text("Friends List")
                            Spacer()
                            VStack {
                                ForEach(user.friends, id: \.self) { friend in
                                    HStack {
                                        Image(friend.profile_pic)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 30.0, height: 30.0)
                                            .clipShape(Circle())
                                            .overlay {
                                                Circle().stroke(.white, lineWidth: 1)
                                            }
                                            .shadow(radius: 7)
                                        Text(friend.username)
                                    }
                                }
                            }
                        }
                    }
                }
                
                if user.username != "Destiny" {
                    Button(action: {
                    }, label: {
                        Text("Add Friend")
                            .padding(.vertical)
                            .padding(.horizontal)
                            .font(.headline)
                            .foregroundColor(.white)
                            .background(.blue)
                            .clipShape(Capsule())
                    })
                }
                
            }
            
            Divider()
                
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(posts, id: \.self) { post in
                        if post.post_type == "public" {
                            PostView(user: user, post: post)
                        }
                    }
                }
                .frame(width: nil)
            }
            .padding(.vertical)
            
            
        }
        
        
    }
    
}
            
            
//        }
//        .padding(.horizontal)
        
//            Divider()
                
//            ScrollView {
//                HStack(alignment: .center) {
//                    user.image
//
//                    VStack(alignment: .leading, spacing: 2) {
//                        HStack {
//                            Text(user.username)
//                                .font(.headline)
//                            Spacer()
//                            Image(systemName: user.posts[0].post_type == "public" ? "globe" : "lock.fill")
//                                .foregroundColor(.gray)
//                        }
//
//                        if user.posts[0].location != "" {
//                            Text(user.posts[0].location)
//                                .font(.subheadline)
//                        }
//                    }
//                    .frame(width: nil)
//                    .padding(.vertical)
//
//                    Spacer()
//                }
//
//                Divider()
//
//                Text(user.posts[0].review_text)
//                    .font(.body)
//
//                if user.posts[0].photos.count > 0 {
//                    user.posts[0].photosTabView
//                        .frame(width: nil, height: 450)
//                }
//
//                Divider()
//
////                .padding(.vertical)
//        }
//        .padding(.vertical)


struct FriendProfileView_Previews: PreviewProvider {
    static var previews: some View {
        FriendProfileView(user: users[0], posts: users[0].posts)
    }
}
