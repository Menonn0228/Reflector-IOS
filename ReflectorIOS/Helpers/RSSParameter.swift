//
//  RSSParameter.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 4/8/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation

/// RSSParameter struct is used to define the search parameters for an RSS Feed Request.
/// Use **stringify()** method to return the parsed search parameters and add this to the baseURL.
/// - Example of string for parameter being returned: `?f=rss&t=article&l=50&c[]=news/*`
struct RSSParameter {
    
    /// The type category. In most cases, this will be type `article `
    /// This is `t` in the rss parameter
    private(set) var itemType: TypeCategory?
    /// The number of elements to retrieve
    /// This is `l` in the rss parameter
    private(set) var numItems: Int?
    /// The type of articles we want to get. For example, `news`
    /// This is `c[]` in the rss parameter
    private(set) var category: FeedCategory?
    /// The type of feed to retrieve.
    /// This is `f` in the rss parameter
    /// Default feedType is `rss`
    private(set) var feedType: FeedType = .rss
    
    typealias SortConfiguration = (SortByType, SortOrder)
    /// Tuple that indicates how the items will be sorted when returned
    /// Default type is `descending start_time` AKA Newest
    private(set) var sortType: SortConfiguration = (.start_time, .desc)
}

// MARK: - Enums

extension RSSParameter {
    enum FeedCategory: String {
        case news
    }
    enum TypeCategory: String {
        case article
    }
    enum FeedType: String {
        case rss
    }
    
    enum SortByType: String {
        case title, start_time
        case relevance = ""
    }
    
    enum SortOrder: String {
        case asc, desc
    }
}

// MARK: - QueryItems

extension RSSParameter {
    
    /// Parses all of the parameter properties in a `[URLQueryItem]`
    /// append to a `URLComponent` to perform queries.
    /// - Returns: returns an array of `URLQueryItem`
    func parseAsQueryItems() -> [URLQueryItem] {
        
        var queryItems = [URLQueryItem]()
        
        queryItems.append(.init(name: "f", value: feedType.rawValue))
        
        if let categoryType = itemType {
            queryItems.append(.init(name: "t", value: categoryType.rawValue))
        }
        
        if let numberItems = numItems {
            queryItems.append(.init(name: "l", value: String(numberItems)))
        }
        
        if let feedCategory = category {
            queryItems.append(.init(name: "c[]", value: feedCategory.rawValue))
        }
        
        queryItems.append(.init(name: "s", value: sortType.0.rawValue))
        queryItems.append(.init(name: "sd", value: sortType.1.rawValue))
        
        return queryItems
    }
}
