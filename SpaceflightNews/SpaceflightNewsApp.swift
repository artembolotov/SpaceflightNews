//
//  SpaceflightNewsApp.swift
//  SpaceflightNews
//
//  Created by artembolotov on 18.12.2022.
//

import SwiftUI

@main
struct SpaceflightNewsApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            NavigationViewController(transition: .custom(.move(edge: .top).combined(with: .scale), .scale)) {
                NewsScreen()
            }
            .environmentObject(modelData)
        }
    }
}
