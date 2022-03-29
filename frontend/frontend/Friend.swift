//
//  Friend.swift
//  frontend
//
//  Created by Elizabeth Voroshylo on 3/29/22.
//

import Foundation

struct Friend {
    var username: String
    var publicprofile = false
    var seasonalPhoto = Season.winter
    var goalDate = Date()
    //var profilepic: String

    static let `default` = Friend(username: "Liz Voroshylo")
    
    //static let `default` = Friend(profilepic: "friendpic")
    // default name for now, will import from database

    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { rawValue }
    }
}
