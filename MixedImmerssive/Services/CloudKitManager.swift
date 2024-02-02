//
//  CloudKitManager.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 11/26/23.
//

import CloudKit

class CloudKitManager {
    static let shared = CloudKitManager()
//    private let database = CKContainer.default().publicCloudDatabase
//
    private init() {}

    func fetchListings(completion: @escaping ([Listing]) -> Void) {
        let container = CKContainer(identifier: "iCloud.com.example.apple-samplecode.RoomPlanExampleAppU2W5XN7UV6")
        let publicDatabase = container.publicCloudDatabase
        let query = CKQuery(recordType: "FloorPlans", predicate: NSPredicate(value: true))

        publicDatabase.perform(query, inZoneWith: nil) { (records, error) in
            if let error = error {
                print(error)
                completion([])
                return
            }

            let listings = records?.map { record -> Listing in
                var listing = Listing(
                    id: record.recordID.recordName,
                    address: record["address"] as? String ?? "",
                    bathrooms: record["bathrooms"] as? String ?? "",
                    bedrooms: record["bedrooms"] as? String ?? "",
                    description: record["description"] as? String ?? "",
                    imageUrl: record["imageUrl"] as? String ?? "",
                    listingBy: record["listingBy"] as? String ?? "",
                    moveInDate: record["moveInDate"] as? Date ?? Date(),
                    price: record["price"] as? String ?? "",
                    space: record["space"] as? String ?? "",
                    longitude: record["longitude"] as? Double ?? 0.0, 
                    latitude: record["latitude"] as? Double ?? 0.0
                )

                if let usdzAsset = record["file"] as? CKAsset, let fileURL = usdzAsset.fileURL {
                    if let newURL = self.renameAndCopyFile(originalURL: fileURL) {
                                    listing.usdzFileURL = newURL
                                } else {
                                    print("Failed to copy and rename the USDZ file")
                                }
                            }
                return listing
            } ?? []

            DispatchQueue.main.async {
                completion(listings)
            }
        }
    }
    
    func renameAndCopyFile(originalURL: URL) -> URL? {
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let newURL = documentsDirectory.appendingPathComponent(originalURL.lastPathComponent).appendingPathExtension("usdz")

        do {
            if fileManager.fileExists(atPath: newURL.path) {
                try fileManager.removeItem(at: newURL)
            }
            try fileManager.copyItem(at: originalURL, to: newURL)
            return newURL
        } catch {
            print("Error renaming and copying file: \(error)")
            return nil
        }
    }


}
