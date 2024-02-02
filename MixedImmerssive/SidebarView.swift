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
    @Published var searchText = ""

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
    @State var searchText = ""
    @ObservedObject var viewModel = ListingsViewModel()
    
    @State private var isLinkActive = true
    
    var filteredListings: [Listing] {
            if searchText.isEmpty {
                return viewModel.listings
            } else {
                return viewModel.listings.filter { listing in
                    // Replace `listingProperty` with the actual property you want to filter by
                    listing.address.lowercased().contains(searchText.lowercased())
                }
            }
        }
    
    
    var body: some View {
        NavigationView {
            List {
//                Text("Search for something...")
//                             .searchable(text: $searchText, prompt: "Search")
                         
                // Navigation Link for showing all listings
                NavigationLink(destination: allListingsView, isActive: $isLinkActive ) {
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
            .searchable(text: $searchText, prompt: "Search")
        }
    }
    
    // Extracted view for All Listings
    private var allListingsView: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 300))], alignment: .center, spacing: 25) {
                ForEach(filteredListings) { listing in
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
