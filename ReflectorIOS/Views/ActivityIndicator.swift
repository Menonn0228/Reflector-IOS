//
//  ActivityIndicator.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 11/10/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI

/// View Representable that represents `UIActivityIndicator`.
/// - sauce: https://www.youtube.com/watch?v=aP-GAAFjS6s
struct ActivityIndicator: UIViewRepresentable {
    
    /// `Bool` value determines if the view is visible.
    @Binding var animating: Bool
    
    /// Default value for style is set to `UIActivityIndicatorView.Style.medium`
    /// Can be set in the initializer.
    private(set) var style: UIActivityIndicatorView.Style
    
    init(_ isAnimating: Binding<Bool>, style: UIActivityIndicatorView.Style = .medium) {
        _animating = isAnimating
        self.style = style
    }
    
    // MARK: - UIViewRepresentable
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: style)
        return indicator
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        animating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
