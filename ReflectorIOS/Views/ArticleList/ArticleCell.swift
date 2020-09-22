//
//  ArticleCell.swift
//  ReflectorIOS
//
//  Created by Austin Brown on 9/17/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

fileprivate enum CellConstants {
    static let titleSize: CGFloat = 20
    static let lineLimit = 3
    static let detailSize: CGFloat = 15
}
struct ArticleCell: View {
    private(set) var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(article.title ?? "")
                .font(.system(size: CellConstants.titleSize, weight: Font.Weight.bold))
                .foregroundColor(Color(Theme.reflectorMaroon))
            Text(article.details ?? "")
                .lineLimit(CellConstants.lineLimit)
                .font(.system(size: CellConstants.detailSize))
                .padding(.bottom)
            HStack {
                Text(article.creator ?? "")
                Spacer()
                Text(formatDate(article.pubDate))
            }
        }
    }
}

// MARK: - Formatting

extension ArticleCell {
    private func formatDate(_ date: Date?) -> String {
        guard let pubDate = date else {
            return ""
        }
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: pubDate)
    }
}

// MARK: - Preview

struct ArticleCell_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCell(article: .init(title: "a", details: "b", pubDate: Date(), link: "d", creator: "e"))
    }
}
