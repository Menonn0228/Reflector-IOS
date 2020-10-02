//
//  ColorRepresentable.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 9/30/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

/// Protocol allows another type to be able to return a `UIColor` using the required property
protocol UIColorable {
    var asUIColor: UIColor { get }
}

/// Protocol requirement lets its conforming type to have the `asColor` property which can be called to get a `Color` based on itself.
protocol SwiftUIColorable {
    var asColor: Color { get }
}

/// Requires to Conform to `UIColorable` and `SwiftUIColorable`
typealias Colorable = UIColorable & SwiftUIColorable

extension SwiftUIColorable where Self: UIColorable {
    var asColor: Color {
        return Color(self.asUIColor)
    }
}
