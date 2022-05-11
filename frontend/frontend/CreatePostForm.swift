//
//  NewPostForm.swift
//  frontend
//
//  Created by Destiny Walcott on 3/21/22.
//

import SwiftUI

enum PostType: String, Codable {
    case _public = "Public"
    case _private = "Private"
}

/// This creates view for creating/drafting a new post
struct CreatePostForm: View {
    @Environment(\.presentationMode) var presentationMode
    @State var postType: PostType = ._public
    @State var review_text = ""
    @State var location = ""
    @State var imageData = ""
    @State var showImagePicker = false
    @State var image: UIImage? = nil

    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Close")
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        showImagePicker.toggle()
                    }, label: {
                        Image(systemName: "photo.on.rectangle.angled")
                            .resizable()
                            .frame(width: 25, height: 25)
                    })
                    .padding(.trailing, 10)
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(sourceType: .photoLibrary) { image in
                            self.image = image
                            imageData = image.pngData()?.base64EncodedString() ?? ""
                        }
                    }
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Post")
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            .foregroundColor(.white)
                            .background(.blue)
                            .clipShape(Capsule())
                    })
                }
                .padding(.horizontal)
                .padding(.vertical, 5)
                
                List {
                    Section(header: Text("Set Post Type")) {
                        Picker("Set Post Type", selection: $postType) {
                            Text("Public").tag(PostType._public)
                            Text("Private").tag(PostType._private)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("Write a Review")) {
                        TextEditor(text: $review_text)
                            .font(.body)
                            .frame(height: 300)
                    }
                    
                    Section(header: Text("Add Location")) {
                        TextField("", text: $location)
                    }
                }
                .listStyle(InsetGroupedListStyle())
                
                if image != nil {
                    VStack {
                        HStack {
                            Spacer()
                            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                                Image(uiImage: image!).resizable().frame(width: 130, height: 130)
                                
                                Button(action: {
                                    image = nil
                                    imageData = ""
                                }, label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                })
                                .offset(x: 20, y: -15)
                            }
                            Spacer()
                        }
                    }
                    .padding()
                }
                
            }
            .navigationBarHidden(true)
        }
    }
}

struct CreatePostForm_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostForm()
    }
}
