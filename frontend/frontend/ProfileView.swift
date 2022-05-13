//
//  ProfileView.swift
//  frontend
//
//  Created by Elizabeth Voroshylo on 3/21/22.
//

import SwiftUI

struct ProfileView: View {
    @State private var draftProfile = Profile.default
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfiledisplayView(profile: draftProfile)
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
