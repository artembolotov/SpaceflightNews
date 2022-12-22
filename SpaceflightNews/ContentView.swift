//
//  ContentView.swift
//  SpaceflightNews
//
//  Created by artembolotov on 18.12.2022.
//

import SwiftUI
import NewsNetwork

struct ContentView: View {
    
    @EnvironmentObject var modelData: ModelData
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
                    
                    ForEach(modelData.articles[source] ?? []) { article in
                        NavigationLink {
                            ArticleDetail(article: article)
                        } label: {
                            ArticleCell(article: article)
                        }
                        .onAppear {
                            let lastIds = modelData.getLastIds(forSource: source)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
