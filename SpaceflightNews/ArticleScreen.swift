//
//  ArticleDetail.swift
//  SpaceflightNews
//
//  Created by artembolotov on 19.12.2022.
//

import SwiftUI
import NewsNetwork

struct ArticleScreen: View {
    @EnvironmentObject private var nav: NavigationViewModel
    
    var article: Article

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(article.title ?? "")
                        .font(.title)
                        .foregroundColor(.primary)
                    HStack {
                        Spacer()
                        Text(article.publishedAtPrettyDate ?? "")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                            .padding([.top, .bottom], 2)
                    }
                    Text(article.summary ?? "")
                        .font(.body)
                    if let url = article.imageUrl {
                        ImageView(withURL: url)
                    }
                    Spacer()
                }
                .padding()
            }
            .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            nav.pop()
                        } label: {
                            Image(systemName: "arrow.uturn.backward.circle")
                        }
                    }
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        nav.push(newView: WebViewScreen(url: article.url))
                    }
                    label: {
                        Text("Read on website")
                    }
                    .disabled(article.url == nil)
                }
            }
        }
        
    }
}

struct ArticleDetail_Previews: PreviewProvider {
    static var previews: some View {
        ArticleScreen(article: ModelData.testArticle)
    }
}
