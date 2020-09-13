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
        subscribeToRSSService()
    }
}

// MARK: - Methods

extension ArticleListStore {
    private func subscribeToRSSService() {
        articleCanceller = RSSService.shared
            .fetchArticlesPublisher(with: .news)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] articles in
                self?.articles = articles
            })
    }
}
