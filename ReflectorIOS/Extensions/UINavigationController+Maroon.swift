//
//  UINavigationController+Maroon.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 9/14/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import Foundation
import SwiftUI

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
      
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Theme.reflectorMaroon
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
}
