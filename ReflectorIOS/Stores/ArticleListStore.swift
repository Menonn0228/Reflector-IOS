//
//  ArticleListViewModel.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 4/13/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation
import SwiftUI
import Combine



/// Initial number of elements to retrieve
fileprivate let initialLimit: Int = 15
/// Number of elements to retrieve additional articles
fileprivate let additionalLimit: Int = 7

/// This is the ViewModel for the ArticleListView
final class ArticleListStore: ObservableObject {
    
    // MARK: - Properties
    
    /// Articles retrieved from database
    @Published
    private(set) var articles: [Article] = []
    /// This subscriber is here to hold the memory space for the subscription that listens to our RSSService calls.
    private(set) var articleCanceller: AnyCancellable?
    
    // MARK: - Init
    
    init() {
        fetchArticles()
    }
}

// MARK: - Service

extension ArticleListStore {
    private func fetchArticles() {
        let numItemsToFetch = articles.isEmpty ? initialLimit : additionalLimit
        let offset = articles.count
        
        let parameters = RSSParameter(numItems: numItemsToFetch, offset: offset, category: .news)
        
        articleCanceller = RSSService.shared
            .fetchArticlesPublisher(with: parameters)
            .removeDuplicates()
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished with success")
                case .failure(let error):
                    print(error.localizedDescription) // TODO: - Display alert to user
                }
            } receiveValue: { [weak self] articles in
                self?.articles.append(contentsOf: articles)
            }
    }
}

// MARK: - Data Loading

extension ArticleListStore {
    
    final func fetchMoreArticles(after article: Article? = nil) {
        
        if shouldLoadMoreArticles(after: article) {
            fetchArticles()
        } else {
            print ("DO NOT FETCH MORE ARTICLES")
        }
    }
    
    
    /// Returns a boolean value on weather or not the store should fetch more articles
    /// - Parameter article: Return articles after the given article
    /// - Returns: Boolean that determines if more articles need to be fetched.
    private func shouldLoadMoreArticles(after article: Article?) -> Bool {
        
        guard let article = article else {
            return true
        }
        
        if articles.isEmpty || articles.last == article {
            return true
        }
        
        return false
    }
    
}
