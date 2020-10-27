//
//  ContentView.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 7/18/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    
    @ViewBuilder var body: some View {
        
        #if os(iOS)
        if horizontalSizeClass == .compact {
            AppTabNavigation()
                .accentColor(.reflectorMaroon) // Small devices use tabs
        } else {
            AppSideBarNavigation()
                .accentColor(.reflectorMaroon) // iPads use the sideBar
        }
        #else // Macos.accentColor(.reflectorMaroon)
        fatalError("Must Create an AppSideBarNavigationView")
        #endif
    }
}
struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
