//
//  WebView.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 10/22/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    private(set) var urlString: String?
    private let viewDelegate = WebViewDelegate()
    
    private let webViewConfig: WKWebViewConfiguration = {
        let config = WKWebViewConfiguration()
        return config
    }()
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView(frame: .zero, configuration: webViewConfig)
        webView.navigationDelegate = viewDelegate
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        load(urlString, forWebView: uiView)
    }
}

extension WebView {
    private func parseURLRequest() -> URLRequest {
        guard let urlString = urlString,
              let url = URL(string: urlString) else {
            fatalError("WebView.parseURLRequest(): Could not set urlString to type URL")
        }
        
        return URLRequest(url: url)
    }
    
    private func load(_ urlString: String?, forWebView webView: WKWebView) {
        guard let urlString = urlString,
              let url = URL(string: urlString) else { return }
        
        webView.load(URLRequest(url: url))
    }
}

// MARK: - Delegate

class WebViewDelegate: NSObject, WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let navbarElementID = "site-navbar-container"
        let advertisementID = "tncms-region-global-container-top"
        
        let removeElementIdScript = """
                                    var element = document.getElementById('\(navbarElementID)');
                                    element.parentElement.removeChild(element);

                                    var element = document.getElementById('\(advertisementID)');
                                    element.parentElement.removeChild(element);
                                    """
        
        webView.evaluateJavaScript(removeElementIdScript) { (response, error) in
            if let error = error {
                print(error)
            }
        }
    }
}