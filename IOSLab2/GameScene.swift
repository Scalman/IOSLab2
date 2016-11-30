//
//  GameScene.swift
//  bajs
//
//  Created by Waleed Hassan on 23/11/16.
//  Copyright © 2016 Scalman. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene{
    
    //private var ddddd : SKLabelNode?
    private var red : NSMutableDictionary = NSMutableDictionary()
    private var blue : NSMutableDictionary = NSMutableDictionary()
    private var boardplaces:[String] = []
    private var pieceSelected:SKShapeNode? = nil
    private var NINE_MEN_GAME_RULES:NineMenMorrisRules = NineMenMorrisRules()
    
    override func didMove(to view: SKView) {
        
       // createTeams();
       // var hej:NineMenMorrisRules = NineMenMorrisRules()
        for child in self.children {
            
   
            if let roomCount = child.name?.contains("R") {
                if roomCount{
                   red.setValue(0, forKey: child.name!)
                }
            }
            if let roomCount = child.name?.contains("B") {
                if roomCount{
                    blue.setValue(0, forKey: child.name!)
                }
            }
            if let roomCount = child.name?.contains("board") {
                if roomCount{
                    child.zPosition = -10
                }
            }
            if child.name?.characters.count != nil{
                if (child.name?.characters.count)! < 3{
                    boardplaces.append(child.name!)
                }
            }
            
           /* if (child.name?.contains("R"))?{
                print(child.name!)
                red.setValue(0, forKey: child.name!)
            }*/
            /*else if (child.name?.contains("B")) != nil{
                blue.setValue(0, forKey: child.name!)
            }else if (child.name?.contains("board")) != nil{
                child.zPosition = -10
            }else if (child.name?.characters.count == 1){
                boardplaces.append(child.name!)
            }*/


            

           /* if (child.name?.contains("R"))!{
                red.setValue(0, forKey: child.name!)
            }else if (child.name?.contains("B"))!{
                blue.setValue(0, forKey: child.name!)
            }else if (child.name?.contains("board"))!{
                child.zPosition = -10
            }else if child.name?.characters.count == 1 {
                boardplaces.append(child.name!)
            }*/
           // print("name : "  + Int(child.name!))
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
            //let kuk = touch.
            let node = self.atPoint(location) //nodeAtPoint:location
            
            if pieceSelected == nil {
                    if (red.value(forKey: node.name!) != nil) && NINE_MEN_GAME_RULES.playerTurn() == 2 {
                        selectPiece(node: node as! SKShapeNode)
                    }else if(blue.value(forKey: node.name!) != nil) && NINE_MEN_GAME_RULES.playerTurn() == 1 {
                        selectPiece(node: node as! SKShapeNode)
                    }
                } else if pieceSelected != nil {
                    if boardplaces.contains(node.name!){
                        if NINE_MEN_GAME_RULES.playerTurn() == 2 && !(node.name?.contains("R"))!{
                            let tmp = red[pieceSelected!.name!] as! Int
                            moveSelectedBrick(node: node,tmp: tmp,team:red)
                        }else if NINE_MEN_GAME_RULES.playerTurn() == 1 && !(node.name?.contains("B"))!{
                            let tmp = blue[pieceSelected!.name!] as! Int
                            moveSelectedBrick(node: node,tmp: tmp,team:blue)
                        }
                    }
            }
            
            
            
            /* if pieceSelected != nil && boardplaces.contains(node.name!){
                if NINE_MEN_GAME_RULES.playerTurn() == 2 && !(node.name?.contains("R"))!{
                    let tmp = red[pieceSelected!.name!] as! Int
                    moveSelectedBrick(node: node,tmp: tmp)
                    pieceSelected = nil
                }else if NINE_MEN_GAME_RULES.playerTurn() == 1 && !(node.name?.contains("B"))!{
                    let tmp = blue[pieceSelected!.name!] as! Int
                    moveSelectedBrick(node: node,tmp: tmp)
                    pieceSelected = nil
                }
            } else if (red.value(forKey: node.name!) != nil) && NINE_MEN_GAME_RULES.playerTurn() == 2 {
                selectPiece(node: node as! SKShapeNode)
            }else if(blue.value(forKey: node.name!) != nil) && NINE_MEN_GAME_RULES.playerTurn() == 1 {
                selectPiece(node: node as! SKShapeNode)
            }*/
            
            
     
            
            
           // let letters = NSCharacterSet.letters
           // let range = node.name?.rangeOfCharacter(from: letters)
            
            
            
            
          /*  if (range == nil){
                if pieceSelected != nil {
                    if NINE_MEN_GAME_RULES.playerTurn() == "red" {
                        if NINE_MEN_GAME_RULES.legalMove(To: Int(node.name!)!, From: 0, color: 2){
                            movePiece(node: node)
                        }
                    }else{
                        if NINE_MEN_GAME_RULES.legalMove(To: Int(node.name!)!, From: 0, color: 1){
                            movePiece(node: node)
                        }
                    }
                }
            }*/
            
            
        }
    }

    
    func moveSelectedBrick(node:SKNode,tmp: Int, team:NSMutableDictionary){
        let nodePos = node.name! as String
        if NINE_MEN_GAME_RULES.legalMove(To: Int(nodePos)!, From: tmp , color: NINE_MEN_GAME_RULES.playerTurn()){
            print("legal")
            team.value(forKey: pieceSelected!.name!)
            team[pieceSelected?.name! as Any] = node.name
            movePiece(node: node)
        } else {
            print("illegal")
        }
    }
    
    func selectPiece(node:SKShapeNode){
        self.pieceSelected?.glowWidth = 1
        self.pieceSelected = node
        node.glowWidth = 10.0
    }
    
    func movePiece(node: SKNode){
        
        let moveAction = SKAction.move(to: node.position, duration: TimeInterval(0.5))
        self.pieceSelected?.run(moveAction, completion: {_ in
            self.pieceSelected?.glowWidth = 1
            self.pieceSelected = nil
        })
        
    }
    

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

       /* for touch: AnyObject in touches {
            let location = touch.location(in: self)
            //let kuk = touch.
            let node = self.atPoint(location)
            print(node.name!)

        }*/
        
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
