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
    private var categories = FeedCategory.allCases
    
    var body: some View {
        List(categories, id: \.self) { item in
            NavigationLink(destination: ArticleListView(category: item)) {
                Text(item.description)
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
