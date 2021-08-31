//  ViewController.swift
//  Matrix-Code-Rain-SpriteKit
//  Created by Holger Hinzberg on 29.08.21.

import Cocoa
import SpriteKit

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = MainScene(size: self.view.bounds.size)
        scene.scaleMode = .aspectFill
        
        let skView = self.view as! SKView
        skView.ignoresSiblingOrder = true
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.presentScene(scene)
    }
}

