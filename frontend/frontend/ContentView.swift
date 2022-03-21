//
//  ContentView.swift
//  frontend
//
//  Created by Destiny Walcott on 3/5/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingProfile = false
    var body: some View {
        VStack {
            VStack(alignment: .center) {
                HStack {
                    Text("AppName")
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text("Add Post")
                }
                Divider()
            }
            .padding(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/)
            PostView()
            
            VStack {
                Divider()
                
                HStack {
                    Text("| Map Icon |")
                    Spacer()
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("Profile", systemImage: "person.crop.circle")
                            .scaledToFill()
                            .frame(width: 45.0, height: 45.0)
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.white, lineWidth: 2)
                            }
                            .shadow(radius: 7)
                    }
                }
            }
            .sheet(isPresented: $showingProfile) {
                           ProfileView()
                       }


            .padding(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/)
        }
        .padding()
            
        
//        Text("Hello, world!") // another version of a view/struct
//            .padding() // a function that exist in all structs that behave like a view
    }
    
//    text view
//    combiner views i.e. a grid or  a stack which pieces other views together
//    bag of views: a group of related views
//    combiners and the bag of views go together i.e. combiners take a group of views and put it together
//    view modifiers: functions that return a modified/new version of the original view
//    view builder: a list/bag of views that's packaged up for us
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
