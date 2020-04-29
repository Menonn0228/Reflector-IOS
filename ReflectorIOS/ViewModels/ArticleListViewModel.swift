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
    @Published var title: String = "The Reflector"
    @Published var date: String = "Feb 04. 2020"
    
    @Published var articleViewModels: [ArticleViewModel] = []
    
    public func retrieveNewsArticles() {
        RSSService.shared.fetchArticles(with: .news) { (result) in
            switch result {
            case .success(let articles):
                DispatchQueue.main.async {
                    // The map function performs an operation on each element in articles. In this case, it creates a list of ArticleViewModels for each element in articles.
                    self.articleViewModels = articles.map { ArticleViewModel($0) }
                    for vm in self.articleViewModels {
                        print(vm.title)
                    }
                }
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
