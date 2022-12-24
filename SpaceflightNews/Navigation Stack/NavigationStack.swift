//
//  NavigationStack.swift
//  SpaceflightNews
//
//  Created by artembolotov on 24.12.2022.
//

import Foundation

struct NavigationStack {
    var screens: [Screen] = []
    
    func top() -> Screen? {
        screens.last
    }
    
    mutating func push(newScreen: Screen) {
        screens.append(newScreen)
    }
    
    mutating func popPrev() {
        screens.removeLast()
    }
    
    mutating func popToRoot() {
        screens.removeAll()
    }
    
}
