//
//  CardView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/24/23.
//

import SwiftUI

struct CardView: View {
    
    let property: RentalProperty
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            AsyncImage(url: URL(string: property.imageUrl)){ phase in
                switch phase {
                case .empty:
                    // Placeholder view or loading indicator
                    ProgressView()
                case .success(let image):
                    // The loaded image
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
//                        .scaledToFill()
                        .clipped()
                        .frame(height: 200)
                        .cornerRadius(10)
                case .failure:
                    // Error view
                    Text("Failed to load image")
                @unknown default:
                    // Handle other states
                    EmptyView()
                }
            }
            
            Text(property.openHours ?? "")
                .font(.subheadline)
//                .foregroundColor(.gray)
            
            Text(property.price)
                .font(.title)
                .fontWeight(.bold)
            
            Text("\(property.bedrooms) beds | \(property.bathrooms) baths | \(property.space)")
                .font(.subheadline)
//                .foregroundColor(.gray)
            
            Text(property.address)
                .font(.subheadline)
            
            Text(property.listingBy)
                .font(.footnote)
//                .foregroundColor(.gray)
                .padding(.top, 5)
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .shadow(radius: 5)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(property: RentalProperty(
                    openHours: "Open: Sun. 12-1:30pm",
                    price: "$4,500/mo",
                    bedrooms: "2",
                    bathrooms: "1",
                    space: "1,704 sqft",
                    address: "98 Havemeyer St, Brooklyn, NY 11211",
                    moveInDate: "2023-12-01",
                    description: "Spacious condo in a prime location, close to public transportation and amenities.",
                    listingBy: "LISTING BY: NEST SEEKERS INTERNATIONAL",
                    imageUrl: "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg"
                ))
    }
}
