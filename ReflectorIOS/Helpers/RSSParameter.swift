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
        
        var t: TypeCategory?
        var l: Int?
        var c: FeedCategory?
        var f: FeedType?
        
        // MARK: - Methods
        
        /// Returns a string containing the parameter fields that were assigned to the struct.
        /// Often times, you want to append this to the BaseURL before doing your network requests.
        func stringify() -> String {
            var params = "?"
            
            if let f = f {
                params += "f=\(f.rawValue)&"
            }
            
            if let t = t {
                params += "t=\(t.rawValue)&"
            }
            if let l = l {
                params += "l=\(l)&"
            }
            
            if let c = c {
                params += "c[]=\(c.rawValue)/*"
            }
            return params
        }
    }
