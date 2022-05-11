//
//  Signup.swift
//  frontend
//
//  Created by Destiny Walcott on 3/29/22.
//

import SwiftUI

/// This creates the first view of the sign up page, which is the view for registering a new account
struct SignupView: View {
    @State var first_name: String = ""
    @State var last_name: String = ""
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var confirm_password: String = ""
    
    @State var showCreateProfileView = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
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
            .padding(.trailing)
            
            Spacer()
            
            VStack(alignment: .center) {
                Text("Register")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom, 30)
                
                VStack {
                    TextField("First Name", text: $first_name)
                        .padding()
                        .background(lightGrayColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    
                    TextField("Last Name", text: $last_name)
                        .padding()
                        .background(lightGrayColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(lightGrayColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .background(lightGrayColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(lightGrayColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                        .textInputAutocapitalization(.never)

                    SecureField("Confirm Password", text: $confirm_password)
                        .padding()
                        .background(lightGrayColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                        .textInputAutocapitalization(.never)
                }
                .padding(.horizontal, 5)
                
                Button(action: {
//                    postSignupData()
                    showCreateProfileView.toggle()
                }, label: {
                    Text("Sign Up")
                        .padding(.vertical, 20)
                        .padding(.horizontal, 100)
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(Capsule())
                })
                .padding(.top, 20)
                .fullScreenCover(isPresented: $showCreateProfileView, content: CreateProfileForm.init)
            }
            .padding(.bottom, 50)
            
        }
        .padding()
    }
    
    func postSignupData() {
        guard let url = URL(string: "http://0.0.0.0:8000/register/") else {
            print("api is down")
            return
        }
        
        let parameters: [String: Any] = ["first_name": self.first_name, "last_name": self.last_name, "username": self.username, "email": self.email, "password": self.password, "confirm_password": self.confirm_password]
        
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
            
            if let data = data {
                if let response = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    DispatchQueue.main.async {
                        print(response)
                        token = response["token"] as! String
                        self.showCreateProfileView.toggle()
                    }
                    return
                }
            }
        }.resume()
    }
    
    
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
