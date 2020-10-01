//
//  AppTabNavigation.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 9/30/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

struct AppTabNavigation: View {
    
    @ViewBuilder
    var body: some View {
        TabView {
            
            NavigationView { ArticleListView() }
                .tabItem {
                    SFSymbol.houseFill.asImage
                    Text(CommonStrings.home)
                }
                .accessibility(label: Text(TabTag.home.rawValue.capitalized))
                .tag(TabTag.home)
            
            NavigationView { Text("Saved Feature Coming Soon") }
                .tabItem {
                    SFSymbol.bookmarkFill.asImage
                    Text(CommonStrings.saved)
                }
                .accessibility(label: Text(TabTag.saved.rawValue.capitalized))
                .tag(TabTag.saved)
            
            NavigationView { SelectCategoryView() }
                .tabItem {
                    SFSymbol.trayFullFill.asImage
                    Text(CommonStrings.categoriesTitle)
                }
                .accessibility(label: Text(TabTag.categories.rawValue.capitalized))
                .tag(TabTag.categories)
        }
    }
}

// MARK: Tab

extension AppTabNavigation {
    fileprivate enum TabTag: String {
        case home
        case saved
        case categories
    }
}

// MARK: - Preview

struct AppTabNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppTabNavigation()
    }
}
