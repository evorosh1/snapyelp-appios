//
//  MainView.swift
//  frontend
//
//  Created by Destiny Walcott on 3/21/22.
//


import SwiftUI



//var users = [User]()

/// This controls the layout of the app after the login page
///
///
struct MainView: View {
    @State var user:User = User()
    
    //var token: String

    var body: some View {
        TabView {
          //  .task {
            //    await loadData()
            
            Newsfeed(user: user)
                .tabItem {
                    Image(systemName: "house.fill")
                }
           // MapView()
               // .tabItem {
              //      Image(systemName: "mappin.and.ellipse")
            //    }
            ProfileView(user: user)
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
        }
        .font(.headline)
        .task {
            print("here")
            print(token)
            await loadData()
        }
    }
    
    func loadData() async {
        print("Token \(token)")
        print("Load Data")
        guard let url = URL(string: "http://localhost:8000/account/user/") else {
            print("internal error")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("Token \(token)", forHTTPHeaderField: "Authorization")
        //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            print("after data")
            print(String(data: data, encoding: String.Encoding.utf8))
            user = try JSONDecoder().decode(User.self, from: data)
            print("getting user ")
            print(user.username)
        } catch {
            print("Invalid data: \(error)")
        }

    }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
