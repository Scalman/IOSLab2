//
//  GameScene.swift
//  bajs
//
//  Created by Waleed Hassan on 23/11/16.
//  Copyright © 2016 Scalman. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class GameScene: SKScene{
    
    private var red : [String:Int] = [:]
    private var blue : [String:Int] = [:]
    private var boardplaces:[String] = []
    private var pieceSelected:SKSpriteNode? = nil
    private var NINE_MEN_GAME_RULES:NineMenMorrisRules = NineMenMorrisRules()
    private var REMOVE_STAGE:Bool = false
    private var ScoreTextOne = SKLabelNode()
    private var ScoreTextTwo = SKLabelNode()
    private var ScoreValueOne:Int! = 0
    private var ScoreValueTwo:Int! = 0
    private var ScoreKeyOne:String = "ScoreOne"
    private var ScoreKeyTwo:String = "ScoreTwo"
    override func didMove(to view: SKView) {
        
        for child in self.children {
   
            if let roomCount = child.name?.contains("R"){
                if roomCount{
                    red[child.name!]=0
                }
            }
            if let roomCount = child.name?.contains("B") {
                if roomCount{
                    blue[child.name!]=0
                }
            }
            if let roomCount = child.name?.contains("board") {
                if roomCount{
                    print(child.name!)
                    child.zPosition = -10
                }
            }
            if child.name?.characters.count != nil{
                if (child.name?.characters.count)! < 3{
                    boardplaces.append(child.name!)
                }
            }
            if let roomCount = child.name?.contains("ScoreOne") {
                if roomCount{
                    ScoreTextOne = child as! SKLabelNode
                    if let i = load(key: ScoreKeyOne) {
                        ScoreValueOne = i
                    } else {
                        ScoreValueOne = 0
                    }
                    ScoreTextOne.text! = String(describing:ScoreValueOne!)
                }
            }
            if let roomCount = child.name?.contains("ScoreTwo") {
                if roomCount{
                    ScoreTextTwo = child as! SKLabelNode
                    if let i = load(key: ScoreKeyTwo) {
                        ScoreValueTwo = i
                    } else {
                        ScoreValueTwo = 0
                    }
                    ScoreTextTwo.text! = String(describing:ScoreValueTwo!)
                }
            }
            

           /* switch child.name{
                case "hotspot"?: break
                    //self.boardplaces.setValue([child as! SKSpriteNode,false], forKey: String(describing: child as! SKSpriteNode ))
                case "B1"?:print("Blue")
                   // child.name!.append(String(teamOne.count))
                   // print("\(child.name)")
                 //   let arr:NSMutableArray = [child as! SKShapeNode,false]
                   // self.teamOne.setValue(arr, forKey: child.name!)
                case "R1"?: break
                  //  child.name!.append(String(teamTwo.count))
                   // print("\(child.name)")
                  //  let arr:NSMutableArray = [child as! SKShapeNode,false]
                   // self.teamTwo.setValue(arr, forKey: child.name!)
                case "board"?: break
                                    default: break
            }*/
        }
        print(red.count)
        print(blue.count)
        print(boardplaces.count)
        
    }
    
    
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

            let node = self.atPoint(location) //nodeAtPoint:location
                self.scaleMode = SKSceneScaleMode.aspectFit
            
                if boardplaces.contains(node.name!) && pieceSelected != nil && !REMOVE_STAGE{
                    if NINE_MEN_GAME_RULES.playerTurn() == 2 && !(node.name?.contains("R"))!{
                        let tmp = red[pieceSelected!.name!]
                        red = moveSelectedBrick(node: node,tmp: tmp!,team:red)
                    }else if NINE_MEN_GAME_RULES.playerTurn() == 1 && !(node.name?.contains("B"))!{
                        let tmp = blue[pieceSelected!.name!]
                        blue = moveSelectedBrick(node: node,tmp: tmp!,team:blue)
                    }
                } else if !REMOVE_STAGE{
                    if (red[node.name!] != nil) && NINE_MEN_GAME_RULES.playerTurn() == 2 {
                        selectPiece(node: node as! SKSpriteNode)
                    }else if(blue[node.name!] != nil) && NINE_MEN_GAME_RULES.playerTurn() == 1 {
                        selectPiece(node: node as! SKSpriteNode)
                    }
                }  else {
                if (red[node.name!] != nil) && NINE_MEN_GAME_RULES.playerTurn() == 1 {
                    red = selectPieceToRemove(node: node as! SKSpriteNode,team: red)
                }else if(blue[node.name!] != nil) && NINE_MEN_GAME_RULES.playerTurn() == 2 {
                    blue = selectPieceToRemove(node: node as! SKSpriteNode,team: blue)
                }
            }
            
        }
    }

    
    func moveSelectedBrick(node:SKNode,tmp: Int, team:[String:Int])->[String:Int]{
        var team = team
        let nodePos = node.name! as String
        if NINE_MEN_GAME_RULES.legalMove(To: Int(nodePos)!, From: tmp , color: NINE_MEN_GAME_RULES.playerTurn()){
            print("legal")
            team[(pieceSelected?.name!)!] = Int(node.name!)
            movePiece(node: node)
            
            if NINE_MEN_GAME_RULES.remove(to: Int(nodePos)!) {
                NINE_MEN_GAME_RULES.togglePlayerTurn()
                REMOVE_STAGE = true
            }
        } else {
            print("illegal")
        }
        return team
    }
    
    func selectPiece(node:SKSpriteNode){
        self.pieceSelected?.setScale(1)
        self.pieceSelected = node
        node.setScale(1.4)
    }
    func selectPieceToRemove(node:SKNode, team:[String:Int])->[String:Int]{
        var team = team
        if NINE_MEN_GAME_RULES.remove(From: team[node.name!]!, color: NINE_MEN_GAME_RULES.colorToRemove()){
            team[node.name!] = nil
            removeChildren(in: [node])
            REMOVE_STAGE = false
        }
        NINE_MEN_GAME_RULES.togglePlayerTurn()
        

        if NINE_MEN_GAME_RULES.win(color:NINE_MEN_GAME_RULES.colorToRemove()) {
            if let scene = SKScene(fileNamed: "GameScene") {
                ScoreValueOne = Int(ScoreTextOne.text!)!
                ScoreValueTwo = Int(ScoreTextTwo.text!)!
                
                self.removeAllChildren()
                self.removeAllActions()
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene)
                if NINE_MEN_GAME_RULES.playerTurn() == 1 {
                    ScoreValueOne = ScoreValueOne + 1
                    save(data: ScoreValueOne,key: ScoreKeyOne)
                }
            }
    
        } else {
            ScoreValueTwo = ScoreValueTwo + 1
            save(data: ScoreValueTwo,key: ScoreKeyTwo)
        }
   
    
        return team
    }
    
    func movePiece(node: SKNode){
        
        let moveAction = SKAction.move(to: node.position, duration: TimeInterval(0.5))
        self.pieceSelected?.run(moveAction, completion: {_ in
            self.pieceSelected?.setScale(1)
            self.pieceSelected = nil
        })
        
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
public func load(key:String)->Int?{
    return (UserDefaults.standard.value(forKey: key) as! Int?)
}

public func save(data: Int, key:String){
    UserDefaults.standard.setValue(data, forKey: key)
}
