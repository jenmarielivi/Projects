//
//  football_api_swiftUIApp.swift
//  football_api_swiftUI
//
//  Created by Consultant on 8/20/22.
//

import SwiftUI

@main
struct football_api_swiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(FootballListVM: FootballViewModel())
        }
    }
}
