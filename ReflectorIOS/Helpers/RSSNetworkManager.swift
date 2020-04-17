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
    /// - parameter completion: Escaping completion will use an optional array of articles. If an error occurs the input may be optional, so safely unwrap this completion parameter. If articles do exist, store it in the ViewModel for use.
    public func fetchNews(_ completion: @escaping ( (_ articles: [Article]? )-> () )) {
        let parameters = Parameter(t: .article, l: 10, c: .news, f: .rss).stringify()
        var articles: [Article] = [] // This will be passed into the completion
        
        guard let url = URL(string: baseURL+parameters) else {
            print("Bad link when performing fetchNews")
            completion(nil)
            return
        }
        
        AF.request(url).response { response in
//            debugPrint(response) // TODO: Parse the XML into an array of articles and append to articles variable.
            if let data = response.data {
                 articles = self.xmlHelper.parse(data: data)
            }
            completion(articles) // This will make the program step out of the fetchNews method.
        }
    }
    
    
    /// Fetches Articles of the specified category
    public func fetchArticles(withCategory: String) {
        // TODO: - Fetch Articles based on the given category parameter.
    }
    
    
    // MARK: - Parse Methods
    
}
