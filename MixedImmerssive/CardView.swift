//
//  CardView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/24/23.
//

import SwiftUI
import CloudKit

struct CardView: View {
    let listing: Listing

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AsyncImage(url: URL(string: listing.imageUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        .frame(height: 200)
                        .cornerRadius(10)
                case .failure:
                    Text("Failed to load image")
                @unknown default:
                    EmptyView()
                }
            }
            
            Text(listing.moveInDate, style: .date)
                .font(.subheadline)
            
            Text(listing.price)
                .font(.title)
                .fontWeight(.bold)
            
            Text("\(listing.bedrooms) beds | \(listing.bathrooms) baths | \(listing.space)")
                .font(.subheadline)
            
            Text(listing.address)
                .font(.subheadline)
            
            Text(listing.listingBy)
                .font(.footnote)
                .padding(.top, 5)
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}



//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(listing: Listing)
//    }
//
//    static func mockRecord() -> CKRecord {
//        let record = CKRecord(recordType: "YourRecordType")
//        record["openHours"] = "Open: Sun. 12-1:30pm"
//        record["price"] = "$4,500/mo"
//        record["bedrooms"] = "2"
//        record["bathrooms"] = "1"
//        record["space"] = "1,704 sqft"
//        record["address"] = "98 Havemeyer St, Brooklyn, NY 11211"
//        record["moveInDate"] = Date() // Use an actual date
//        record["description"] = "Spacious condo in a prime location, close to public transportation and amenities."
//        record["listingBy"] = "LISTING BY: NEST SEEKERS INTERNATIONAL"
//        record["imageUrl"] = "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg"
//
//        return record
//    }
//}
