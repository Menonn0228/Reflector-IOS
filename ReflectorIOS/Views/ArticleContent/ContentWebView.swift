//
//  ContentWebView.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 10/22/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI
import WebKit

/// A webview with a custom delegation to remove excess elements from a
/// Refelector article content page.
struct ContentWebView: UIViewRepresentable {
    
    private(set) var urlString: String?
    var viewDelegate: WKNavigationDelegate? = ContentWebViewDelegate()
    
    private let webViewConfig: WKWebViewConfiguration = {
        let preferences = WKPreferences()
        var config = WKWebViewConfiguration()
        config.preferences = preferences
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

// MARK: - Loading URL

extension ContentWebView {
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

class ContentWebViewDelegate: NSObject, WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, preferences: WKWebpagePreferences, decisionHandler: @escaping (WKNavigationActionPolicy, WKWebpagePreferences) -> Void) {
        if #available(iOS 14.0, *) {
            preferences.allowsContentJavaScript = false
        }
        
        preferences.preferredContentMode = .mobile
        decisionHandler(.allow, preferences)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let navbarElementID = "site-navbar-container"
        let advertisementID = "tncms-region-global-container-top"
        let bottomContentID = "tncms-region-article_side_top"
        let tagsID = "asset-below"
        let footerID = "site-footer-container"
        let socialShareLinkID = "social-share-links hidden-print list-inline icon"
        
        let removeElementIdScript = """
                                    var element = document.getElementById('\(navbarElementID)');
                                    element.parentElement.removeChild(element);

                                     var element = document.getElementById('\(advertisementID)');
                                     element.parentElement.removeChild(element);

                                     var element = document.getElementById('\(tagsID)');
                                     element.parentElement.removeChild(element);

                                     var element = document.getElementById('\(bottomContentID)');
                                     element.parentElement.parentElement.remove()

                                     var element = document.getElementById('\(footerID)');
                                     element.parentElement.removeChild(element);

                                    var elements = document.getElementsByClassName(\"\(socialShareLinkID)\")

                                    while(elements.length > 0) {
                                         elements[0].parentNode.removeChild(elements[0]);
                                     }
                                    """
        
        webView.evaluateJavaScript(removeElementIdScript) { _, _ in }
    }
}
