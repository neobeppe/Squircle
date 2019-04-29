//
//  UIView+Squircle.swift
//  Squircle
//
//  Created by Giuseppe Travasoni on 10/04/18.
//

import UIKit
import QuartzCore

extension UIView {
    
    /**
     Apply squircle corner radius.
     */
    public func squircle() {
        self.layer.applySquircle()
    }
    
    /**
     Apply squircle corner radius and a border.
     */
    public func squircleWithBorder(width: CGFloat = 1, color: UIColor = UIColor.init(white: 0.9, alpha: 1.0)) {
        self.layer.applySquircleWithBorder(width: width, color: color)
    }
    
    /**
     Remove squircle corner radius and border.
     */
    public func removeSquircle() {
        self.layer.removeSquircle()
    }
    
    /**
     Remove squircle border.
     */
    public func removeSquircleBorder() {
        self.layer.removeSquircleBorder()
    }
}

let squircleBorderName = "squircleBorder"

extension CALayer {
    
    /**
     Apply a squircle mask corner radius.
     */
    public func applySquircle() {
        let maskLayer = CAShapeLayer()
        maskLayer.path = squirclePath.cgPath
        self.mask = maskLayer
    }
    
    /**
     Apply a squircle mask corner radius and a border.
     */
    public func applySquircleWithBorder(width: CGFloat, color: UIColor) {
        applySquircle()
        let borderLayer = CAShapeLayer()
        borderLayer.name = squircleBorderName
        borderLayer.path = squirclePath.cgPath
        borderLayer.lineWidth = width
        borderLayer.strokeColor = color.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.frame = self.bounds
        self.addSublayer(borderLayer)
    }
    
    /**
     Remove the squircle mask corner radius and border.
     */
    public func removeSquircle() {
        removeSquircleBorder()
        self.mask?.removeFromSuperlayer()
    }
    
    /**
     Remove the squircle border.
     */
    public func removeSquircleBorder() {
        self.sublayers?
            .filter { layer in return layer.name == squircleBorderName }
            .forEach { layer in
                layer.removeFromSuperlayer()
        }
    }
    
}
