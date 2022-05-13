//
//  Profile.swift
//  frontend
//
//  Created by Elizabeth Voroshylo on 3/21/22.
//


import Foundation

struct Profile {
    var user: User
    var posts: [Post]
    
    static let `default` = Profile(user: users[0], posts: users[0].posts)
    
    
}
