//
//  ArticlePublishing.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 9/2/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation
import Combine

// MARK: - Protocols

protocol ArticlePublishing {
    /// Default Publisher that performs a network request for 20 articles sorted by newest
    /// - Parameter category: The category of article that will be retrieved.
    func fetchArticlesPublisher(with category: RSSParameter.FeedCategory) -> AnyPublisher<[Article], URLSession.DataTaskPublisher.Failure>
    
    /// Publisher that performs a URLSessionDataTask to the reflector website with the given parameters
    /// - Parameter parameters: The parameters for the given search request
    func fetchArticlesPublisher(with parameters: RSSParameter) -> AnyPublisher<[Article], URLSession.DataTaskPublisher.Failure>
}

extension ArticlePublishing {
    func fetchArticlesPublisher(with category: RSSParameter.FeedCategory) -> AnyPublisher<[Article], URLSession.DataTaskPublisher.Failure> {
        let parameters = RSSParameter(itemType: .article, numItems: 20, category: category)
        return fetchArticlesPublisher(with: parameters)
    }
}
