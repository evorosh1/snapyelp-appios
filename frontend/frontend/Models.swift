//
//  Models.swift
//  frontend
//
//  Created by Destiny Walcott on 3/21/22.
//

import Foundation


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


struct Post: Codable, Identifiable {
    var id = UUID()
    var postType: PostType = ._public
    var reviewText: String = ""
    var locationOnBool: Bool = false
    var imageData: String = ""
    
    enum PostType: String, Codable {
        case _public = "Public"
        case _private = "Private"
    }
    
    enum CodingKeys: String, CodingKey {
        case postType = "post_type"
        case reviewText = "review_text"
        case locationOnBool = "location_on"
        case imageData = "image_data"
    }
}

struct Friends: Codable, Identifiable {
    var id = UUID()
    //var postType: PostType = ._public
    //var locationOnBool: Bool = false
    var name: String = ""
    var profilepic: String = ""
    
   /* enum PostType: String, Codable {
        case _public = "Public"
        case _private = "Private"
    }
    */
    enum CodingKeys: String, CodingKey {
        //case postType = "post_type"
        //case locationOnBool = "location_on"
        case name = "user"
        case profilepic = "image_data"
    }
}


var posts: [Post] = [
    Post(postType: ._public, reviewText: "The atmosphere was nice and the food is delicious. 10 out of 10, highly recommend‼️", locationOnBool: true, imageData: "tacos"),
    Post(postType: ._public, reviewText: "Great Cats, Lots of options", locationOnBool: true, imageData: "humane")
]

var friends: [Friends] = [
    Friends(name: "Liz", profilepic: "profilefriend")

]
