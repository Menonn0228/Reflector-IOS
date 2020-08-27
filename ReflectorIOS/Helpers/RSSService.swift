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

protocol ArticlePublishing {
    func fetchArticlesPublisher(with category: RSSParameter.FeedCategory) -> AnyPublisher<[Article], URLSession.DataTaskPublisher.Failure>
}

// MARK: - Errors

enum RSSServiceError: Error {
    case noDataReturnedfromRSSFeed
    case invalidURL
    
}

// MARK: - Class

/// RSSService utilizes Combine framework and URL Sessions to fetch RSS feeds from the reflector website
class RSSService: NSObject {
    static let shared = RSSService()
}

// MARK: - ArticlePublishing

extension RSSService: ArticlePublishing {
    func fetchArticlesPublisher(with category: RSSParameter.FeedCategory) -> AnyPublisher<[Article], URLSession.DataTaskPublisher.Failure> {
        var reflectorURLComponents = URLComponents.reflectorBaseComponents
        let parameter = RSSParameter(t: .article, l: 50, c: category, f: .rss)
        
        reflectorURLComponents.queryItems = parameter.parseAsQueryItems()
        
        let url = reflectorURLComponents.url!
        print("Fetching to: \(url) in RSSService.fetchArticlesPublisher")
        
        let publisher = URLSession.shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .map { ArticleXMLParser().parse(data: $0) }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
        
        return publisher
    }
}
