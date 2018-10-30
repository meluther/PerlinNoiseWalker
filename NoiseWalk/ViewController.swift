//
//  ViewController.swift
//  NoiseWalk
//
//  Created by Molly Luther on 9/12/18.
//  Copyright © 2018 ASU. All rights reserved.
//

import Cocoa
import Tin

class ViewController: TController {

    override func viewWillAppear() {
        view.window?.title = "Noise Walk"
        makeView(width: 800.0, height: 360.0)
        let scene = Scene()
        present(scene: scene)
        scene.view?.showStats = false
    }
}

class Scene: TScene {
    var w = Walker()
    
    override func setup() {}
    
    override func update() {
        background(gray: 1.0)
       
        w.checkEdges()
        w.step()
        w.display()
    }
}
