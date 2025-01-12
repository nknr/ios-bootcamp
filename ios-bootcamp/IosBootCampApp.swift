//
//  ios_bootcampApp.swift
//  ios-bootcamp
//
//  Created by Neeraj Kumar on 12/01/25.
//

import SwiftUI

@main
struct IosBootCampApp: App {
    @StateObject var router: Router = Router()
    
    init() {
        
    }
    
    var body: some Scene {
        WindowGroup {
            AppContentView()
                .environmentObject(self.router)
        }
    }
}
