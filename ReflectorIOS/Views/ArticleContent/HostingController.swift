//
//  HostingController.swift
//  ReflectorIOS
//
//  Created by Austin Brown on 9/30/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

class HostingController<ContentView>: UIHostingController<ContentView> where ContentView : View {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
}
