//
//  WKArticleContentView.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 9/5/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI
import WebKit

struct WKView: UIViewRepresentable {
    
    private(set) var request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView {
        let wkConfig = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: wkConfig)
        webView.scrollView.bounces = false
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}
