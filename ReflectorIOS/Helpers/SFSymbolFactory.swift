//
//  SFSymbolFactory.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 9/30/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI


/// Enum consisting of all the string ID's for SFSymbols used in the app
enum SFSymbol: String {
    case houseFill = "house.fill"
    case bookmarkFill = "bookmark.fill"
    case trayFullFill = "tray.full.fill"
}

// MARK: - ImageRepresentable

extension SFSymbol: ImageRepresentable {
    var asImage: Image {
        return Image(systemName: rawValue)
    }
    
    var asUIImage: UIImage {
        return UIImage(systemName: rawValue)!
    }
}

