//
//  ActivitySquare.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 11/14/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

/// A view that uses the ActivityIndicator and a rounded square background to represent loading activities.
/// Set a binding to the `animating` method to toggle `ActivitySquare` visibility.
struct ActivitySquare: View {
    @Binding var animating: Bool
    
    init(_ isAnimating: Binding<Bool>) {
        _animating = isAnimating
    }
    
    @ViewBuilder
    var body: some View {
        
        if animating {
                ZStack {
                    Color(.quaternarySystemFill)
                        .frame(width: 100, height: 100, alignment: .center)
                        .cornerRadius(20)
                    
                    ActivityIndicator($animating, style: .large)
                }
        }
    }
}

struct ActivitySquare_Previews: PreviewProvider {
    static var previews: some View {
        ActivitySquare(.constant(true))
            .previewLayout(.sizeThatFits)
    }
}
