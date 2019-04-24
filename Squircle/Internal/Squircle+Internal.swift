//
//  Squircle+Internal.swift
//  Squircle
//
//  Created by Giuseppe Travasoni on 24/04/2019.
//

import Foundation
import QuartzCore

extension CALayer {
    
    internal var squirclePath: UIBezierPath {
        
        let width = bounds.width
        let height = bounds.height
        let squircleSide = min(width, height)
        CGPoint.xDelta = abs(squircleSide - width)
        CGPoint.yDelta = abs(squircleSide - height)
        
        let checkpoints = Checkpoints(width: bounds.width, height: bounds.height)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: checkpoints.cornerDelta, y: 0))
        
        path.addLine(to: CGPoint(x: width-checkpoints.cornerDelta, y: 0))
        path.addCurve(to: CGPoint.xDeltaPoint(x: checkpoints.checkpoint0, y: squircleSide-checkpoints.checkpoint3),
                      controlPoint1: CGPoint.xDeltaPoint(x: checkpoints.checkpoint1, y: 0),
                      controlPoint2: CGPoint.xDeltaPoint(x: checkpoints.checkpoint2, y: 0))
        path.addCurve(to: CGPoint.xDeltaPoint(x: checkpoints.checkpoint3, y: squircleSide-checkpoints.checkpoint0),
                      controlPoint1: CGPoint.xDeltaPoint(x: checkpoints.checkpoint4, y: squircleSide-checkpoints.checkpoint5),
                      controlPoint2: CGPoint.xDeltaPoint(x: checkpoints.checkpoint5, y: squircleSide-checkpoints.checkpoint4))
        path.addCurve(to: CGPoint.xDeltaPoint(x: squircleSide, y: checkpoints.cornerDelta),
                      controlPoint1: CGPoint.xDeltaPoint(x: squircleSide, y: squircleSide-checkpoints.checkpoint2),
                      controlPoint2: CGPoint.xDeltaPoint(x: squircleSide, y: squircleSide-checkpoints.checkpoint1))
        
        path.addLine(to: CGPoint(x: width, y: height-checkpoints.cornerDelta))
        path.addCurve(to: CGPoint.deltaPoint(x: checkpoints.checkpoint3, y: checkpoints.checkpoint0),
                      controlPoint1: CGPoint.deltaPoint(x: squircleSide, y: checkpoints.checkpoint1),
                      controlPoint2: CGPoint.deltaPoint(x: squircleSide, y: checkpoints.checkpoint2))
        path.addCurve(to: CGPoint.deltaPoint(x: checkpoints.checkpoint0, y: checkpoints.checkpoint3),
                      controlPoint1: CGPoint.deltaPoint(x: checkpoints.checkpoint5, y: checkpoints.checkpoint4),
                      controlPoint2: CGPoint.deltaPoint(x: checkpoints.checkpoint4, y: checkpoints.checkpoint5))
        path.addCurve(to: CGPoint.deltaPoint(x: squircleSide-checkpoints.cornerDelta, y: squircleSide),
                      controlPoint1: CGPoint.deltaPoint(x: checkpoints.checkpoint2, y: squircleSide),
                      controlPoint2: CGPoint.deltaPoint(x: checkpoints.checkpoint1, y: squircleSide))
        
        path.addLine(to: CGPoint(x: checkpoints.cornerDelta, y: height))
        path.addCurve(to: CGPoint.yDeltaPoint(x: squircleSide-checkpoints.checkpoint0, y: checkpoints.checkpoint3),
                      controlPoint1: CGPoint.yDeltaPoint(x: squircleSide-checkpoints.checkpoint1, y: squircleSide),
                      controlPoint2: CGPoint.yDeltaPoint(x: squircleSide-checkpoints.checkpoint2, y: squircleSide))
        path.addCurve(to: CGPoint.yDeltaPoint(x: squircleSide-checkpoints.checkpoint3, y: checkpoints.checkpoint0),
                      controlPoint1: CGPoint.yDeltaPoint(x: squircleSide-checkpoints.checkpoint4, y: checkpoints.checkpoint5),
                      controlPoint2: CGPoint.yDeltaPoint(x: squircleSide-checkpoints.checkpoint5, y: checkpoints.checkpoint4))
        path.addCurve(to: CGPoint.yDeltaPoint(x: 0, y: squircleSide-checkpoints.cornerDelta),
                      controlPoint1: CGPoint.yDeltaPoint(x: 0, y: checkpoints.checkpoint2),
                      controlPoint2: CGPoint.yDeltaPoint(x: 0, y: checkpoints.checkpoint1))
        
        path.addLine(to: CGPoint(x: 0, y: checkpoints.cornerDelta))
        path.addCurve(to: CGPoint(x: squircleSide-checkpoints.checkpoint3, y: squircleSide-checkpoints.checkpoint0),
                      controlPoint1: CGPoint(x: 0, y: squircleSide-checkpoints.checkpoint1),
                      controlPoint2: CGPoint(x: 0, y: squircleSide-checkpoints.checkpoint2))
        path.addCurve(to: CGPoint(x: squircleSide-checkpoints.checkpoint0, y: squircleSide-checkpoints.checkpoint3),
                      controlPoint1: CGPoint(x: squircleSide-checkpoints.checkpoint5, y: squircleSide-checkpoints.checkpoint4),
                      controlPoint2: CGPoint(x: squircleSide-checkpoints.checkpoint4, y: squircleSide-checkpoints.checkpoint5))
        path.addCurve(to: CGPoint(x: checkpoints.cornerDelta, y: 0),
                      controlPoint1: CGPoint(x: squircleSide-checkpoints.checkpoint2, y: 0),
                      controlPoint2: CGPoint(x: squircleSide-checkpoints.checkpoint1, y: 0))
        
        path.close()
        
        return path
    }
}
