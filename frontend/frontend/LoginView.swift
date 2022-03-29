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
    @State var showMainView = false
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Hello!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            
            VStack(alignment: .center) {
                if image != nil {
                    Image(uiImage: image!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150.0, height: 150.0)
                        .clipShape(Circle())
                } else {
                    Image("userprofileplaceholder")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150.0, height: 150.0)
                        .clipShape(Circle())
                }
                
                Button(action: {
                    showImagePicker.toggle()
                }, label: {
//                    Image(systemName: "photo.on.rectangle.angled")
//                        .resizable()
//                        .frame(width: 30, height: 30)
                    Text("Change Profile Picture")
                })
//                .offset(x: 65, y: -100)
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(sourceType: .photoLibrary) { image in
                        self.image = image
                    }
                }
            }
            .padding(.bottom, 75)
            
            TextField("Username", text: $username)
                .padding()
                .background(lightGrayColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .padding(.horizontal, 10)
            
            SecureField("Password", text: $password)
                .padding()
                .background(lightGrayColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .padding(.horizontal, 10)
            
            Button(action: {
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
            .padding(.bottom, 5)
            .fullScreenCover(isPresented: $showMainView, content: MainView.init)

            
            Button(action: {
                showSignupView.toggle()
            }, label: {
                Text("Don't have an acount, signup here")
            })
            .fullScreenCover(isPresented: $showSignupView, content: SignupView.init)
            
        }
        .padding()
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
