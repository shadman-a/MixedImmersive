//
//  CustomUIView.swift
//  MixedImmerssive
//
//  Created by Shadman Ahmed on 10/29/23.
//

import SwiftUI

class CustomUIView: UIView {
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.text = "Hello from UIKit!"
        label.textAlignment = .center
        addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}

#Preview {
    CustomUIView()
}
