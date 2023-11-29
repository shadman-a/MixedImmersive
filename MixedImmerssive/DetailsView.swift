//
//  DetailsView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/26/23.
//

import SwiftUI
import RealityKit
//import RealityKitContent

struct DetailsView: View {
    
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    
    var listing: Listing
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: listing.imageUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 250)
                .clipped()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(listing.price)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(listing.address)
                        .font(.headline)
                    
                    HStack {
                        Text("Bedrooms: \(listing.bedrooms)")
                        Spacer()
                        Text("Bathrooms: \(listing.bathrooms)")
                    }
                    .font(.subheadline)
                    
                    HStack {
                        Text("Space: \(listing.space)")
                        Spacer()
                        Text("Move in: \(listing.moveInDate)")
                    }
                    .font(.subheadline)
                    
                    Text(listing.description)
                        .padding(.top, 8)
                    
                    Text(listing.listingBy)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.top, 8)
                    
                    Text(listing.usdzFileURL?.absoluteString ?? "N/A")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.top, 4)
                }
                .padding(.horizontal)
                
                Button(action: {
                    // Action for lease button
                    print("Lease button tapped!")
                }) {
                    Text("Lease")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                
                Toggle("Show Immersive Space", isOn: $showImmersiveSpace)
                    .toggleStyle(.button)
                    .padding(.top, 50)
            }
            .padding()
            .onChange(of: showImmersiveSpace) { _, newValue in
                Task {
                    if newValue {
                        switch await openImmersiveSpace(id: "ImmersiveSpace") {
                        case .opened:
                            immersiveSpaceIsShown = true
                        case .error, .userCancelled:
                            fallthrough
                        @unknown default:
                            immersiveSpaceIsShown = false
                            showImmersiveSpace = false
                        }
                    } else if immersiveSpaceIsShown {
                        await dismissImmersiveSpace()
                        immersiveSpaceIsShown = false
                    }
                }
            }
            
            
            
        } .navigationBarTitle("Details", displayMode: .inline)
        
    }
}



//#Preview {
//    DetailsView()
//}
