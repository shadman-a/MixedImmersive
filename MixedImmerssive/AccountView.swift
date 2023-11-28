//
//  AccountView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 11/13/23.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: MapView()) {
                    Text("Add a new Property")
                    Image(systemName: "plus.app")
                }
            }
            .navigationBarTitle("My Account")
        }
    }
}

#Preview {
    AccountView()
}
