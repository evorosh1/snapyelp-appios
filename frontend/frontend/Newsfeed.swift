//
//  ContentView.swift
//  frontend
//
//  Created by Destiny Walcott on 3/5/22.
//

import SwiftUI

/// This creates the view for the newsfeed page
struct Newsfeed: View {
    @State var showNewPostForm = false
    @State var showSearchField = false
    
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                HStack {
                    Text("AppName")
                        .font(.headline)
                    
                    Spacer()
                    
                    Button(action: {
                        showSearchField.toggle()
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 25, height: 25)
                    })
                    .padding(.trailing)
                    .sheet(isPresented: $showSearchField) {
                        SearchBarView()
                    }
                    
                    Button(action: {
                        showNewPostForm.toggle()
                    }, label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                    })
                    .fullScreenCover(isPresented: $showNewPostForm, content: CreatePostForm.init)
                }
            }
            .padding(.horizontal)
            
            Divider()
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(users, id: \.self) { user in
                        ForEach(user.posts, id: \.self) { post in
                            if post.post_type == "public" {
                                PostView(user: user, post: post)
                            }
                        }
                    }
                }
                .frame(width: nil)
            }
            .padding(.vertical)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Newsfeed()
    }
}
