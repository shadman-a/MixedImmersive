//
//  MapView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/24/23.
//

import SwiftUI
import CloudKit
import QuickLook
import UIKit

//struct Listing: Identifiable {
//    var id: String
//    var address: String
//    var bathrooms: String
//    var bedrooms: String
//    var description: String
//    var imageUrl: String
//    var listingBy: String
//    var moveInDate: Date
//    var price: String
//    var space: String
//    var usdzFileURL: URL? // URL to the local usdz file
//}


struct USDZViewer: UIViewControllerRepresentable {
    var url: URL

    func makeUIViewController(context: Context) -> QLPreviewController {
        let previewController = QLPreviewController()
        previewController.dataSource = context.coordinator
        return previewController
    }

    func updateUIViewController(_ uiViewController: QLPreviewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, QLPreviewControllerDataSource {
        var parent: USDZViewer

        init(_ parent: USDZViewer) {
            self.parent = parent
        }

        func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return 1
        }

        func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            return parent.url as QLPreviewItem
        }
    }
}



struct MapView: View {
    
    func fetchListings(completion: @escaping ([Listing]) -> Void) {
        let container = CKContainer(identifier: "iCloud.com.example.apple-samplecode.RoomPlanExampleAppU2W5XN7UV6") // Change to your container ID
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
                    space: record["space"] as? String ?? ""
                )

                if let usdzAsset = record["file"] as? CKAsset, let fileURL = usdzAsset.fileURL {
                    listing.usdzFileURL = fileURL
                }

                return listing
            } ?? []

            DispatchQueue.main.async {
                completion(listings)
            }
        }
    }


    @State private var listings = [Listing]()
       @State private var selectedUSDZURL: URL?
       @State private var showUSDZViewer = false
   

       var body: some View {
           List(listings) { listing in
               VStack(alignment: .leading) {
                   Text(listing.address).font(.headline)
                   Text("Bedrooms: \(listing.bedrooms), Bathrooms: \(listing.bathrooms)")
                   Text("Price: \(listing.price)")
                   Text("USDZ File: \(listing.usdzFileURL?.absoluteString ?? "N/A")")
                   // ... other details ...
                   if let usdzURL = listing.usdzFileURL {
                       Button("View 3D Model") {
                           self.selectedUSDZURL = usdzURL
                           self.showUSDZViewer = true
                       }
                   }
               }
           }
           .onAppear {
               fetchListings { fetchedListings in
                   self.listings = fetchedListings
               }
           }
           .sheet(isPresented: $showUSDZViewer) {
               if let url = selectedUSDZURL {
                   USDZViewer(url: url)
               }
           }
       }
}

#Preview {
    MapView()
}
