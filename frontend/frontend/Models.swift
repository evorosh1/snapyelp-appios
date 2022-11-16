//
//  Models.swift
//  frontend
//
//  Created by Destiny Walcott on 3/21/22.
//

/// This file contains all the models for our data and our views

import Foundation
import SwiftUI
import MapKit


struct RegisterModel: Codable, Hashable {
    let first_name: String
    let last_name: String
    let username: String
    let email: String
    let password: String
    let confirm_password: String
    let username: String
    let password: String
}

struct User: Codable, Hashable {
    var username: String = ""
    var bio: String = ""
    var posts: [Post] = []
    var friends: [Friends] = []
    var profile_pic: String = ""
    var image: some View {
        Image(profile_pic)
            .resizable()
            .scaledToFill()
            .frame(width: 50.0, height: 50.0, alignment: .center)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 2)
            }
            .shadow(radius: 7)
    }
}

struct Post: Codable, Hashable {
    var review_text: String = ""
    var location: String = ""
    var latitude: Double = 0
    var longitude: Double = 0
    var liked: Bool = false
    var total_likes: Int = 0
    var total_comments: Int = 0
    var post_type: String = "public"
    
    var photos: [String] = []
    var photosTabView: some View {
        TabView {
            ForEach(Array(photos.enumerated()), id: \.offset) { index, photo in
                Image("\(photo)")
                    .resizable()
                    .aspectRatio(0.75, contentMode: .fill)
                    .overlay(.black.opacity(0.2))
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct Place: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
    var user: String
    var post: Post
}

struct Friends: Codable, Hashable {
    var username: String = ""
    var profile_pic: String = ""
    var image: some View {
        Image(profile_pic)
            .resizable()
            .scaledToFill()
            .frame(width: 50.0, height: 50.0)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 2)
            }
            .shadow(radius: 7)
    }
}

//var url = URL(string: "http://localhost:8000/register/")
//var users = [User]()


/*
func loadData() async {
    .task {
        await loadData()
    }
    guard let url = URL(string: "http://localhost:8000/account/user/") else {
        print("api is down")
        return
    }
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
            users = decodedResponse.results
        }
    } catch {
        print("Invalid data")
    }

}
*/
/// This loads data from a file
/// - Parameter filename: name of the file
/// - Returns: decoded json data
///
///
///
///
///
/*func loadData() func load<T: Decodable>(_ filename: String) -> T{
    let data: Data
    /*
    guard let url = URL(string: "http://localhost:8000/account/user/") else {
        print("api is down")
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "PATCH"
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
                }
                return
            }
     guard let url = URL(string: "http://localhost:8000/account/user/") else {
     print("api is down")
         return
     }
        }

    //guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    guard let file = URL(string: filename)
    else {
        fatalError("Couldn't find file")
    }
     */
    guard let url = URL(string: "http://localhost:8000/account/user/") else {
        print("api is down")
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.addValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
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
                    //self.showMainView.toggle()
                }
                return
            }
        }
    }.resume()
    /*
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Error: \(error)")
    }
     */
    do {
        let (data, _) = URLSession.shared.data(from: url)
       
        if let decodedResponse = try? JSONDecoder().decode(T.self, from: data) {
            users = decodedResponse.results
        }

        // more code to come
    } catch {
        print("Invalid data")
    }

    /*
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("failed to parse data")
    
    }*/
}
 */
/*

var coordinates = [CLLocationCoordinate2D(latitude: 42.0987, longitude: -75.9180),
                   CLLocationCoordinate2D(latitude: 42.0987, longitude: -75.9180),
                   CLLocationCoordinate2D(latitude: 42.0987, longitude: -75.9180),
                   CLLocationCoordinate2D(latitude: 42.3601, longitude: -71.0589),
                   CLLocationCoordinate2D(latitude: 42.1156, longitude: -75.9588),
                   CLLocationCoordinate2D(latitude: 39.3643, longitude: -74.4229),
                   CLLocationCoordinate2D(latitude: 33.7490, longitude: -84.3880),
                   CLLocationCoordinate2D(latitude: 30.2671, longitude: -97.7431),
                   CLLocationCoordinate2D(latitude: 25.7617, longitude: -80.1918),
                   CLLocationCoordinate2D(latitude: 28.5384, longitude: -81.3789),
                   CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437),
                   CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)]

var places = setMapData()

/// This creates the data for the map view
/// - Returns: a collection of coordinate data plus user and post data
func setMapData() -> [Place] {
    var data: [Place] = []
    var i = 0
    for user in users {
        for post in user.posts {
            data.append(Place(coordinate: coordinates[i], user: user.username, post: post))
            i += 1
        }
    }
    return data
}
*/
