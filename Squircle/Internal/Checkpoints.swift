//
//  Chepoints.swift
//  Squircle
//
//  Created by Giuseppe Travasoni on 24/04/2019.
//

import Foundation

internal struct Checkpoints {
    
    let width: CGFloat
    let height: CGFloat
    
    let startRatio: CGFloat = 256/87.15
    
    let checkpoint0Ratio: CGFloat = 256/219.33
    let checkpoint1Ratio: CGFloat = 256/198.35
    let checkpoint2Ratio: CGFloat = 256/206.63
    let checkpoint3Ratio: CGFloat = 256/251.73
    let checkpoint4Ratio: CGFloat = 256/234.35
    let checkpoint5Ratio: CGFloat = 256/246.24
    
    var squircleSide: CGFloat { return min(width, height) }
    
    var cornerDelta: CGFloat { return squircleSide/startRatio }
    var checkpoint0: CGFloat { return squircleSide/checkpoint0Ratio }
    var checkpoint1: CGFloat { return squircleSide/checkpoint1Ratio }
    var checkpoint2: CGFloat { return squircleSide/checkpoint2Ratio }
    var checkpoint3: CGFloat { return squircleSide/checkpoint3Ratio }
    var checkpoint4: CGFloat { return squircleSide/checkpoint4Ratio }
    var checkpoint5: CGFloat { return squircleSide/checkpoint5Ratio }
}
