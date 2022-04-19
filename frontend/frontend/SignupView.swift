//
//  Signup.swift
//  frontend
//
//  Created by Destiny Walcott on 3/29/22.
//

import SwiftUI

struct SignupView: View {
    @State var first_name: String = ""
    @State var last_name: String = ""
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var confirm_password: String = ""
    
    @State var showImagePicker = false
    @State var image: UIImage? = nil
    
    @State var showLoginView = false
    
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
                    .padding(.bottom, 20)
                
                VStack(alignment: .center) {
                    if image != nil {
                        Image(uiImage: image!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 130.0, height: 130.0)
                            .clipShape(Circle())
                    } else {
                        Image("userprofileplaceholder")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 130.0, height: 130.0)
                            .clipShape(Circle())
                    }
                    
                    Button(action: {
                        showImagePicker.toggle()
                    }, label: {
                        Text("Select Profile Picture")
                    })
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(sourceType: .photoLibrary) { image in
                            self.image = image
                        }
                    }
                }
                .padding(.bottom, 40)
                
                ScrollView {
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
                    
                    TextField("Username", text: $username)
                        .padding()
                        .background(lightGrayColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                        .textInputAutocapitalization(.never)
                    
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
                .frame(height: 300.0)
                
                Button(action: {
                    postSignupData()
                }, label: {
                    Text("Sign Up")
                        .padding(.vertical, 20)
                        .padding(.horizontal, 100)
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(Capsule())
                })
                .padding(.top, 40)
                .disabled(self.first_name.isEmpty || self.last_name.isEmpty || self.username.isEmpty || self.email.isEmpty || self.password.isEmpty || self.confirm_password.isEmpty)
                .fullScreenCover(isPresented: $showLoginView, content: LoginView.init)
            }
            .padding(.bottom, 10)
            
        }
        .padding()
    }
    
    func postSignupData() {
        guard let url = URL(string: "http://0.0.0.0:8000/register/") else {
            print("api is down")
            return
        }
        
        let registrationData = RegisterModel(first_name: self.first_name, last_name: self.last_name, username: self.username, email: self.email, password: self.password, confirm_password: self.confirm_password)
                
        guard let encoded = try? JSONEncoder().encode(registrationData) else {
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
                if let response = try? JSONDecoder().decode(RegisterModel.self, from: data) {
                    DispatchQueue.main.async {
                        print(response)
                        self.showLoginView.toggle()
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
