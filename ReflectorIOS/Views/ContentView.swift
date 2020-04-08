//
//  ContentView.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 4/4/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    var body: some View {
        
        Button(action: {
            let articles = RSSNetworkManager.shared.fetchNews()
            if let articles = articles {
                for article in articles {
                    print(article.title ?? "Title DNE")
                }
            }
        }) {
            Text("Press Me")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
