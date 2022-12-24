//
//  Screen.swift
//  SpaceflightNews
//
//  Created by artembolotov on 24.12.2022.
//

import Foundation
import SwiftUI

struct Screen {
    let id: String
    let screenView: AnyView
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
