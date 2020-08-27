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
    
    // MARK: - Enums
    
    enum FeedCategory: String {
        case news
    }
    enum TypeCategory: String {
        case article
    }
    enum FeedType: String {
        case rss
    }
    
    // MARK: - Properties
    
    /// The type category. In most cases, this will be type `article `
    var t: TypeCategory?
    /// The number of elements to retrieve
    var l: Int?
    /// The type of articles we want to get. For example, `news`
    var c: FeedCategory?
    /// Primary feed type is `rss`
    var f: FeedType?
}

// MARK: - QueryItems

extension RSSParameter {
    
    /// Parses all of the parameter properties in a `[URLQueryItem]`
    /// append to a `URLComponent` to perform queries.
    /// - Returns: returns an array of `URLQueryItem`
    func parseAsQueryItems() -> [URLQueryItem] {
        
        var queryItems = [URLQueryItem]()
        
        if let feedType = f {
            queryItems.append(.init(name: "f", value: feedType.rawValue))
        }
        
        if let categoryType = t {
            queryItems.append(.init(name: "t", value: categoryType.rawValue))
        }
        
        if let numberItems = l {
            queryItems.append(.init(name: "l", value: String(numberItems)))
        }
        
        if let feedCategory = c {
            queryItems.append(.init(name: "c[]", value: feedCategory.rawValue))
        }
        
        return queryItems
    }
}
