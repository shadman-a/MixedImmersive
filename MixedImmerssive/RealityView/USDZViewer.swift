//
//  USDZViewer.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 1/28/24.
//

import SwiftUI
import RealityKit

struct Model3DView: View {
    
    @EnvironmentObject var dataModel: SharedDataModel
    
    @Binding var rotationAngle: Angle
    @Binding var topDownView: Bool

    
    var body: some View {
        Model3D(url: dataModel.sharedValue!) { model in
            model
                .resizable()
                .aspectRatio(contentMode: .fit)
                
        } placeholder: {
            ProgressView()
        }
        .rotation3DEffect(topDownView ? .degrees(120) : rotationAngle, axis: (x: 0, y: 1, z: 0))
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            rotationAngle = Angle(degrees: Double(value.translation.width))
                        }
                )
                .animation(.easeInOut, value: rotationAngle)
    }
    
}

