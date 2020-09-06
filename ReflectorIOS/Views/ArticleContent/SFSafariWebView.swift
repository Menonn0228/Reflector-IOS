//
//  SFSafariWebView.swift
//  ReflectorIOS
//
//  Created by Nikhil Menon on 9/6/20.
//  Copyright © 2020 Nikhil Menon. All rights reserved.
//

import SwiftUI
import SafariServices

struct SFSafariWebView: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    private(set) var url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let vc = SFSafariViewController(url: url)
        vc.delegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        uiViewController.loadViewIfNeeded()
    }
}


// MARK: - Coordinator

extension SFSafariWebView {
    class Coordinator: NSObject, SFSafariViewControllerDelegate, UINavigationControllerDelegate { }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
}

struct SFSafariViewControllerRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        SFSafariWebView(url: URL(string: "https://www.reflector-online.com/")!)
    }
}
