//
//  SFWebViewControllerRepresentable.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 9/6/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI
import SafariServices

struct SFWebViewController: UIViewControllerRepresentable {
    private(set) var url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let vc = SFSafariViewController(url: url)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        uiViewController.loadViewIfNeeded()
    }
}

struct SFWebViewControllerRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        SFWebViewController(url: URL(string: "https://www.reflector-online.com/")!)
    }
}
