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
    @Published var articles = [Article]()
    
    init() {
        NewsNetwork.ArticleAPI.articlesGet(limit: 50) { data, error in
            if let error = error {
                debugPrint(error)
            }
            if let data = data {
                self.articles = data
                debugPrint(data)
            }
        }
    }
}
