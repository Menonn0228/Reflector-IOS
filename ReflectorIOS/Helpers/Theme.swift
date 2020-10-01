//
//  Theme.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 9/14/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

/// Contains custom colors  as `UIColor` used in the app.
enum Theme: String {
    case reflectorMaroon = "reflector-maroon"
}


extension Theme: ColorRepresentable {
    var asUIColor: UIColor {
        return UIColor(named: self.rawValue)!
    }
}

