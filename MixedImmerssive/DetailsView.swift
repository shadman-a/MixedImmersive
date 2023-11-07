//
//  DetailsView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/26/23.
//

import SwiftUI

struct DetailsView: View {
    
    var rentalProperty: RentalProperty
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: rentalProperty.imageUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 250)
                .clipped()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(rentalProperty.price)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(rentalProperty.address)
                        .font(.headline)
                    
                    HStack {
                        Text("Bedrooms: \(rentalProperty.bedrooms)")
                        Spacer()
                        Text("Bathrooms: \(rentalProperty.bathrooms)")
                    }
                    .font(.subheadline)
                    
                    HStack {
                        Text("Space: \(rentalProperty.space)")
                        Spacer()
                        Text("Move in: \(rentalProperty.moveInDate)")
                    }
                    .font(.subheadline)
                    
                    Text(rentalProperty.description)
                        .padding(.top, 8)
                    
                    Text(rentalProperty.listingBy)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.top, 8)
                    
                    Text(rentalProperty.openHours ?? "")
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
                
//                ARViewContainer()
//                                    .edgesIgnoringSafeArea(.all)
//                NavigationLink("Open AR Experience", destination: ARViewContainer())
//                }
//                .padding(.horizontal)
//                .padding(.top, 20)
            }
        }
//        .navigationBarTitle("Details", displayMode: .inline)
    }
}


//#Preview {
//    DetailsView()
//}
