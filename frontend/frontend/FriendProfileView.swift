//
//  FriendProfileView.swift
//  frontend
//
//  Created by Elizabeth Voroshylo on 3/29/22.
//

import SwiftUI

struct FriendProfileView: View {
    @State var backhome = false
    
    var friend: Friend
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
                Text(friend.username)
                    .bold()
                    .font(.title)
            }
            Text ("Friend Status") //function will be implmented later
            Text("Profile Status: \(friend.publicprofile ? "Public": "Private" )")
            
                .padding()
            
        }
        ScrollView {
                    
                FriendView()
                .padding(.horizontal)
        }
        .padding(.vertical)
    }
}

struct FriendProfileView_Previews: PreviewProvider {
    static var previews: some View {
        FriendProfileView(friend: Friend.default)
    }
}
