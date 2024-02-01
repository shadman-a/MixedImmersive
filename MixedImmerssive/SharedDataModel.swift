//
//  SharedDataModel.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 1/31/24.
//

import Foundation

class SharedDataModel: ObservableObject {
    @Published var sharedValue: URL?
    
    init() {
            self.sharedValue = URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/pancakes/pancakes.usdz")!
        }
    
}
