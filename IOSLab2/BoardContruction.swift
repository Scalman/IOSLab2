//
//  BoardContruction.swift
//  IOSLab2
//
//  Created by Waleed Hassan on 24/11/16.
//  Copyright © 2016 Scalman. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit


/*func createTeams(yPos:CGFloat,color: SKColor)->[SKShapeNode]{
    
    var pos:CGFloat = 0
    var team:[SKShapeNode] = [SKShapeNode]()
    
    for index in 0...8{
        team.append(SKShapeNode(circleOfRadius: 10)) // Size of Circle
        team[index].position = CGPoint(x:frame.midX - ((80 - pos)),y:yPos)  //Middle of Screen
        pos += 20
        team[index].strokeColor = color
        team[index].glowWidth = 1.0
        team[index].fillColor = color
        self.addChild(team[index])
        print(team[index].position)
    }
    return team
}*/

func createTeam(yPos:CGFloat, xPos:CGFloat,screenWidth:CGFloat, color:SKColor, circleReadius:CGFloat)->SKShapeNode{
    
    let team = SKShapeNode(circleOfRadius: circleReadius) // Size of Circle
    team.position = CGPoint(x:(screenWidth/2) - ((circleReadius*2*4 - xPos)),y:yPos)  //Middle of Screen
    team.strokeColor = color
    team.glowWidth = 1.0
    team.fillColor = color
    
    return team
}
