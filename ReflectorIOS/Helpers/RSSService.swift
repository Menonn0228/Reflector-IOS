//
//  RSSService.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 4/4/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation
import Combine

/// RSSService utilizes Combine framework and URL Sessions to fetch RSS feeds from the reflector website
class RSSService {
    /// shared Instance of RSSService.
    static let shared = RSSService()
    
    private init() { }
}

// MARK: - ArticlePublishing

extension RSSService: ArticlePublishing {
    
    func fetchArticlesPublisher(with parameters: RSSParameter) -> AnyPublisher<[Article], URLSession.DataTaskPublisher.Failure> {
        var reflectorURLComponents = URLComponents.reflectorBaseComponents
        
        reflectorURLComponents.queryItems = parameters.parseAsQueryItems()
        
        let url = reflectorURLComponents.url!
        print("FETCHING FROM >>  \(url) << in RSSService.fetchArticlesPublisher\n")
        
        let publisher = URLSession.shared
            .dataTaskPublisher(for: url)
            .map { $0.data }
            .map { ArticleXMLParser().parse(data: $0) }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
        
        return publisher
    }
}
