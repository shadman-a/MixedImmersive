//
//  ImmersiveView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/19/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    
//    @Environment(ViewModel.self) private var model
    @State var axRotateClockwise: Bool = false
    @State var axRotateCounterClockwise: Bool = false
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .controlPanelGuide, vertical: .bottom)) {
            FloorPlan() 
            FloorPlanControls()
        }
    }
}

extension HorizontalAlignment {
    /// A custom alignment to center the control panel under the globe.
    private struct ControlPanelAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.center]
        }
    }

    /// A custom alignment guide to center the control panel under the globe.
    static let controlPanelGuide = HorizontalAlignment(
        ControlPanelAlignment.self
    )
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
