//
//  UIButton+Extensions.swift
//  InstantBlog
//
//  Created by Daniel Akinniranye on 7/17/22.
//

import UIKit

extension UIButton {
    // Updating the layer properties: Shadow & Corner Radius
    func updateLayerProperties() {
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 1.0;
        self.layer.shadowRadius = 2.4;
    }
}
