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
    
    typealias FeedCategory = RSSParameter.FeedCategory
    
    // MARK: - Properties
    
    /// Used Store object is used to retrieve remote articles
    @ObservedObject private var store = ArticleListStore()
    
    private var navigationBarTitleText: String = CommonStrings.reflectorTitle
    private var navigationDisplayMode: NavigationBarItem.TitleDisplayMode = .automatic
    
    // MARK: - Init
    
    init(category: FeedCategory? = nil) {
        store.updateCategory(to: category)
        navigationBarTitleText = (store.category == nil) ? CommonStrings.reflectorTitle : store.category!.description
        navigationDisplayMode = (store.category == nil) ? .automatic : .inline
    }
    
    // MARK: - UI
    
    var body: some View {
            List(store.articles, id: \.title) { article in
                NavigationLink(destination: ArticleContentView(model: article)) {
                    ArticleCell(article: article)
                        .onAppear {
                            store.fetchMoreArticles(after: article)
                        }
                }
            }
            .navigationBarTitle(Text(navigationBarTitleText), displayMode: navigationDisplayMode)
            .overlay(ActivitySquare($store.isFetching), alignment: .center)
    }
}

// MARK: - Preview

struct ArticleListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ArticleListView()
    }
}
