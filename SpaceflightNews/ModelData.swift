//
//  ModelData.swift
//  SpaceflightNews
//
//  Created by artembolotov on 19.12.2022.
//

import Foundation
import Combine
import NewsNetwork

final class ModelData: ObservableObject {
    
    private let fetchLimit = 50
    private var fetchOffsets = [NewsSite: Int]()
    
    @Published var articles = [NewsSite: [Article]]()
    @Published var source = NewsSite.spaceNews {
        didSet {
            if (articles[source] ?? []).isEmpty {
                fetchNews(sourse: source)
            }
        }
    }
    
    init() {
        fetchNews(sourse: source)
    }
    
    private func fetchNews(sourse: NewsSite) {
        NewsNetwork.ArticleAPI.articlesGet(limit: fetchLimit, newsSite: sourse) { data, error in
            if let error = error {
                debugPrint(error)
            }
            if let data = data {
                self.articles[sourse] = data
            }
        }
    }
    
    static var testArticle: Article {
        Article(id: 17663, featured: false, title: "L3Harris to acquire Aerojet Rocketdyne for $4.7 billion", url: "https://spacenews.com/l3harris-to-acquire-aerojet-rocketdyne-for-4-7-billion/", imageUrl: "https://spacenews.com/wp-content/uploads/2015/11/RS-25-engines-factory.jpg", newsSite: "SpaceNews", summary: "L3Harris Technologies on Dec. 18 announced an agreement to acquire Aerojet Rocketdyne for $4.7 billion.", publishedAt: "2022-12-18T23:11:46.000Z")
    }
}
