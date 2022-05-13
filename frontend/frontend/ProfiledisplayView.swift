//
//  ProfiledisplayView.swift
//  frontend
//
//  Created by Elizabeth Voroshylo on 3/21/22.
//

import SwiftUI

struct ProfiledisplayView: View {
    @State private var showSettings = false
    @State private var showFriends = false
    @State var likeButtonBool: Bool = false
    @State var showComments: Bool = false
    
    var profile: Profile
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center) {
                Image("destiny-profile-pic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60.0, height: 60.0)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .shadow(radius: 7)
                Text(profile.user.username)
                    .bold()
                    .font(.title)
                Spacer()
                Button (action: {
                    showSettings.toggle()
                }, label: {
                    Image(systemName: "gear.circle")
                            .resizable()
                            .frame(width: 25.0, height: 25.0)
                })
                .padding()
                .sheet(isPresented: $showSettings) {
                     SettingsView()
                }
            }
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
                    ScrollView{
                        Spacer()
                        Text("Friends List")
                        Spacer()
                        VStack{
                            ForEach(profile.user.friends, id: \.self) { friend in
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
        }
        
        ScrollView {
            VStack(spacing: 10) {
                ForEach(profile.posts, id: \.self) { post in
                    PostView(user: profile.user, post: post)
                }
            }
            .frame(width: nil)
        }
        .padding(.vertical)
    }
}

struct ProfiledisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ProfiledisplayView(profile: Profile.default)
    }
}


