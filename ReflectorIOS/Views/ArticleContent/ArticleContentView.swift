//
//  ArticleContentView.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 9/5/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

struct ArticleContentView: View {
    @ObservedObject
    private(set) var viewModel: ArticleContentViewModel
    
    
    var body: some View {
        WKView(request: viewModel.htmlContentRequest!)
    }
}

struct ArticleContentView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleContentView(viewModel: .init(model: Article(link: "http://www.reflector-online.com/news/article_4e34c67a-eb0a-11ea-a10a-c7bf9c43918d.html")))
    }
}
