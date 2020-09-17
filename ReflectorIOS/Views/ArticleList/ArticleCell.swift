//
//  ArticleCell.swift
//  ReflectorIOS
//
//  Created by Austin Brown on 9/17/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

struct ArticleCell: View {
    private(set) var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(article.title ?? "")
                .font(.system(size: 20, weight: Font.Weight.bold))
                .foregroundColor(Color(Theme.reflectorMaroon!))
            
            Text(article.details ?? "")
                .lineLimit(3)
                .font(.system(size: 15))
                .padding(.bottom)
            
            
            HStack {
                Text(article.creator ?? "")
                Text(article.pubDate ?? "")
                
            }
        }
    }
}

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCell(article: .init(title: "a", details: "b", pubDate: "c", link: "d", creator: "e"))
    }
}
