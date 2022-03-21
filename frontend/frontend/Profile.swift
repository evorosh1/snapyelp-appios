//
//  Profile.swift
//  frontend
//
//  Created by Elizabeth Voroshylo on 3/21/22.
//

import Foundation

struct Profile {
    var username: String
    var publicprofile = false
    var seasonalPhoto = Season.winter
    var goalDate = Date()

    static let `default` = Profile(username: "User's name")

    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { rawValue }
    }
}
