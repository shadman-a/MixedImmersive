//
//  ARView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/27/23.
//

//import SwiftUI
//import RealityKit
//import ARKit
//
//struct ARViewContainer: UIViewRepresentable {
//    let arView = ARView(frame: .zero)
//    
//    func makeUIView(context: Context) -> ARView {
//        return arView
//    }
//    
//    func updateUIView(_ uiView: ARView, context: Context) {}
//    
//    func loadUSDZModel(named modelName: String) {
//        let modelURL = Bundle.main.url(forResource: modelName, withExtension: "usdz")!
//        let modelEntity = try! ModelEntity.load(contentsOf: modelURL)
//        let anchorEntity = AnchorEntity()
//        anchorEntity.addChild(modelEntity)
//        arView.scene.addAnchor(anchorEntity)
//    }
//}
//
//
//
//
//#Preview {
//    ARView()
//}
