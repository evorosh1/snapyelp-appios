//
//  ContentView.swift
//  frontend
//
//  Created by Destiny Walcott on 3/5/22.
//

import SwiftUI

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
                        Text("Search")
                            .font(.headline)
                    }
                    
                    Button(action: {
                        showNewPostForm.toggle()
                    }, label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                    })
                    .fullScreenCover(isPresented: $showNewPostForm, content: NewPostForm.init)
                }
            }
            .padding(.horizontal)
            
            Divider()
            
            ScrollView {
                VStack(spacing: 10) {
                    PostView()
                    FriendView()
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
    }
}


/*struct Newsfeed: View {
    @State private var showingProfile = false
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                HStack {
                    Text("AppName")
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text("Add Post")
                }
                Divider()
            }
            .padding(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/)
            PostView()
            
            VStack {
                Divider()
                
                HStack {
                    Text("| Map Icon |")
                    Spacer()
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("Profile", systemImage: "person.crop.circle")
                            .scaledToFill()
                            .frame(width: 45.0, height: 45.0)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.white, lineWidth: 2)
                            }
                            .shadow(radius: 7)
                    }
                }
            }
            .sheet(isPresented: $showingProfile) {
                           ProfileView()
                       }


            .padding(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/)
        }
        .padding()
    }
}*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Newsfeed()
    }
}
