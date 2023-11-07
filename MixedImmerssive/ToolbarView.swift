//
//  ToolbarView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/24/23.
//

import SwiftUI

struct ToolbarView: View {
    @Binding var isEditing: Bool
    
    @State private var searchText = ""


    var body: some View {
        HStack {
            Button(action: {
                print("Add tapped")
            }) {
                Image(systemName: "plus")
                    .padding()
            }
            
            Spacer() // creates space between items
            SearchBarView(text: $searchText, placeholder: "Search")
            Button(action: {
                print("Save tapped")
            }) {
                Image(systemName: "square.and.arrow.down")
                    .padding()
            }
            
            Spacer().frame(width: 16) // creates a fixed-width space

            Button(action: {
                isEditing.toggle()
            }) {
                Image(systemName: isEditing ? "map" : "list.dash")
                    .padding()
            }
        }
        .padding(.horizontal)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
    }
}


