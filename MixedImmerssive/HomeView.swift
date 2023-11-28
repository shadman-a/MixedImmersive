//
//  HomeView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/24/23.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isEditing = false
//    @ObservedObject var viewModel = ListingsViewModel()
    
    var body: some View {
        VStack {
            SidebarView()
//            List(viewModel.listings) { listing  in
//                CardView(listing: listing)
//            }
            ToolbarView(isEditing: $isEditing)
        }
    }
}
