//
//  RSSNetworkManager.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 4/4/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation
import Alamofire

class RSSNetworkManager {
    
    // MARK: - Properties
    private let baseURL: String = "http://reflector-online.com/search/"
    static let shared = RSSNetworkManager()
    
    // MARK: - Enums
    public enum FeedCategory: String {
        case news
    }
    
    
    public func parseParameters(type: String?, numItems: Int?, category: FeedCategory?) -> String {
        var params = "?"
        
        if let type = type {
            params += "t=\(type)&"
        }
        if let numItems = numItems {
            params += "l=\(numItems)&"
        }
        if let category = category {
            params += "c[]=\(category.rawValue)/*"
        }
        
        return params
    }
    
    
    public func fetchNews() {
        let parameters = parseParameters(type: "article", numItems: 50, category: .news)
        let url: URL = URL(string: baseURL+parameters)!
        
        AF.request(url).response { response in
            debugPrint(response)
        }
    }
    
    public func fetchArticles(withCategory: String) {
        
    }
    
    
    
}
