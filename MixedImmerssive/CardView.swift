//
//  CardView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/24/23.
//

import SwiftUI

struct CardView: View {
    
    @State private var animate = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            AsyncImage(url: URL(string: "https://images.pexels.com/photos/439391/pexels-photo-439391.jpeg")){ phase in
                switch phase {
                case .empty:
                    // Placeholder view or loading indicator
                    ProgressView()
                case .success(let image):
                    // The loaded image
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(10)
                case .failure:
                    // Error view
                    Text("Failed to load image")
                @unknown default:
                    // Handle other states
                    EmptyView()
                }
            }
            
            Text("Open: Sun. 12-1:30pm")
                .font(.subheadline)
//                .foregroundColor(.gray)
            
            Text("$1,495,000")
                .font(.title)
                .fontWeight(.bold)
            
            Text("2 bds | 1 ba | 1,704 sqft - Condo for sale")
                .font(.subheadline)
//                .foregroundColor(.gray)
            
            Text("98 Havemeyer St, Brooklyn, NY 11211")
                .font(.subheadline)
            
            Text("LISTING BY: NEST SEEKERS INTERNATIONAL")
                .font(.footnote)
//                .foregroundColor(.gray)
                .padding(.top, 5)
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .shadow(radius: 5)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
