//
//  File.swift
//  
//
//  Created by artembolotov on 19.12.2022.
//

import Foundation
public enum NewsSite: Int {
    case nasaspaceflight = 3
    case spaceflightNow = 7
    case spaceNews = 16
    case nasa = 19
    case arstechnica = 23
    case cnbs = 28
}

extension NewsSite {
    var name: String {
        switch self {
        case .nasaspaceflight: return "NASASpaceflight"
        case .spaceflightNow: return "Spaceflight Now"
        case .spaceNews: return "SpaceNews"
        case .nasa: return "NASA"
        case .arstechnica: return "Arstechnica"
        case .cnbs: return "CNBC"
        }
    }
}
