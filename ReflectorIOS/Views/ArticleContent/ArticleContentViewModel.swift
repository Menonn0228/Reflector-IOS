//
//  ArticleContentViewModel.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 9/5/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation
import SwiftUI

class ArticleContentViewModel: ObservableObject {
    private(set) var article: Article
    
    var articleHasContent: Bool {
        return htmlContentURL != nil
    }
    
    var htmlContentRequest: URLRequest? {
        guard let link = article.link,
            let url = URL(string: link) else { return nil }
        
        let request = URLRequest(url: url)
        return request
    }
    
    var htmlContentURL: URL? {
        guard let link = article.link,
            let url = URL(string: link) else { return nil }
        
        return url
    }
    
    init(model: Article) {
        article = model
    }
}
