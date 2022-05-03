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
                Text(profile.username)
                    .bold()
                    .font(.title)
                Spacer()
                Button (action: {
                        showSettings.toggle()
                    }, label: {
                        Image(systemName: "gear.circle")
                                .resizable()
                                .frame(width: 25.0, height: 25.0)
                    }) .padding(.trailing)
                            .sheet(isPresented: $showSettings) {
                                Text("Settings")
                                    .font(.headline)
                                }
                //Text("settings") // settings button for changing privacy settings
            }
            Button (action: {
                    showFriends.toggle()
                }, label: {
                    Image(systemName: "person.2.fill")
                            .resizable()
                            .frame(width: 32.0, height: 25.0)
                }) .padding(.trailing)
                        .sheet(isPresented: $showFriends) {
                            VStack (alignment: .leading, spacing: 15) {
                            Text("Friends List")
                                .bold()
                                .font(.title)
                            .padding(.trailing)
//                            ScrollView{
//                                HStack {
//                                    Image(friends[0].profilepic)
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 35, height: 35)
//                                        .clipShape(Circle())
//                                        .overlay {
//                                            Circle().stroke(.white, lineWidth: 4)
//                                        }
//                                    Text(friends[0].name)
//                                        .font(.headline)
//                                    }
//                                }
                            }
                        }
            //Text ("Friends") //button to see friends list
            Text("Profile Status: \(profile.publicprofile ? "Public": "Private" )")
            
        }
        ScrollView {
                    
//                PostView()

//             HStack{
//                Button {
//                    showingHome.toggle()
//                } label: {
//                    Label("Home", systemImage: "person.crop.circle")
//                        .scaledToFill()
//                        .frame(width: 45.0, height: 45.0)
//                        .clipShape(Circle())
//                        .overlay {
//                            Circle().stroke(.white, lineWidth: 2)
//                        }
//                        .shadow(radius: 7)
//                }
//            }
//             .sheet(isPresented: $showingHome) {
//                            Newsfeed()
//                        }
                }
        
    }
}
struct ProfiledisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ProfiledisplayView(profile: Profile.default)
    }
}
