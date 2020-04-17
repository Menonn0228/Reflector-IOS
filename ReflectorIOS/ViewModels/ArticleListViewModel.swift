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
class ArticleListViewModel: ObservableObject {
    @Published var title: String = "The Reflector"
    @Published var date: String = "Feb 04. 2020"
    
    @Published var articles: [Article] = []
    
    public func retrieveArticles() {
        RSSNetworkManager.shared.fetchNews { (articles) in
            guard let articles = articles else { return }
            self.articles = articles
            
            print("Printing articles in the Viewmodel")
            for a in self.articles {
                a.debug_print()
            }
        }
        
        
    }
    
    
    
    

}
