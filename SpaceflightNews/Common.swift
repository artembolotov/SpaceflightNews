//
//  Common.swift
//  SpaceflightNews
//
//  Created by artembolotov on 22.12.2022.
//

import Foundation
import SwiftUI
import NewsNetwork

extension RandomAccessCollection where Element: Identifiable {
    public func inLastItems<Item: Identifiable>(_ item: Item) -> Bool {
        guard !isEmpty else { return false }
        guard let itemIndex = firstIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) }) else { return false }
        
        let distance = distance(from: itemIndex, to: endIndex)
        
        return distance <= 10
    }
}

extension Article: Identifiable {}

struct WithProgressBar: ViewModifier {
    let withLoading: Bool
    
    func body(content: Content) -> some View {
        if withLoading {
            VStack {
                content
                ProgressView()
            }
        } else {
            content
        }
    }
}
