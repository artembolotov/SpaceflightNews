//
//  NavigationType.swift
//  SpaceflightNews
//
//  Created by artembolotov on 23.12.2022.
//

import Foundation

enum NavigationType {
    case push, pop
}

enum PopDestination {
    case prevPop, popToRoot
}
