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
    private(set) var model: Article
    
    var body: some View {
        WebView(urlString: model.link)
            .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
            .navigationBarTitle(Text(CommonStrings.reflectorTitle), displayMode: .inline)
    }
}

struct ArticleContentView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleContentView(model: .init(link: "http://www.reflector-online.com/news/article_4e34c67a-eb0a-11ea-a10a-c7bf9c43918d.html"))
    }
}
