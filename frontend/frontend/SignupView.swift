//
//  Signup.swift
//  frontend
//
//  Created by Destiny Walcott on 3/29/22.
//

import SwiftUI

struct SignupView: View {
    @State var firstname: String = ""
    @State var lastname: String = ""
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""
    
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
                Text("Resgister")
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
                    TextField("First Name", text: $firstname)
                        .padding()
                        .background(lightGrayColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    
                    TextField("Last Name", text: $lastname)
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
                }
                .padding(.horizontal, 5)
//                .frame(height: 250.0)
                
                Button(action: {
                    PostRegistrationDetails()
                }, label: {
                    Text("Sign Up")
                        .padding(.vertical, 20)
                        .padding(.horizontal, 100)
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(.blue)
                        .clipShape(Capsule())
                })
                .padding(.top, 30)
                .disabled(self.username.isEmpty || self.password.isEmpty || self.email.isEmpty)
                .fullScreenCover(isPresented: $showLoginView, content: LoginView.init)
            }
//            .padding(.bottom, 60)
            
        }
        .padding()
    }
    
    func PostRegistrationDetails() {
        guard let url = URL(string: "http://0.0.0.0:8000/register/") else {
            print("api is down")
            return
        }
        
        let registrationData = Registration(username: self.username, email: self.email, password: self.password)
                
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
                if let response = try? JSONDecoder().decode(Registration.self, from: data) {
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
