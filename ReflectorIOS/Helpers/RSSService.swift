//
//  RSSService.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 4/4/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation
import Combine


// MARK: - Protocols

protocol RSSServiceManager {
    func fetchArticles(with category: RSSParameter.FeedCategory, _ completion: @escaping((Result<[Article], RSSServiceError>) -> () ))
}

// MARK: - Errors

enum RSSServiceError: Error {
    case noDataReturnedfromRSSFeed
    case invalidURL
    
}

/// RSSService utilizes Alamofire to perform network requests to retrieve the data from the Reflector Website.
class RSSService: NSObject, RSSServiceManager {
    
    // MARK: - Properties
    
    private let baseURL: String = "http://www.reflector-online.com/search/"
    static let shared = RSSService()
    private let xmlHelper = ArticleXMLParser()
    
    // MARK: - Fetch Methods
    
    /// Fetches Articles of the specified category.
    /// - Parameters:
    ///   - category: Is a Parameter.FeedCategory type. Refer to this enum to see potential options. (.news, .sports, etc.)
    ///   - completion: `Result<[Article], RSSServiceError>` is called after data or an error has been retrieved. A succussful response will run  the completion(Result.successful)  block parameter and provide a value that contains the articles.
    ///                 A failure in the network call will result in completion(Result.failure) block to be called and will also provide an error type that can be viewed.
    /// - Example Use Case Seen in ArticleListViewModel
    /// ```    public func retrieveNewsArticles() {
    ///        RSSService.shared.fetchArticles(with: .news) { (result) in
    ///            switch result {
    ///            case .success(let articles):
    ///            // Do stuff w/ articles
    ///            case .failure(let error):
    ///            // Do stuff w/ error
    ///            }
    ///        }
    ///    } ```'
    func fetchArticles(with category: RSSParameter.FeedCategory, _ completion: @escaping((Result<[Article], RSSServiceError>) -> () )) {
        // TODO: - Fetch Articles based on the given category parameter.
        let parameter = RSSParameter(t: .article, l: 50, c: category, f: .rss)
        
        // If the URL fails, it will run a completion with Failure Result and a coresponding error value.
        guard let url = URL(string: baseURL+parameter.stringify()) else {
            completion(.failure(.invalidURL))
            return
        }
        // Datatask **defines** a session where we make the call and do something with the response.
        // We only receive data and not a response or error from the RSS API call. That is why we place ' _ ' for response and error
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                completion(.failure(.noDataReturnedfromRSSFeed))
                return
            }
            
            // decode the data into Articles
            let articles: [Article] = self.xmlHelper.parse(data: data)
            completion(.success(articles))
        }
        
        // We resum() dataTask to actually start the request and it's completion code.
        dataTask.resume()
    }
    
}
