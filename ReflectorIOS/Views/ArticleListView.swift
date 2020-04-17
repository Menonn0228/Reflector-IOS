//
//  ArticleListView.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 4/7/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI
/// This view will display the previews for each of the articles.
/// A user can tap on a row from this list to be taken to the full article.
struct ArticleListView: View {
    
    @EnvironmentObject var viewModel: ArticleListViewModel
    
    var myButton: some View {
        Button(action: {
            guard let articles = RSSNetworkManager.shared.fetchNews() else { return }
            print("Printing Parsed Stuff")
            for article in articles {
                guard let aTitle = article.title else { break }
                print(aTitle)
            }
        }) {
            Text("Button")
        }
    }
    
    var body: some View {
        NavigationView {
            myButton
            .navigationBarTitle(self.viewModel.title)
        }
        
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
