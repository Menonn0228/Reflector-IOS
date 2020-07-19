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
    static let reflectorTitle: String = "The Reflector"
    var date: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: Date())
    }
    
    /// Published property is observied by the ArticleListView to display each viewmodel
    @Published var articleViewModels: [ArticleViewModel] = []
    
    /// Retrieves articles and maps the retrieved articles into an array of ArticleViewModels
    final func retrieveNewsArticles() {
        RSSService.shared.fetchArticles(with: .news) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let articles):
                DispatchQueue.main.async {
                    self.articleViewModels = articles
                        .map { ArticleViewModel($0) }
                }
            case .failure(let error):
                print(error) // TODO: Display Error to User
            }
        }
    }
    
    /// Prints out all of the viewmodel's properties
    func debugPrint() {
        print("Title: \(Self.reflectorTitle)")
        print("Date: \(date)")
        print("Articles Titles:")
        articleViewModels.forEach {
            print($0.title)
        }
    }
    
    init() {
        retrieveNewsArticles()
    }
}
