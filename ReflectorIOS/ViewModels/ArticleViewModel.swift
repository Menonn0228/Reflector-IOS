//
//  ArticleViewModel.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 4/17/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation


// ArticleViewModel is the viewmodel for the article cell when you see a list of Articles.
// You know the individual cells with different articles you can tap on? That's what this viewmodel is for... is the cells.


final class ArticleViewModel: ObservableObject {
    
    private var article: Article
    
    // MARK: - Accessible Computed Properties
    // A computed property is a variable that computes itself whenever it is called, basically.
    public var title: String {
        return article.title ?? "Title N/A"
    }
    
    public var details: String {
        return article.details ?? "Details Not Available"
    }
    
    public var author: String {
        return article.creator ?? "Author N/A"
    }
    
    /// Date the article was published
    public var pubDate: String {
        return article.pubDate ?? "Date N/A"
    }
    
    
    
    
    
    // MARK: - Init Method
    init(_ article: Article) {
        self.article = article
    }
    
    
}
