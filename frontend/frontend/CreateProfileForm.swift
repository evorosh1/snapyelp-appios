//
//  CreateProfileView.swift
//  frontend
//
//  Created by Destiny Walcott on 4/24/22.
//

import SwiftUI

/// This creates the second view of the sign up page, which is the view for finishing the setup process of the profile
struct CreateProfileForm: View {
    @State var showImagePicker = false
    @State var image: UIImage? = nil
    @State var imageData = ""
    @State var bio = ""
    @State var showMainView = false
    
    var body: some View {
        VStack {
            Text("Yay, your account was successfully created! Let's setup your profile.")
                .font(.title2)
                .multilineTextAlignment(.center)
            
            VStack(alignment: .center) {
                Button(action: {
                    showImagePicker.toggle()
                }, label: {
                    VStack {
                        Text("Set Profile Picture")
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
                    }
                })
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(sourceType: .photoLibrary) { image in
                        self.image = image
                        imageData = image.jpegData(compressionQuality: 1)?.base64EncodedString(options: .lineLength64Characters) ?? ""
                        print(self.imageData)
                    }
                }
            }
            .padding(.top, 40)
            .padding(.bottom, 30)
            
            VStack(alignment: .leading) {
                Text("Add a bio")
                    .textCase(.uppercase)
                    .offset(y: 5)
                VStack {
                    TextEditor(text: $bio)
                        .font(.body)
                        .frame(height: 200)
                        .padding(5)
                }.overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.black, lineWidth: 0.5)
                )
            }
            .padding(.horizontal, 3)
            
            Button(action: {
//                postProfileData()
                showMainView.toggle()
            }, label: {
                Text("Done")
                    .padding(.vertical, 20)
                    .padding(.horizontal, 100)
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(.blue)
                    .clipShape(Capsule())
            })
            .padding(.top, 40)
            .fullScreenCover(isPresented: $showMainView, content: MainView.init)

        }
        .padding(.horizontal, 20)
    }
    
    func postProfileData() {
        guard let url = URL(string: "http://0.0.0.0:8000/account/user/") else {
            print("api is down")
            return
        }
        
        let parameters: [String: Any] = ["bio": self.bio, "profile_photo": self.imageData]
        print(self.bio, self.imageData)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/x-www-form-urlendoded", forHTTPHeaderField: "Content-Type")
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
              print("error with patch request: \(error.localizedDescription)")
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
                        self.showMainView.toggle()
                    }
                    return
                }
            }
        }.resume()
    }
}

struct CreateProfileForm_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileForm()
    }
}
