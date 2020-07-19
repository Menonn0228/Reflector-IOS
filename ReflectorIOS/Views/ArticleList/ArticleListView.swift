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
            self.viewModel.debugPrint()
        }) {
            Text("Press Me")
        }
    }
    
    var body: some View {
        NavigationView {
            myButton
                .navigationBarTitle(ArticleListViewModel.reflectorTitle)
        }
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
