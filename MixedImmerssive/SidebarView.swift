//
//  SidebarView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/24/23.
//

import SwiftUI

struct SidebarView: View {
    
    let repeatCount = 10
    
    private var gridItemLayout = [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]

    
    var body: some View {
            NavigationView {
                List {
                    NavigationLink("Show All", destination: ScrollView {
                        LazyVGrid(columns: gridItemLayout, alignment: .center, spacing: 10)  {
                            ForEach(0..<repeatCount, id: \.self) { index in
                                CardView()
                            }
                        }
                    }, isActive:.constant(true))
                    Menu {
                                        Button("Option A", action: { print("Option A selected") })
                                        Button("Option B", action: { print("Option B selected") })
                                    } label: {
                                        NavigationLink("Item 1", destination: Text("Detail for Item 1"))
                                    }
                    NavigationLink("Bathrooms", destination: Text("Detail for Item 3"))
                }
                .listStyle(SidebarListStyle()) // This applies the sidebar styling
                .navigationTitle("Sidebar Items")
                
                Text("Select an item from the sidebar")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
}

#Preview {
    SidebarView()
}
