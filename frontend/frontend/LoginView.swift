//
//  Login.swift
//  frontend
//
//  Created by Destiny Walcott on 3/29/22.
//

import SwiftUI

let lightGrayColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

struct LoginView: View {
    @State var showImagePicker = false
    @State var image: UIImage? = nil
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var showSignupView = false
//    @State var showMainView = false
    @State var showTempView = false
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 30)
            
            VStack(alignment: .center) {
                TextField("Username", text: $username)
                    .padding()
                    .background(lightGrayColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(lightGrayColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .textInputAutocapitalization(.never)
                
                Button(action: {
                    postLoginCredentials()
                }, label: {
                    Text("LOGIN")
                        .padding(.vertical, 20)
                        .padding(.horizontal, 100)
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(Capsule())
                })
                .padding(.top, 20)
                .padding(.bottom, 10)
                .disabled(self.username.isEmpty || self.password.isEmpty)
                .fullScreenCover(isPresented: $showTempView, content: Temp.init)

                
                Button(action: {
                    showSignupView.toggle()
                }, label: {
                    Text("Don't have an acount, signup here")
                })
                .fullScreenCover(isPresented: $showSignupView, content: SignupView.init)
            }
            .padding(.horizontal, 2)
            
        }
        .padding()
        
    }
    
    func postLoginCredentials() {
        guard let url = URL(string: "http://0.0.0.0:8000/login/") else {
            print("api is down")
            return
        }
        
        let loginData = Login(username: self.username, password: self.password)
                
        guard let encoded = try? JSONEncoder().encode(loginData) else {
            print("failed to encode")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = encoded
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print("error: \(String(describing: error))")
            }
            
            if let data = data {
                if let response = try? JSONDecoder().decode(Login.self, from: data) {
                    DispatchQueue.main.async {
                        print(response)
                        self.showTempView.toggle()
                    }
                    return
                }
            }
        }.resume()
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
