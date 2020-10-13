//
//  AppSideBarNavigation.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 9/30/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

/**
    Most of the structure for the SideBarNavigationw was referenced from Apple's Fruta demo app
 that was shown off in WWDC 2020
 */

struct AppSideBarNavigation: View {
    enum NavigationItem: String {
        case home, saved, categories
    }
    
    @State private var selectedSection: Set<NavigationItem> = [.home]
    
    @State
    var categories: [CategoryItem] = RSSParameter.FeedCategory.allCases.map { CategoryItem(type: $0) }
    
    /// Contains the home, saved, and categories that a user can navigate to.
    var sidebar: some View {
        List(selection: $selectedSection) {
            
            NavigationLink(destination: ArticleListView()) {
                Text(NavigationItem.home.rawValue.capitalized)
            }
            .accessibility(label: Text(NavigationItem.home.rawValue.capitalized))
            .tag(NavigationItem.home)
            
            NavigationLink(destination: Text("Coming Soon")) {
                Text(NavigationItem.saved.rawValue.capitalized)
            }
            .accessibility(label: Text("Saved"))
            .tag(NavigationItem.saved)
            
            Section(header: Text(NavigationItem.categories.rawValue.capitalized)) {
                ForEach(categories, id: \.type) { item in
                    NavigationLink(destination: ArticleListView(category: item.type)) {
                        Text(item.displayName)
                    }
                }
            }
        }
        .accentColor(Color.reflectorMaroon)
    }
    
    @ViewBuilder
    var body: some View {
        NavigationView {
            // SwiftUI and iOS 13+ are  smart enough to show the two views at once
            // if the user taps something on the sidebar.
            sidebar
        }
    }
}

// MARK: - Preview

struct AppSideBarNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppSideBarNavigation()
    }
}
