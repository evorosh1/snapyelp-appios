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
    //var friend: Friend
    var user: User
    /*
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
      /*      HStack(alignment: .center) {
                Button(action: {
                    backhome.toggle()
                }, label: {
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                })
                .sheet(isPresented: $backhome){
                            Newsfeed()
                    }

            }*/
            HStack(alignment: .center) {
                Image("profilefriend")
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
            }
            Text ("Friend Status") //function will be implmented later
            Text("Profile Status: Public")
            
                .padding()
            
        }
        ScrollView {
                    
                //FriendView()
                //.padding(.horizontal)
        }
        .padding(.vertical)
    }
    */
    var body: some View {
        VStack{
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
                //Text("settings") // settings button for changing privacy settings
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
                                Image(user.friends[0].profile_pic)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30.0, height: 30.0)
                                    .clipShape(Circle())
                                    .overlay {
                                        Circle().stroke(.white, lineWidth: 1)
                                    }
                                    .shadow(radius: 7)
                                Text(user.friends[0].username)
                                }
                            }
                        }
                        }
            
            //Text ("Friends") //button to see friends list
          //  Text("Profile Status: \(profile.publicprofile ? "Public": "Private" )")
            
        }
        }
        .padding(.horizontal)
        
        Divider()
        ScrollView {
            HStack(alignment: .center) {
                user.image
                
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text(user.username)
                            .font(.headline)
                        Spacer()
                        Image(systemName: user.posts[0].post_type == "public" ? "globe" : "lock.fill")
                            .foregroundColor(.gray)
                    }
                    
                    if user.posts[0].location != "" {
                        Text(user.posts[0].location)
                            .font(.subheadline)
                    }
                }
                .frame(width: nil)
                .padding(.vertical)
                
                Spacer()
            }
            
            Divider()
            
            Text(user.posts[0].review_text)
                .font(.body)
            
            if user.posts[0].photos.count > 0 {
                user.posts[0].photosTabView
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
                .padding(.vertical)
        }    .padding(.vertical)
    }

}


struct FriendProfileView_Previews: PreviewProvider {
    static var previews: some View {
        FriendProfileView(user: users[0])
    }
}
