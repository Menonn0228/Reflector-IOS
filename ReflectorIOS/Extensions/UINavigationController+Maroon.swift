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
        appearance.backgroundColor = UIColor(red: 0.50, green: 0.00,blue: 0.00, alpha: 1.00)
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
}
