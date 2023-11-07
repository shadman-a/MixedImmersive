//
//  RentalProperty.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/26/23.
//

import Foundation

struct RentalProperty: Decodable, Identifiable {
    let id = UUID()
    let openHours: String?
    let price: String
    let bedrooms: String
    let bathrooms: String
    let space: String
    let address: String
    let moveInDate: String
    let description: String
    let listingBy: String
    let imageUrl: String
}
