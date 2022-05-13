//
//  Settings.swift
//  frontend
//
//  Created by Elizabeth Voroshylo on 5/13/22.
//

import SwiftUI

struct SettingsView: View {
    @State var showLogin = false
    var body: some View {
        VStack {
            ScrollView {
                Text("Settings")
                    .padding()
                Spacer()
                Button(action: {
                    showLogin.toggle()
                }, label: {
                    Text("Logout")
                        .padding(.vertical, 20)
                        .padding(.horizontal, 100)
                        .font(.body)
                        .foregroundColor(.white)
                        .background(.blue)
                })
                .padding()
                .fullScreenCover(isPresented: $showLogin, content: LoginView.init)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

