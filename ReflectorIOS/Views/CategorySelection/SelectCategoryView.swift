//
//  SelectCategoryView.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 9/30/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

struct SelectCategoryView: View {
    
    @State
    var categories: [CategoryItem] = RSSParameter.FeedCategory.allCases.map { CategoryItem(type: $0) }
    
    var body: some View {
        List(categories, id: \.type) { item in
            NavigationLink(destination: ArticleListView(category: item.type)) {
                Text(item.displayName)
            }
        }
        .navigationBarTitle(Text(CommonStrings.categoriesTitle), displayMode: .automatic)
    }
}

struct SelectCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCategoryView()
    }
}
