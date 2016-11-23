//
//  GameScene.swift
//  bajs
//
//  Created by Waleed Hassan on 23/11/16.
//  Copyright © 2016 Scalman. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //private var ddddd : SKLabelNode?
    //private var rect : SKShapeNode?
    
    override func didMove(to view: SKView) {
        
        print("kuken i fittan")


        let Circle = SKShapeNode(circleOfRadius: 15 ) // Size of Circle
        Circle.position = CGPoint(x:frame.midX,y:frame.midY)  //Middle of Screen
        Circle.strokeColor = SKColor.black
        Circle.glowWidth = 1.0
        Circle.fillColor = SKColor.orange
        self.addChild(Circle)

    }
    
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
