//
//  SidebarView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/24/23.
//

import SwiftUI

struct SidebarView: View {
    
    let repeatCount = 10
    
    @State private var rentalProperties: [RentalProperty] = []
    
    
    private var gridItemLayout = [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]
    
    
    
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Show All", destination: ScrollView {
                    LazyVGrid(columns: gridItemLayout, alignment: .center, spacing: 10)  {
                        ForEach(rentalProperties) { property in
                            NavigationLink(destination: DetailsView(rentalProperty: property)) {
                                CardView(property: property)
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }}        .navigationBarTitle("All Homes in New York, NY", displayMode: .inline)
, isActive:.constant(true)).onAppear {
                        DataService.fetchRentalProperties { rentalProperties in
                            if let rentalProperties = rentalProperties {
                                DispatchQueue.main.async {
                                    self.rentalProperties = rentalProperties
                                }
                            }
                        }
                    }
                Menu {
                    Button("Option A", action: { print("Option A selected") })
                    Button("Option B", action: { print("Option B selected") })
                } label: {
                    NavigationLink("Item 1", destination: Text("Detail for Item 1"))
                }
                NavigationLink("Bathrooms", destination: Text("Detail for Item 3"))
            }
            .listStyle(SidebarListStyle()) // This applies the sidebar styling
            .navigationTitle("Filters")
            
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
