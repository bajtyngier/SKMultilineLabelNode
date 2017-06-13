//
//  GameViewController.swift
//  SKMultilineLabelNode
//
//  Created by Konrad Bajtyngier on 13/06/2017.
//  Copyright © 2017 Konrad Bajtyngier. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
			
			let scene = GameScene(size: view.frame.size)
			scene.scaleMode = .aspectFill
			view.presentScene(scene)
		
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
