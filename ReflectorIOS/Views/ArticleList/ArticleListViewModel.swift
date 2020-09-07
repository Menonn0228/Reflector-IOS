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
final class ArticleListViewModel: ObservableObject {
    
    // MARK: - Statics
    
    static let reflectorTitle = CommonStrings.reflectorTitle
    static var date: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: Date())
    }
    
    // MARK: - Properties
    
    /// Published property is observied by the ArticleListView to display each viewmodel
    @Published var articleViewModels: [ArticleViewModel] = []
    /// This subscriber is here to hold the memory space for the subscription that listens to our RSSService calls.
    private var articleCanceller: AnyCancellable?
    
    // MARK: - Init
    
    init() {
        articleCanceller = RSSService.shared
            .fetchArticlesPublisher(with: .news)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] (articles) in
                self?.articleViewModels = articles.map { ArticleViewModel($0) }
            })
    }
}

// MARK: - Debugging

extension ArticleListViewModel {
    /// Prints out all of the viewmodel's properties
    func debugPrint() {
        print("Title: \(Self.reflectorTitle)")
        print("Date: \(Self.date)")
        print("Articles Titles:")
        articleViewModels.forEach {
            print($0.title)
        }
    }
}
