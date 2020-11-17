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
fileprivate let initialLimit: Int = 25
/// Number of elements to retrieve additional articles
fileprivate let additionalLimit: Int = 50
/// Represents how early we need to trigger `fetchArticles`
fileprivate let triggerIndexOffset: Int = 8

/// This is the ViewModel for the ArticleListView
final class ArticleListStore: ObservableObject {
    
    typealias FeedCategory = RSSParameter.FeedCategory
    
    // MARK: - Properties
    
    /// Articles retrieved from database
    @Published private(set) var articles: [Article] = []
    /// Determines if the store is performing a network request.
    @Published var isFetching: Bool = false
    /// This subscriber is here to hold the memory space for the subscription that listens to our RSSService calls.
    private var articleCanceller: AnyCancellable?
    /// The article category that will be fetched
    private(set) var category: FeedCategory?
    
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
        
        let parameters = RSSParameter(numItems: numItemsToFetch, offset: offset, category: category)
        
        isFetching = true
        articleCanceller = RSSService.shared
            .fetchArticlesPublisher(with: parameters)
            .removeDuplicates()
            .sink { [weak self] completion in
                self?.isFetching = false
                
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
        
        guard shouldLoadMoreArticles(after: article) else {
            return
        }
        
        fetchArticles()
    }
    
    /// Returns a boolean value on whether or not the store should fetch more articles
    /// Will return `true` if `articles` property is empty, or if a *trigger article* is passed in.
    /// - A **Trigger Article** is an article that can cause the loading of more articles. This is normally an article at the end of the list.
    ///
    /// - Parameter article: Return articles after the given article
    /// - Returns: Boolean that determines if more articles need to be fetched.
    private func shouldLoadMoreArticles(after article: Article?) -> Bool {
        
        guard let article = article,
              !articles.isEmpty else {
            return true
        }
        
        // If article is towards the end of the array (the triggerArticles), return true.
        let triggerArticles = articles[articles.count - triggerIndexOffset ..< articles.count]
        if triggerArticles.contains(article) {
            return true
        }
        
        return false
    }
    
    /// Resets the articles array and fetches new ones based on the input parameter
    /// - Parameter newCategory: The type or articles that will be fetched
    func updateCategory(to newCategory: FeedCategory?) {
        articles.removeAll()
        category = newCategory
        fetchArticles()
    }
}
