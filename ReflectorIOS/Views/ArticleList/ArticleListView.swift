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
    @State private var selectedTab = 0
    /// Used Store object is used to retrieve remote articles
    @ObservedObject var store: ArticleListStore = .init()
    
    var body: some View {
        TabView {
            
        NavigationView {
            List(store.articles, id: \.title) { article in
                NavigationLink(destination: ArticleContentView(model: article)) {
                    Text(article.title ?? "")
                }
            }
            .navigationBarTitle(Text(CommonStrings.reflectorTitle))
        }
            Text("Tab 1")
            .onTapGesture {
                self.selectedTab = 1
            }
            .tabItem {
                Image(systemName: "star.fill")
                Text("Home")
            }
            .tag(0)
            
            Text("Tab 2")
            .tabItem {
                Image(systemName: "star.fill")
                Text("Saved")
            }
            .tag(1)
            
            Text("Tab 3")
            .tabItem {
                Image(systemName: "star.fill")
                Text("Category")
            }
            .tag(1)
            
    }
}
    
}

// MARK: - Preview

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
