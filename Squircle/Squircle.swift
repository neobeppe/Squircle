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
    Apply squircle corner radius with a border.
     - parameters:
        - borderWidth: Border width
        - borderColor: Border color
     */
    public func squircleWithBorder(width: CGFloat, color: UIColor) {
        self.layer.applySquircleWithBorder(width: width, color: color)
    }
}

extension CALayer {
    
    /**
     Apply squircle corner radius.
     */
    public func applySquircle() {
        let maskLayer = CAShapeLayer()
        maskLayer.path = squirclePath.cgPath
        self.mask = maskLayer
    }
    
    /**
     Apply squircle corner radius with a border.
     - parameters:
        - borderWidth: Border width
        - borderColor: Border color
     */
    public func applySquircleWithBorder(width: CGFloat, color: UIColor) {
        applySquircle()
        let borderLayer = CAShapeLayer()
        borderLayer.path = squirclePath.cgPath
        borderLayer.lineWidth = width
        borderLayer.strokeColor = color.cgColor
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.frame = self.bounds
        self.addSublayer(borderLayer)
    }
}


/*
 
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
 - parameters:
 - borderWidth: test
 - borderColor: as
 */
 public func squircle() {
 self.layer.applySquircle()
 }
 
 /**
 Apply squircle corner radius and a border.
 */
 public func squircleWithBorder(width: CGFloat, color: UIColor) {
 self.layer.applySquircleWithBorder(width: width, color: color)
 }
 }
 
 extension CALayer {
 
 /**
 Apply a squircle mask corner radius.
 */
 public func applySquircle() {
 squircle()
 }
 
 /**
 Apply a squircle mask corner radius and a border.
 */
 public func applySquircleWithBorder(width: CGFloat, color: UIColor) {
 squircle(with: width, borderColor: color)
 }
 
 private func squircle(with borderWidth: CGFloat = 0, borderColor: UIColor? = nil) {
 let maskLayer = CAShapeLayer()
 maskLayer.path = squirclePath.cgPath
 maskLayer.borderWidth = borderWidth
 maskLayer.strokeColor = borderColor?.cgColor
 self.mask = maskLayer
 }
 }
 
 /*
 
 extension UIView {
 
 /**
 Apply squircle corner radius.
 - parameters:
 - borderWidth: Border width, default value is *0.0* and no border will be applied
 - borderColor: Optional border coloro, default value is *nil* and no border will be applied
 */
 public func squircle(with borderWidth: CGFloat = 0.0, borderColor: UIColor? = nil) {
 self.layer.applySquircle(with: borderWidth, borderColor: borderColor)
 }
 }
 
 extension CALayer {
 
 /**
 Apply a squircle mask corner radius.
 */
 public func applySquircle(with borderWidth: CGFloat = 0.0, borderColor: UIColor? = nil) {
 let maskLayer = CAShapeLayer()
 maskLayer.path = squirclePath.cgPath
 maskLayer.lineWidth = borderWidth
 maskLayer.strokeColor = borderColor?.cgColor
 self.mask = maskLayer
 }
 }
 
 */

 */
