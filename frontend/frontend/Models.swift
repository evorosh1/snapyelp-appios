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

var token = ""

struct RegisterModel: Codable, Hashable {
    let first_name: String
    let last_name: String
    let username: String
    let email: String
    let password: String
    let confirm_password: String
}

struct LoginModel: Codable, Hashable {
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


var users: [User] = load("data.json")

/// This loads data from a file
/// - Parameter filename: name of the file
/// - Returns: decoded json data
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find file")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Error: \(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("failed to parse data")
    
    }
}

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

