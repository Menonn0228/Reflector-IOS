//
//  CategoryItem.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 10/12/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation


struct CategoryItem {
    private(set) var type: RSSParameter.FeedCategory
    
    var displayName: String {
        switch type {
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
