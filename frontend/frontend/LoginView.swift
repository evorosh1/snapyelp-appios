//
//  Login.swift
//  frontend
//
//  Created by Destiny Walcott on 3/29/22.
//

import SwiftUI

let lightGrayColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

/// This creates the view for the login page
struct LoginView: View {
    
    @State var showImagePicker = false
    @State var image: UIImage? = nil
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var showSignupView = false
    @State var showMainView = false
    
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
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(lightGrayColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                    .textInputAutocapitalization(.never)
                
               Button(action: {
                    //postLoginData()
                    showMainView.toggle()
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
                .fullScreenCover(isPresented: $showMainView, content: MainView.init)

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
    
    func postLoginData() {
        guard let url = URL(string: "http://0.0.0.0:8000/login/") else {
            print("api is down")
            return
        }
        
        let parameters: [String: Any] = ["username": self.username, "password": self.password]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
              print("error with post request: \(error.localizedDescription)")
              return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("unexpected status code: \(String(describing: response))")
              return
            }
            
            print(httpResponse)
            
            if let data = data {
                if let response = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    DispatchQueue.main.async {
                        print(response)
                        token = response["token"] as! String
                        self.showMainView.toggle()
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
