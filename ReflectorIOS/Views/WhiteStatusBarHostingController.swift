//
//  WhiteStatusBarHostingController.swift
//  ReflectorIOS
//
//  Created by Austin Brown on 10/7/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

class WhiteStatusBarHostingController<ContentView>: UIHostingController<ContentView> where ContentView : View {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
