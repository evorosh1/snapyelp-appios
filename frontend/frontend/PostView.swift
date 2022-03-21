//
//  PostView.swift
//  frontend
//
//  Created by Destiny Walcott on 3/6/22.
//

import SwiftUI

struct PostView: View {
    
    
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
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
