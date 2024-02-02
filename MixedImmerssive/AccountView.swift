//
//  AccountView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 11/13/23.
//

import SwiftUI

struct AccountView: View {
    @State var searchText = ""
    @ObservedObject var viewModel = ListingsViewModel()
    
    @State private var isLinkActive = true
    
    var filteredListings: [Listing] {
        if searchText.isEmpty {
            return viewModel.listings
        } else {
            return viewModel.listings.filter { listing in
                listing.address.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: MapView(listings: filteredListings), isActive: $isLinkActive ) {
                    Text("Show All")
                }
                
                // Other Menu Items
                //                Menu {
                //                    Button("Option A", action: { print("Option A selected") })
                //                    Button("Option B", action: { print("Option B selected") })
                //                } label: {
                //                    Text("Item 1")
                //                }
                //
                //                NavigationLink("Bathrooms", destination: Text("Detail for Bathrooms"))
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Filters")
            .searchable(text: $searchText, prompt: "Search by Address")
        }
    }
}



#Preview {
    AccountView()
}
