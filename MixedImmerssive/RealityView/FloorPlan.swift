//
//  FloorPlan.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 11/21/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct FloorPlan: View {
    var axCustomActionHandler: ((_: AccessibilityEvents.CustomAction) -> Void)? = nil
    
    
    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let scene = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(scene)
            }
            if let axCustomActionHandler {
                _ = content.subscribe(
                    to: AccessibilityEvents.CustomAction.self,
                    on: nil,
                    componentType: nil,
                    axCustomActionHandler)
            }

            // Store for later updates.
        }            
    }
}

#Preview {
    FloorPlan()
}
