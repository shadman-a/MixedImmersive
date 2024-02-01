//
//  MixedImmerssiveApp.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/19/23.
//

import SwiftUI

@main
struct MixedImmerssiveApp: App {
    let sharedDataModel = SharedDataModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(sharedDataModel)
        }

        WindowGroup(id: "ImmersiveSpace") {
            ImmersiveView()
                .environmentObject(sharedDataModel)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 1, height: 0.4, depth: 1, in: .meters)
    }
}
