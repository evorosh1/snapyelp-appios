//
//  PostView.swift
//  frontend
//
//  Created by Destiny Walcott on 3/6/22.
//

import SwiftUI

struct PostView: View {
    @State var likeButtonBool: Bool = false
    @State var showComments: Bool = false
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image("profilepic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60.0, height: 60.0)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .shadow(radius: 7)
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text("Destiny")
                            .font(.headline)
                        Spacer()
                        Image(systemName: posts[0].postType == ._public ? "globe" : "lock.fill")
                            .foregroundColor(.gray)
                    }
                    
                    if posts[0].locationOnBool {
                        Text("Bingamton, NY")
                            .font(.subheadline)
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                
                Spacer()
            }
            
            Divider()
            
            Text(posts[0].reviewText)
            
            if posts[0].imageData != "" {
                Image(posts[0].imageData)
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

/*struct PostView: View {
    
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image("profilepic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60.0, height: 60.0)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .shadow(radius: 7)
                VStack(alignment: .leading) {
                    Text("Destiny")
                    HStack {
                        Text("Bingamton, NY")
                        Text("o Public")
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                
                Spacer()
            }
            
            Divider()
            
            Text("The atmosphere was nice and the food is delicious. 10 out of 10, highly recommend‼️")
            
            Image("tacos")
                .resizable()
                .scaledToFit()
//                .overlay {
//                    RoundedRectangle(cornerRadius: 10).stroke(.white)
//                }
//                .cornerRadius(10)
            
            Divider()
            
            HStack {
                Text("|Like Button|")
                Spacer()
                Text("|Comment Button|")
            }
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .overlay {
            Rectangle().stroke(.gray)
        }
    }
}*/

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
