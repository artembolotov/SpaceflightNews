//
//  NewsScreen.swift
//  SpaceflightNews
//
//  Created by artembolotov on 24.12.2022.
//

import SwiftUI
import NewsNetwork

struct NewsScreen: View {
    
    @EnvironmentObject var modelData: ModelData
    @EnvironmentObject private var nav: NavigationViewModel
    
    private let sources = [NewsSite.spaceNews, .arstechnica, .cnbс, .nasa]
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select news source", selection: $modelData.source) {
                    ForEach(sources, id: \.self) {
                        Text($0.name)
                    }
                }
                .pickerStyle(.segmented)
                .padding([.leading, .trailing])
                List {
                    let source = modelData.source
                    let lastIds = modelData.getLastIds(forSource: source)
                    
                    ForEach(modelData.articles[source] ?? []) { article in
                        Button {
                            nav.push(newView: ArticleScreen(article: article))
                        } label: {
                            ArticleCell(article: article)
                        }
                        .onAppear {
                            if lastIds.contains(article.id) {
                                modelData.fetchNews()
                            }
                        }
                    }
                    
                    if modelData.isFetching[source] ?? false {
                        HStack {
                            Spacer()
                            Text("Loading...")
                            ProgressView()
                            Spacer()
                        }
                    } else {
                        EmptyView()
                    }
                }
            }
            .navigationTitle("Spaceflight News")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NewsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreen()
    }
}
