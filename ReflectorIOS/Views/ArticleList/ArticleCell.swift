//
//  ArticleCell.swift
//  ReflectorIOS
//
//  Created by Austin Brown on 9/17/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

fileprivate enum CellConstants {
    static let titleFontSize: CGFloat = 20
    static let detailFontSize: CGFloat = 15
    static let authorAndDateFontSize: CGFloat = 13
    static let lineLimit = 3
}

struct ArticleCell: View {
    private(set) var article: Article
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(article.title ?? "")
                .font(.system(size: CellConstants.titleFontSize, weight: Font.Weight.bold))
                .foregroundColor(colorScheme == .light ? Theme.reflectorMaroon.asColor : Color(.white))
            
            Text(article.details ?? "")
                .lineLimit(CellConstants.lineLimit)
                .font(.system(size: CellConstants.detailFontSize))
                .foregroundColor(.secondary)
                .padding(.bottom)
            
            HStack {
                Text(article.creator ?? "")
                Spacer()
                Text(formatDate(article.pubDate))
            }
            .foregroundColor(.secondary)
            .font(.system(size: CellConstants.authorAndDateFontSize))
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
