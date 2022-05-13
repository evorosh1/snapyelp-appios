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

}

//var places = [Place(location: "Binghamton, NY", coordinate: CLLocationCoordinate2D(latitude: 42.0987, longitude: 75.9180), review_text: "The atmosphere was nice and the food is delicious. 10 out of 10, highly recommend‼️"), Place(location: "Boston, Massachusetts", coordinate: CLLocationCoordinate2D(latitude: 42.0987, longitude: 75.8180), review_text: "Let's go Red Sox‼️")]

var places = [Place(coordinate: CLLocationCoordinate2D(latitude: 42.098, longitude: -75.9180))]

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

