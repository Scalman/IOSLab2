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
    private var teamOne : [SKShapeNode] = [SKShapeNode]()
    private var teamTwo : [SKShapeNode] = [SKShapeNode]()
    private var boardplaces:[SKSpriteNode] = [SKSpriteNode]()

    
    override func didMove(to view: SKView) {
        
       // createTeams();
        
        for child in self.children {
            

                
            switch child.name{
                case "hotspot"?:
                    boardplaces.append(child as! SKSpriteNode)
                case "teamOne"?:
                    teamOne.append(child as! SKShapeNode)
                case "teamTwo"?:
                    teamTwo.append(child as! SKShapeNode)
                default: print("")
            }
            

        }
        
        print("Board: \(boardplaces.count)")
        print("Size Of Team 1: \(teamOne.count)")
        print("Size Of Team 2: \(teamTwo.count)")
    }
    
   /* private func createTeams(){
        
        for index in 0...8{
            let pos = CGFloat((20) * index)
            orangeTeam.append(createTeam(yPos:frame.height/4, xPos:pos,screenWidth:(view?.frame.width)!,
                                         color:UIColor(red:0.78, green:0.24, blue:0.06, alpha:1.0), circleReadius:10))
            self.addChild(orangeTeam[index])
        }
        
        for index in 0...8{
            let pos = CGFloat((20) * index)
            blueTeam.append(createTeam(yPos:(frame.height/4)*3, xPos:pos,screenWidth:(view?.frame.width)!,
                                       color:UIColor(red:0.99, green:0.95, blue:0.91, alpha:1.0), circleReadius:10))
            self.addChild(blueTeam[index])
        }
    }*/
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {


        for touch: AnyObject in touches {
            
            // detect touch in the scene
            let location = touch.location(in: self)
            

            
            for teams in self.teamOne{
                
                //if teams.contains(location){
                print(teams.position)
                let diffPoint = CGPoint(
                    x: teamOne[0].position.x - location.x,
                    y: teamOne[0].position.y - location.y
                )
            
                let distance = sqrt(pow(diffPoint.x, 2) + pow(diffPoint.y, 2))
                
                let durationRatio = distance / CGFloat(600)
                
                let moveAction = SKAction.move(to: location, duration: TimeInterval(durationRatio))
                
                teamOne[0].run(moveAction, withKey: "move")
          

            }
        }
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
