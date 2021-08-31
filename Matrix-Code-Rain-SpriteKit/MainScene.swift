//
//  MainScene.swift
//  Matrix-Code-Rain-SpriteKit
//
//  Created by Holger Hinzberg on 29.08.21.
//

import SpriteKit

class MainScene: SKScene  {
    
    private let fontSize : CGFloat = 50
    private var streakNode : CodeStreakNode?
        
    override init(size: CGSize)
    {
        super.init(size: size)
        
        self.backgroundColor = SKColor.black
        
        let nodeSize = CGSize(width: fontSize, height: self.size.height)
        let nodeColor = SKColor(calibratedRed: 1, green: 1, blue: 1, alpha: 0.2)
        self.streakNode = CodeStreakNode(color: nodeColor, size: nodeSize)
        self.streakNode?.fontSize = fontSize
        self.streakNode!.position = CGPoint(x: self.size.width / 2 - 200, y: self.size.height / 2)
        self.addChild(streakNode!)
    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        self.streakNode?.update()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }
}
