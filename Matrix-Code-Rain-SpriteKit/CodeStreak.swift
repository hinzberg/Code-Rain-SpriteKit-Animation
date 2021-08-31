//  CodeStreak.swift
//  Matrix-Code-Rain-SpriteKit
//  Created by Holger Hinzberg on 31.08.21.

import SpriteKit


class CodeStreakNode: SKSpriteNode {
    
    public var fontSize : CGFloat = 50
    
    override init(texture: SKTexture?, color: NSColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    public func update() {
        if self.children.count == 0 {
            self.createCharacters()
        }
    }
    
    private func createCharacters() {
        let maxCharacters = Int( self.size.height / fontSize)
        let minCharacters = maxCharacters / 2
        let randomCharacterCount = Int.random(in: minCharacters...maxCharacters)
        
        let characterGenerator = RandomCharacterGenerator()
        
        print("")
        
        for index in  1...randomCharacterCount {
            
            let character = characterGenerator.getRandomCharacter()
            // print(character)
            
            let label = self.createCharacterNode(character: character, fontSize: fontSize)
            let yOffset = fontSize * CGFloat(index)
            
            let lablePostion = CGPoint(x: 0, y: self.size.height / 2 - yOffset )
            label.position = lablePostion
            label.zPosition = self.zPosition + 1
            
            let animation = self.createAnimation(index: index)
            label.run(animation)
            
            self.addChild(label)
        }
    }
    
    private func createCharacterNode ( character : String, fontSize : CGFloat) -> SKLabelNode {
        let label = SKLabelNode(text: character)
        label.fontSize = fontSize
        label.fontName = "Arial"
        label.fontColor = SKColor.green
        label.alpha = 0
        return label
    }
    
    private func createAnimation(index : Int) -> SKAction {
        let delayAction = SKAction.wait(forDuration: 0.1 * Double(index))
        let fadeInAction = SKAction.fadeIn(withDuration: 0.2)
        let waitAction = SKAction.wait(forDuration: 0.2)
        let fadeOutAction = SKAction.fadeOut(withDuration: 0.2)
        let doneAction = SKAction.removeFromParent()
        let sequence = SKAction.sequence([delayAction, fadeInAction, waitAction, fadeOutAction, doneAction])
        return sequence
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
