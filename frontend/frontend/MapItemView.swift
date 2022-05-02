//
//  MapItemView.swift
//  frontend
//
//  Created by Destiny Walcott on 5/1/22.
//

import SwiftUI

struct MapItemView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Binghamton, NY")
                        .font(.headline)
                    Text("Posted by Destiny")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                })
            }
            .padding(.horizontal)
            
            Text(posts[0].reviewText)
                .padding()
            
            TabView {
                Image("restaurant-atlantic-city-nj")
                    .resizable()
                    .aspectRatio(0.75, contentMode: .fill)
                    .overlay(.black.opacity(0.4))
                    .tag(0)
                Image("nachos")
                    .resizable()
                    .aspectRatio(0.75, contentMode: .fill)
                    .overlay(.black.opacity(0.4))
                    .tag(1)
                Image("steak-tacos")
                    .resizable()
                    .aspectRatio(0.75, contentMode: .fill)
                    .overlay(.black.opacity(0.4))
                    .tag(2)
                Image("chicken-platter")
                    .resizable()
                    .aspectRatio(0.75, contentMode: .fill)
                    .overlay(.black.opacity(0.4))
                    .tag(3)
            }
            .tabViewStyle(PageTabViewStyle())
            
        }
    }
}

struct MapItemView_Previews: PreviewProvider {
    static var previews: some View {
        MapItemView()
    }
}
