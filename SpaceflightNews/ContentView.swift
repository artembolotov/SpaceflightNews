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
    private let sources = [NewsSite.spaceNews, .arstechnica, .cnbs, .nasa]
    
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
                    ForEach(modelData.articles[modelData.source] ?? [], id: \.id) { article in
                        NavigationLink {
                            ArticleDetail(article: article)
                        } label: {
                            ArticleCell(article: article)
                        }
                    }
                }
                .listStyle(.plain)
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
