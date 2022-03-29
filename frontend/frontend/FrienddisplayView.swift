//
//  FriendView.swift
//  frontend
//
//  Created by Elizabeth Voroshylo on 3/29/22.
//

import SwiftUI

struct FrienddisplayView: View {
    @State var likeButtonBool: Bool = false
    @State var showComments: Bool = false
    @State var showFriend = false
    var friend: Friend
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button(action: {
                    showFriend.toggle()
                }, label: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                })
                    .sheet(isPresented: $showFriend){
                        FriendProfileView(friend: Friend.default)
                    }
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text(friend.username)
                            .font(.headline)
                        Spacer()
                        Image(systemName: posts[1].postType == ._public ? "globe" : "lock.fill")
                            .foregroundColor(.gray)
                    }
                    
                    if posts[1].locationOnBool {
                        Text("Humane Society, Bingamton, NY")
                            .font(.subheadline)
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                
                Spacer()
            }
            
            Divider()
            
            Text(posts[1].reviewText)
            
            if posts[1].imageData != "" {
                Image(posts[1].imageData)
                    .resizable()
                    .scaledToFit()
            }
           
            
            Divider()
            
            HStack {
                Button(action: {
                    likeButtonBool.toggle()
                }, label: {
                    Image(systemName: likeButtonBool ? "hand.thumbsup.fill" : "hand.thumbsup")
                        .resizable()
                        .frame(width: 25, height: 25)
                })
                .padding(.trailing)
                
                Button(action: {
                    showComments.toggle()
                }, label: {
                    Image(systemName: "text.bubble")
                        .resizable()
                        .frame(width: 25, height: 25)
                })
                .sheet(isPresented: $showComments) {
                    Text("Comments")
                        .font(.headline)
                }
                .padding(.leading)
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "xmark.bin.fill")
                        .resizable()
                        .frame(width: 25, height: 24)
                        .foregroundColor(.red)
                })
            }
        }
        .padding()
        .overlay {
            Rectangle().stroke(.gray)
        }
    }
}

struct FrienddisplayView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView()
    }
}
