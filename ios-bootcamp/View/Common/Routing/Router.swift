//
//  Router.swift
//  ios-bootcamp
//
//  Created by Neeraj Kumar on 12/01/25.
//

import Foundation
import SwiftUI

final class Router: ObservableObject {
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        Logger.i("navigate() destination: \(destination)")
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        if navPath.isEmpty {
            navPath.append(Destination.dashboard)
        } else {
            navPath.removeLast(navPath.count)
        }
    }
}
