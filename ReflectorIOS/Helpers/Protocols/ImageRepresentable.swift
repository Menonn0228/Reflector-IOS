//
//  ImageRepresentable.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 9/30/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

/// Requires that the conforming type has a property that can be used to get an associated `UIImage`
protocol UIImageRepresentable {
    var asUIImage: UIImage { get }
}

/// Requires that the conforming type has a property that can be used to get a SwiftUI `Image`
protocol SwiftUIImageRepresentable {
    var asImage: Image { get }
}

/// Requires `UIImageRepresentable` and `SwiftUIImageRepresentable`
typealias ImageRepresentable = UIImageRepresentable & SwiftUIImageRepresentable
