//
//  ArticleListView.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 4/7/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI
import Combine

/// This view will display the previews for each of the articles.
/// A user can tap on a row from this list to be taken to the full article.
struct ArticleListView: View {
    /// Used Store object is used to retrieve remote articles
    @ObservedObject var store: ArticleListStore = .init()
    init(){
        UINavigationBar.appearance().backgroundColor = UIColor(red: 0.50, green: 0.00,blue: 0.00, alpha: 1.00)
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        
       }
    
    
    var body: some View {
        NavigationView {
            List(store.articles, id: \.title) { article in
                NavigationLink(destination: ArticleContentView(model: article)) {
                    Text(article.title ?? "")
                }
            }
            .navigationBarTitle(CommonStrings.reflectorTitle)
        }
        
    }
    
    
    
    
        
    
}

// MARK: - Preview

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
