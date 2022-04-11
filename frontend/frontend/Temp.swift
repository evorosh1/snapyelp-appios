//
//  Temp.swift
//  frontend
//
//  Created by Destiny Walcott on 4/9/22.
//

import SwiftUI

struct Temp: View {
    @State var showLoginView = false
    
    var body: some View {
        VStack {
            Text("Login Successful!")
            
//            Button(action: {
//                LogoutUser()
//            }, label: {
//                Text("Logout")
//                    .padding(.vertical, 20)
//                    .padding(.horizontal, 100)
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .background(.blue)
//                    .clipShape(Capsule())
//            })
//            .padding(.top, 50)
//            .fullScreenCover(isPresented: $showLoginView, content: LoginView.init)
        }
    }
    
//    func LogoutUser() {
//        guard let url = URL(string: "http://0.0.0.0:8000/logout/") else {
//            print("api is down")
//            return
//        }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        URLSession.shared.dataTask(with: request) { _, _, error in
//            if error != nil {
//                print("error: \(String(describing: error))")
//            }
//            DispatchQueue.main.async {
//                self.showLoginView = true
//            }
//            return
//        }.resume()
//    }
}

struct Temp_Previews: PreviewProvider {
    static var previews: some View {
        Temp()
    }
}
