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
                    }).padding(.trailing)
                    .sheet(isPresented: $showSettings) {
                         SettingsView()
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
                            VStack (alignment: .leading, spacing: 10) {
                                ScrollView{
                                Spacer()
                                Text("Friends List")
                                Spacer()
                                HStack{
                                    Image(profile.user.friends[0].profile_pic)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30.0, height: 30.0)
                                    .clipShape(Circle())
                                    .overlay {
                                        Circle().stroke(.white, lineWidth: 1)
                                    }
                                    .shadow(radius: 7)
                                    Text(profile.user.friends[0].username)
                                }
                                }
                            }
                        }
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
//
            //Text ("Friends") //button to see friends list
          //  Text("Profile Status: \(profile.publicprofile ? "Public": "Private" )")
            
        }
        ScrollView {
            HStack(alignment: .center) {
                profile.user.image
                
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text(profile.user.username)
                            .font(.headline)
                        Spacer()
                        Image(systemName: profile.post.post_type == "public" ? "globe" : "lock.fill")
                            .foregroundColor(.gray)
                    }
                    
                    if profile.post.location != "" {
                        Text(profile.post.location)
                            .font(.subheadline)
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, 2.0)
                
                Spacer()
            }
            
            Divider()
            
            Text(profile.post.review_text)
                .font(.body)
            
            if profile.post.photos.count > 0 {
                profile.post.photosTabView
                    .frame(width: nil, height: 450)
            }
           

            Divider()
            /*
            HStack(alignment: .center) {
                Button(action: {
                    likeButtonBool.toggle()
                }, label: {
                    HStack(alignment: .center, spacing: 5.0) {
                        Image(systemName: likeButtonBool || profile.post.liked ? "hand.thumbsup.fill" : "hand.thumbsup")
                            .resizable()
                            .frame(width: 25, height: 25)
                        Text("\(likeButtonBool ? profile.post.total_likes + 1 : profile.post.total_likes)")
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
                        Text("\(profile.post.total_comments)")
                    }
                })
                .sheet(isPresented: $showComments) {
                    CommentsView(total_comments: profile.post.total_comments)
                }
            
                    
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
        */
        }
    }

}

struct ProfiledisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ProfiledisplayView(profile: Profile.default)
    }
}


