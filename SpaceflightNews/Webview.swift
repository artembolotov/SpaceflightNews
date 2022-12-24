//
//  Webview.swift
//  SpaceflightNews
//
//  Created by artembolotov on 22.12.2022.
//

import Foundation
import SwiftUI
import WebKit
import UIKit

struct WebView: UIViewRepresentable {
    
    var url: String?
    
    func makeUIView(context: Context) -> WKWebView {
        let preferences = WKPreferences()
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        let webView = WKWebView(frame: .zero, configuration: configuration)
        
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        if let urlValue = url, let requestURL = URL(string: urlValue) {
            webView.load(URLRequest(url: requestURL))
        }
    }
}
