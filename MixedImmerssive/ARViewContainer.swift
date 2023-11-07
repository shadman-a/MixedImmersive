//
//  ARViewContainer.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/29/23.
//

//import SwiftUI
//import RealityKit
//import ARKit
//
//struct ARViewContainer: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> UIViewController {
//        return ARViewController()
//    }
//    
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
//}
//
//class ARViewController: UIViewController {
//    private var arView: ARView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        arView = ARView(frame: .zero)
//        view.addSubview(arView)
//        
//        // Load the "box" scene from the "Experience" Reality File
//        let anchor = try! Experience.loadBox()
//        arView.scene.anchors.append(anchor)
//        
//        // Set up Auto Layout
//        arView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            arView.topAnchor.constraint(equalTo: view.topAnchor),
//            arView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            arView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            arView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//    }
//}
