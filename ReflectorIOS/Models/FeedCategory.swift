//
//  FeedCategory.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 10/13/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation

typealias FeedCategory = RSSParameter.FeedCategory

// MARK: - CustomStringConvertible

extension FeedCategory: CustomStringConvertible {
    
    /// Returns a string representing the category that can be displayed to a user.
    var description: String {
        switch self {
        case .news:
            return "🌎 News"
        case .covid19:
            return "🦠 Covid-19"
        case .life:
            return "🍸 Life & Entertainment"
        case .opinion:
            return "💬 Opinion"
        case .sports:
            return "🏈 Sports"
        }
    }
}
