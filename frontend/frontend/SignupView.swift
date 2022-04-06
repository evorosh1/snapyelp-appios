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
    @State var password1: String = ""
    @State var password2: String = ""
    
    @State var showImagePicker = false
    @State var image: UIImage? = nil
    
    @State var showMainView = false
    
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
                    
                    TextField("Username", text: $username)
                        .padding()
                        .background(lightGrayColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    
                    SecureField("Password", text: $password1)
                        .padding()
                        .background(lightGrayColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                    
                    SecureField("Re-enter Password", text: $password2)
                        .padding()
                        .background(lightGrayColor)
                        .cornerRadius(5.0)
                        .padding(.bottom, 10)
                }
                .padding(.horizontal, 5)
//                .frame(height: 250.0)
                
                Button(action: {
                    showMainView.toggle()
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
                .fullScreenCover(isPresented: $showMainView, content: MainView.init)
            }
//            .padding(.bottom, 60)
            
        }
        .padding()
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
