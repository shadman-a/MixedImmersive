//
//  HomeView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/24/23.
//

import SwiftUI






struct HomeView: View {
    
    
    private var gridItemLayout = [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]
    
    @State private var isEditing = false
    
    var body: some View {
        
        VStack {
            
            SidebarView()
            
            ToolbarView(isEditing: $isEditing)
            
            
        }
        
        
    }
}
