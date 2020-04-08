//
//  RSSNetworkManager.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 4/4/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation
import Alamofire

/// RSSNetworkManager utilizes Alamofire to perform network requests to retrieve the data from the Reflector Website.
class RSSNetworkManager {
    
    // MARK: - Properties
    private let baseURL: String = "http://www.reflector-online.com/search/"
    static let shared = RSSNetworkManager()
    
    // MARK: - Enums
    /// Parameter Struct is used to define the search parameters for an RSS Feed Request.
    /// Use **stringify()** method to return the parsed search parameters and add this to the baseURL.
    /// - Example of string for parameter being returned: `?f=rss&t=article&l=50&c[]=news/*`
    struct Parameter {
        enum FeedCategory: String {
            case news
        }
        enum TypeCategory: String {
            case article
        }
        enum FeedType: String {
            case rss
        }
        var t: TypeCategory?
        var l: Int?
        var c: FeedCategory?
        var f: FeedType?
        
        
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
    
    
    public func fetchNews() {
//        let parameters = parseParameters(type: "article", numItems: 50, category: .news)
        let parameters: Parameter = Parameter(t: .article, l: 10, c: .news, f: .rss)
        
        guard let url = URL(string: baseURL+parameters.stringify()) else {
            print("Bad link when performing fetchNews")
            return
        }
        
        AF.request(url).response { response in
            debugPrint(response)
        }
    }
    
    public func fetchArticles(withCategory: String) {
        
    }
    
    
    
}
