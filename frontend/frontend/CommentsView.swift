//
//  Comments.swift
//  frontend
//
//  Created by Destiny Walcott on 5/4/22.
//

import SwiftUI

struct CommentsView: View {
    var total_comments: Int = 0
    var profilePicsArray: [String] = ["destiny-profile-pic", "liz-profile-pic", "profile-pic-1", "profile-pic-2", "profile-pic-3", "profile-pic-4", "profile-pic-5", "profile-pic-6", "profile-pic-7"]
    @State var comment: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach((0...total_comments-1), id: \.self) { i in
                    Divider()
                    HStack(alignment: .center, spacing: 10) {
                        let j = i % profilePicsArray.count
                        Image(profilePicsArray[j])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40.0, height: 40.0, alignment: .center)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.white, lineWidth: 2)
                            }
                            .shadow(radius: 7)
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit")
                            .font(.system(size: 14))
                    }
                    Divider()
                }
            }
            .frame(width: nil, height: 400)
            .padding(.bottom, 10)
            
            HStack {
                TextField("Write a comment...", text: $comment)
                    .padding(10)
                    .background(lightGrayColor)
                    .border(.gray, width: 1.0)
                
                Button(action: {}, label: {
                    Text("Add")
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(Capsule())
                })
            }
        }
        .padding(.horizontal)
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(total_comments: users[0].posts[0].total_comments)
    }
}
