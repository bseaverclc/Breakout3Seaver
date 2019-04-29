//
//  GameViewController.swift
//  Breakout3Seaver
//
//  Created by Brian Seaver on 4/9/19.
//  Copyright © 2019 clc.seaver. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.bounds.size)
        let skview = view as! SKView
        skview.showsFPS = true
        skview.showsNodeCount = true
        skview.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFit
        
        skview.presentScene(scene)
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
        
}
}
