//
//  UIView+Squircle.swift
//  Squircle
//
//  Created by Giuseppe Travasoni on 10/04/18.
//

import UIKit

extension UIView {
    
    /**
     Apply squircle corner radius.
     - parameters:
     - radius: Radius value to apply, if missing or greater than 4.7 times view's smaller side, view's smaller side will be used instead.
     */
    public func squircle(with radius: CGFloat? = nil) {
        let maskLayer = CAShapeLayer()
        maskLayer.path = squirclePath(with: radius).cgPath
        self.layer.mask = maskLayer
    }
    
    internal func squirclePath(with radius: CGFloat?) -> UIBezierPath {
        
        var squircleSide = min(bounds.width, bounds.height)
        
        if let radius = radius, radius * 4.7 < squircleSide {
            squircleSide = radius * 4.7
        } else {
            print("invalid radius: radious should be less then 4.7 times view minor side")
        }
        
        let innerSquare = CGRect(x: 0, y: 0, width: squircleSide, height: squircleSide)
        
        let horizontalTranslation = bounds.width - squircleSide
        let verticalTranslation = bounds.height - squircleSide
        
        let firstCornerStartPoint = CGPoint(x: innerSquare.minX, y: innerSquare.midY)
        let firstCornerPoint = CGPoint(x: innerSquare.minX, y: innerSquare.minY)
        let firstCornerEndPoint = CGPoint(x: innerSquare.midX, y: innerSquare.minY)
        
        let secondCornerStartPoint = CGPoint(x: innerSquare.midX + horizontalTranslation, y: innerSquare.minY)
        let secondCornerPoint = CGPoint(x: innerSquare.maxX + horizontalTranslation, y: innerSquare.minY)
        let secondCornerEndPoint = CGPoint(x: innerSquare.maxX + horizontalTranslation, y: innerSquare.midY)
        
        let thirdCornerStartPoint = CGPoint(x: innerSquare.maxX + horizontalTranslation, y: innerSquare.midY + verticalTranslation)
        let thirdCornerPoint = CGPoint(x: innerSquare.maxX + horizontalTranslation, y: innerSquare.maxY + verticalTranslation)
        let thirdCornerEndPoint = CGPoint(x: innerSquare.midX + horizontalTranslation, y: innerSquare.maxY + verticalTranslation)
        
        let fourthCornerStartPoint = CGPoint(x: innerSquare.midX, y: innerSquare.maxY + verticalTranslation)
        let fourthCornerPoint = CGPoint(x: innerSquare.minX, y: innerSquare.maxY + verticalTranslation)
        let fourthCornerEndPoint = CGPoint(x: innerSquare.minX, y: innerSquare.midY + verticalTranslation)
        
        let path = UIBezierPath()
        path.move(to: firstCornerStartPoint)
        path.addCurve(to: firstCornerEndPoint, controlPoint1: firstCornerPoint, controlPoint2: firstCornerPoint)
        path.addLine(to: secondCornerStartPoint)
        path.addCurve(to: secondCornerEndPoint, controlPoint1: secondCornerPoint, controlPoint2: secondCornerPoint)
        path.addLine(to: thirdCornerStartPoint)
        path.addCurve(to: thirdCornerEndPoint, controlPoint1: thirdCornerPoint, controlPoint2: thirdCornerPoint)
        path.addLine(to: fourthCornerStartPoint)
        path.addCurve(to: fourthCornerEndPoint, controlPoint1: fourthCornerPoint, controlPoint2: fourthCornerPoint)
        path.addLine(to: firstCornerStartPoint)
        
        return path
    }
}
