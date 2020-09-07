//
//  ArticleContentView.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 9/5/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI
import UIKit
import SafariServices

struct ArticleContentView: View {
    @ObservedObject
    private(set) var viewModel: ArticleContentViewModel
    
    
    var body: some View {
        SFSafariWebView(url: viewModel.htmlContentURL!)
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitle(Text(viewModel.appTitle), displayMode: .inline)
            .navigationBarHidden(true)
    }
}

struct ArticleContentView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleContentView(viewModel: .init(model: Article(link: "http://www.reflector-online.com/news/article_4e34c67a-eb0a-11ea-a10a-c7bf9c43918d.html")))
    }
}
