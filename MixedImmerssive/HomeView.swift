//
//  HomeView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/24/23.
//

import SwiftUI
import RealityKit
import RealityKitContent





struct HomeView: View {
        
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    private var gridItemLayout = [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]
    
    @State private var isEditing = false
    
    var body: some View {
        
        VStack {
            
            SidebarView()
            
            ToolbarView(isEditing: $isEditing)
            
            //        VStack {
            //
            //            Toggle("Show Immersive Space", isOn: $showImmersiveSpace)
            //                .toggleStyle(.button)
            //                .padding(.top, 50)
            //        }
            //        .padding()
            //        .onChange(of: showImmersiveSpace) { _, newValue in
            //            Task {
            //                if newValue {
            //                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
            //                    case .opened:
            //                        immersiveSpaceIsShown = true
            //                    case .error, .userCancelled:
            //                        fallthrough
            //                    @unknown default:
            //                        immersiveSpaceIsShown = false
            //                        showImmersiveSpace = false
            //                    }
            //                } else if immersiveSpaceIsShown {
            //                    await dismissImmersiveSpace()
            //                    immersiveSpaceIsShown = false
            //                }
            //            }
            //        }
            
        }
        
        
    }
}
