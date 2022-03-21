//
//  MainView.swift
//  frontend
//
//  Created by Destiny Walcott on 3/21/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Newsfeed()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            Text("Map")
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
        }
        .font(.headline)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
