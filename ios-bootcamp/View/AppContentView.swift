//
//  AppContentView.swift
//  ios-bootcamp
//
//  Created by Neeraj Kumar on 12/01/25.
//

import SwiftUI

struct AppContentView: View {
    @EnvironmentObject var router: Router
    var body: some View {
        NavigationStack(path: $router.navPath) {
            Text("Hello")
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        router.navigate(to: .dashboard)
                    }
                }
                .navigationDestination(for: Destination.self) { destination in
                    switch destination {
                    case .dashboard:
                        DashboardView()
                    case .commonView:
                        CommonView()
                        
                    }
                }
        }
    }
}

