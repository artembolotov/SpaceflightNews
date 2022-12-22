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
    
    private static let fetchLimit = 50
    
    private var fetchOffsets = [NewsSite: Int]()
    private var canFetchMore = [NewsSite: Bool]()
    private(set) var lastIds = [NewsSite: [Int]]()
    
    func getLastIds(forSource source: NewsSite) -> [Int] {
        return lastIds[source] ?? []
    }
    
    @Published var articles = [NewsSite: [Article]]()
    @Published var source = NewsSite.spaceNews {
        didSet {
            if (articles[source] ?? []).isEmpty {
                fetchNews()
            }
        }
    }
    @Published private(set) var isFetching = [NewsSite: Bool]()
    
    init() {
        fetchNews()
    }
    
    func fetchNews() {
        guard !(isFetching[source] ?? false) && (canFetchMore[source] ?? true) else { return }
        
        let source = self.source
        isFetching[source] = true
        let offset = fetchOffsets[source] ?? 0
        
        NewsNetwork.ArticleAPI.articlesGet(limit: ModelData.fetchLimit, newsSite: source, start: offset) { data, error in
            self.isFetching[source] = false
            
            if let error = error {
                debugPrint(error)
            }
            
            if let data = data {
                let count = data.count
                
                self.canFetchMore[source] = count == ModelData.fetchLimit
                self.fetchOffsets[source] = (self.fetchOffsets[source] ?? 0) + count
 
                if self.articles[source]?.append(contentsOf: data) == nil {
                    self.articles[source] = data
                }
                
                self.lastIds[source] = data.suffix(10).map { $0.id }
            }
        }
    }
    
    static var testArticle: Article {
        Article(id: 17663, featured: false, title: "L3Harris to acquire Aerojet Rocketdyne for $4.7 billion", url: "https://spacenews.com/l3harris-to-acquire-aerojet-rocketdyne-for-4-7-billion/", imageUrl: "https://spacenews.com/wp-content/uploads/2015/11/RS-25-engines-factory.jpg", newsSite: "SpaceNews", summary: "L3Harris Technologies on Dec. 18 announced an agreement to acquire Aerojet Rocketdyne for $4.7 billion.", publishedAt: "2022-12-18T23:11:46.000Z")
    }
}
