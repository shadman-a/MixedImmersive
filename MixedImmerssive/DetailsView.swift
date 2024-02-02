//
//  DetailsView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/26/23.
//

import SwiftUI
import RealityKit

struct DetailsView: View {
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = true
    @State private var showModel = false
    
    @EnvironmentObject var dataModel: SharedDataModel


    @Environment(\.openWindow) var openWindow
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
                        .onAppear{
                            dataModel.sharedValue = listing.usdzFileURL!
                        }
                    
                }
                .padding(.horizontal)
                Button {
                    print(dataModel.sharedValue!)
                    openWindow(id: "ImmersiveSpace")
                } label: {
                    Text("Open 3D FloorPlan")
                        .font(.title)
                }
                
                .padding()
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
            }
        }
        .navigationBarTitle("Details", displayMode: .inline)
    }
}

//struct DetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsView(listing: Listing.example) // Replace Listing.example with an actual Listing instance
//    }
//}
