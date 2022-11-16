//
//  ProfileView.swift
//  frontend
//
//  Created by Elizabeth Voroshylo on 3/21/22.
//

import SwiftUI

struct ProfileView: View {
    @State var user : User
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfiledisplayView(user: user)
        }
        .padding()
        .task{
            print("user ")
            print(user.username)
        }
    }
}


/*struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
*/

