//
//  ContentView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/19/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        
        TabView {
            // Tab 1
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            // Tab 2
            AccountView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Account")
                }
            
            
        }
        
        
        
        
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
