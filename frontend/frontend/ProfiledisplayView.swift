//
//  ProfiledisplayView.swift
//  frontend
//
//  Created by Elizabeth Voroshylo on 3/21/22.
//

import SwiftUI

struct ProfiledisplayView: View {
    @State private var showingHome = false
    var profile: Profile
    
    var body: some View {
        ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(profile.username)
                            .bold()
                            .font(.title)

                        Text("Profile Status: \(profile.publicprofile ? "Public": "Private" )")
                        
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
             HStack{
                Button {
                    showingHome.toggle()
                } label: {
                    Label("Home", systemImage: "person.crop.circle")
                        .scaledToFill()
                        .frame(width: 45.0, height: 45.0)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 2)
                        }
                        .shadow(radius: 7)
                }
            }
             .sheet(isPresented: $showingHome) {
                            ContentView()
                        }
                }
        
    }
}
struct ProfiledisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ProfiledisplayView(profile: Profile.default)
    }
}
