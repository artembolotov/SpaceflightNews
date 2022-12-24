//
//  NavigationViewModel.swift
//  SpaceflightNews
//
//  Created by artembolotov on 24.12.2022.
//

import Foundation
import SwiftUI

class NavigationViewModel: ObservableObject {
    @Published var currentScreen: Screen?
    
    var screensStack = NavigationStack() {
        didSet {
            currentScreen = screensStack.top()
        }
    }
    
    private let easing: Animation?
    var navigationType: NavigationType = .push
    
    init(easing: Animation) {
        self.easing = easing
    }
    
    func push<S: View>(newView: S) {
        withAnimation(easing) {
            navigationType = .push
            let screen = Screen(id: UUID().uuidString, screenView: AnyView(newView))
            screensStack.push(newScreen: screen)
        }
    }
    
    func pop(destination: PopDestination = .prevPop) {
        withAnimation(easing) {
            switch destination {
            case .prevPop:
                navigationType = .pop
                screensStack.popPrev()
            case .popToRoot:
                navigationType = .pop
                screensStack.popToRoot()
            }
        }
    }
}
