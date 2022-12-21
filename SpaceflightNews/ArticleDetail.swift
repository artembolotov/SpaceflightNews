//
//  ArticleDetail.swift
//  SpaceflightNews
//
//  Created by artembolotov on 19.12.2022.
//

import SwiftUI
import NewsNetwork

struct ArticleDetail: View {
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
                .navigationTitle("")
            }
        }
    }
}

struct ArticleDetail_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetail(article: ModelData.testArticle)
    }
}
