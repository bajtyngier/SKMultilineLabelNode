//
//  GameScene.swift
//  SKMultilineLabelNode
//
//  Created by Konrad Bajtyngier on 13/06/2017.
//  Copyright © 2017 Konrad Bajtyngier. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
	
	let text1 = "Vestibulum id ligula porta felis euismod semper."
	let text2 = "Etiam porta sem euismod.\nCurabitur blandit tempus porttitor."
	let text3 = "Praesent commodo cursus magna,\nvel scelerisque nisl consectetur et.\n\nCras justo odio,\ndapibus ac facilisis in,\negestas eget quam."
	
	override func didMove(to view: SKView) {
		
		//Helpers
		let path = CGMutablePath()
		path.move(to: .zero)
		path.addLine(to: CGPoint(x: view.frame.width, y: 0))
		let dashed = path.copy(dashingWithPhase: 0, lengths: [10, 5])
		let line1 = SKShapeNode(path: dashed)
		line1.position.y = 500
		line1.strokeColor = SKColor.white.withAlphaComponent(0.25)
		addChild(line1)
		let line2 = SKShapeNode(path: dashed)
		line2.position.y = 400
		line2.strokeColor = SKColor.white.withAlphaComponent(0.25)
		addChild(line2)
		let line3 = SKShapeNode(path: dashed)
		line3.position.y = 200
		line3.strokeColor = SKColor.white.withAlphaComponent(0.25)
		addChild(line3)
		
		//Exmaple 1 - simple example with single line
		
		let label1 = SKMultilineLabelNode(text: text1, fontSize: 20.0, verticalAlignment: .top)
		label1.position = CGPoint(x: view.frame.width/2, y: 500)
		addChild(label1)
		
		//Exmaple 2 - two lines
		
		let label2 = SKMultilineLabelNode(text: text2, fontName: "Helvetica", fontSize: 20.0, verticalAlignment: .bottom)
		label2.position = CGPoint(x: view.frame.width/2, y: 400)
		addChild(label2)
		
		//Exmaple 3 - several lines
		
		let label3 = SKMultilineLabelNode(text: text3, fontName: "Arial", fontSize: 15.0)
		label3.position = CGPoint(x: view.frame.width/2, y: 200)
		addChild(label3)
		
	}
	
}
