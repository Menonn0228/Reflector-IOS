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
class RSSNetworkManager: NSObject, XMLParserDelegate {
    
    // MARK: - Properties
    private let baseURL: String = "http://www.reflector-online.com/search/"
    static let shared = RSSNetworkManager()
    private let xmlHelper = XMLHelper()
    
    
    // MARK: - Fetch Methods
    
    /// Fetches a list of articles from reflector-online.com/news and returns an array of Articles.
    public func fetchNews() -> [Article]? {
        var articles: [Article] = []
        let parameters = Parameter(t: .article, l: 10, c: .news, f: .rss).stringify()
        
        guard let url = URL(string: baseURL+parameters) else {
            print("Bad link when performing fetchNews")
            return nil
        }
        
        AF.request(url).response { response in
            debugPrint(response) // TODO: Parse the XML into an array of articles and append to articles variable.
            if let data = response.data {
                articles = self.xmlHelper.parse(Article.self, data: data)
            }
        }
        return articles
    }
    
    
    /// Fetches Articles of the specified category
    public func fetchArticles(withCategory: String) {
        
    }
    
    
    // MARK: - Parse Methods
    
}
