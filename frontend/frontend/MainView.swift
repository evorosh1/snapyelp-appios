//
//  MainView.swift
//  frontend
//
//  Created by Destiny Walcott on 3/21/22.
//

import SwiftUI

/// This controls the layout of the app after the login page
struct MainView: View {
    var body: some View {
        TabView {
            Newsfeed()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            MapView()
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
