//
//  SidebarView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/24/23.
//

import SwiftUI
import CloudKit

class ListingsViewModel: ObservableObject {
    @Published var listings = [Listing]()
    
    init() {
        loadListings()
    }
    
    func loadListings() {
        CloudKitManager.shared.fetchListings { [weak self] fetchedListings in
            self?.listings = fetchedListings
        }
    }
}

struct SidebarView: View {
    @ObservedObject var viewModel = ListingsViewModel()
    private var gridItemLayout = [GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0), GridItem(.flexible(), spacing: 0)]

    var body: some View {
        NavigationView {
            List {
                // Navigation Link for showing all listings
                NavigationLink(destination: allListingsView) {
                    Text("Show All")
                }

                // Other Menu Items
                Menu {
                    Button("Option A", action: { print("Option A selected") })
                    Button("Option B", action: { print("Option B selected") })
                } label: {
                    Text("Item 1")
                }

                NavigationLink("Bathrooms", destination: Text("Detail for Bathrooms"))
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Filters")
        }
    }

    // Extracted view for All Listings
    private var allListingsView: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, alignment: .center, spacing: 10) {
                ForEach(viewModel.listings) { listing in
                    NavigationLink(destination: DetailsView(listing: listing)) {
                        CardView(listing: listing)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .navigationBarTitle("All Homes in New York, NY", displayMode: .inline)
        }
    }
}

                               
#Preview {
     SidebarView()
}
