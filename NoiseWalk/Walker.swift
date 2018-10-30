//
//  Walker.swift
//  NoiseWalk
//
//  Created by Molly Luther on 9/12/18.
//  Copyright © 2018 ASU. All rights reserved.
//

import Foundation
import Tin


class Walker {
    var position: TVector2!
    var velocity: TVector2!
    
    init() {
        position = TVector2(x: tin.midX, y: tin.midY)
        velocity = TVector2(x: TRandom.next(max: 1000.0), y: TRandom.next(max: 1000.0))
    }
    
    // based on I-6 example "NoiseWalk" in Daniel Shiffman's The Nature of Code (http://natureofcode.com)
    func step() {
        position.x = remap(value: noise(x: velocity.x, y: 0.0), start1: -1.0, stop1: 1.0, start2: 0.0, stop2: Double(tin.size.width))
        position.y = remap(value: noise(x: velocity.y, y: 0.0), start1: -1.0, stop1: 1.0, start2: 0.0, stop2: Double(tin.size.height))
        
        velocity = velocity + TVector2(x: 0.01, y: 0.01)
    }
    
    func checkEdges() {        
        // right
        if (position.x + 45 + 5 > tin.width) {
            position.x = tin.width - 45 - 5
            velocity.x = velocity.x * -1
        }
        
        // left
        else if (position.x < 0) {
            position.x = 50
            velocity.x = velocity.x * -1
        }
        
        // top
        if (position.y + 35 + 10 > tin.height) {
            position.y = tin.height - 35 - 10
            velocity.y = velocity.y * -1
            
        }
        // bottom
        else if (position.y < 0) {
            position.y = 30
            velocity.y = velocity.y * -1
        }
    }
    
    func display() {
        // body
        strokeColor(gray: 0.0)
        lineWidth(2.0)
        fillColor(red: 1, green: 1, blue: 0, alpha: 1)
        ellipse(centerX: position.x + 20, centerY: position.y + 15, width: 50, height: 30)
        
         // black stripes
        fillColor(gray: 0.0)
        rect(x: position.x + 5, y: position.y + 3, width: 3, height: 24)
        rect(x: position.x + 15, y: position.y, width: 3, height: 29)
        rect(x: position.x + 25, y: position.y + 1, width: 3, height: 27)
        rect(x: position.x + 35, y: position.y + 5, width: 3, height: 20)
        
        // stinger
        triangle(x1: position.x + 45, y1: position.y + 10, x2: position.x + 45 + 5, y2: position.y + 10 + 5, x3: position.x + 45, y3: position.y + 10 + 5 + 5)
        
        // wing
        fillColor(gray: 0.9)
        ellipse(centerX: position.x + 20, centerY: position.y + 35, width: 10, height: 20)
    }
}
