//
//  ARView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 11/14/23.
//

#if targetEnvironment(simulator)
import ARKit
#else
@preconcurrency import ARKit
#endif
import SwiftUI

@MainActor
class ARModel: ObservableObject, @unchecked Sendable {
   
}

#Preview {
    ARView()
}
