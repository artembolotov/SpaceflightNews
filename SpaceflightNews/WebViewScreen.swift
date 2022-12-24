//
//  WebViewScreen.swift
//  SpaceflightNews
//
//  Created by artembolotov on 22.12.2022.
//

import SwiftUI

struct WebViewScreen: View {
    
    @EnvironmentObject private var nav: NavigationViewModel
    
    var url: String?
    var body: some View {
        NavigationView {
            ZStack {
                WebView(url: url)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        nav.pop()
                    } label: {
                        Image(systemName: "arrow.uturn.backward.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        nav.pop(destination: .popToRoot)
                    } label: {
                        Image(systemName: "arrow.backward.to.line.circle")
                    }
                }
            }
        }
    }
}

struct WebViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        WebViewScreen(url: ModelData.testArticle.url)
    }
}
