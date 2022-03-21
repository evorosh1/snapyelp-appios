//
//  Models.swift
//  frontend
//
//  Created by Destiny Walcott on 3/21/22.
//

import Foundation


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

var posts: [Post] = [
    Post(postType: ._public, reviewText: "The atmosphere was nice and the food is delicious. 10 out of 10, highly recommend‼️", locationOnBool: true, imageData: "tacos"),
]
