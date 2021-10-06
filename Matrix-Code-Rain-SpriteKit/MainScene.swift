//
//  MainScene.swift
//  Matrix-Code-Rain-SpriteKit
//
//  Created by Holger Hinzberg on 29.08.21.
//

import SpriteKit

class MainScene: SKScene  {
    
    private let fontSize : CGFloat = 20
    private var streakNodes = [CodeStreakNode]()
        
    override init(size: CGSize)
    {
        super.init(size: size)
        self.backgroundColor = SKColor.black
        
        let nodeSize = CGSize(width: fontSize, height: self.size.height)
        let nodeColor = SKColor(calibratedRed: 1, green: 1, blue: 1, alpha: 0.0)
        
        var positionX = 150.0
        
        for index in 1...10 {
            
            let streakNode = CodeStreakNode(color: nodeColor, size: nodeSize)
            streakNode.fontSize = fontSize
            streakNode.position = CGPoint(x: positionX, y: self.size.height / 2)
            addChild(streakNode)
            streakNodes.append(streakNode)
            
            positionX += 20.0
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        streakNodes.forEach{ $0.update() }
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }
}
