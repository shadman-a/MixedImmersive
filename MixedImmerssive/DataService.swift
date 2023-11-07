//
//  DataService.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/26/23.
//

import Foundation

class DataService {
    static func fetchRentalProperties(completion: @escaping ([RentalProperty]?) -> Void) {
        let url = URL(string: "https://shadman-a.github.io/dbjson/db.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let rentalProperties = try decoder.decode([RentalProperty].self, from: data)
                completion(rentalProperties)
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}

