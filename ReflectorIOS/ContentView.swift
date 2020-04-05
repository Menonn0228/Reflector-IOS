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
            AF.request("http://www.reflector-online.com/search/?c%5B%5D=news%2F*&t=article&f=rss").response { response in
                debugPrint(response)
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
