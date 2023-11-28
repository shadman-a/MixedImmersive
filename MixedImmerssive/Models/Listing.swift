//
//  Listing.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 11/27/23.
//


import CloudKit

struct Listing: Identifiable {
    var id: String
    var address: String
    var bathrooms: String
    var bedrooms: String
    var description: String
    var imageUrl: String
    var listingBy: String
    var moveInDate: Date
    var price: String
    var space: String
    var usdzFileURL: URL? // URL to the local usdz file
}
