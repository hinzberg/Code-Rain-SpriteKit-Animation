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
        // How many characters fit on the view?
        let maxCharacters = Int( self.size.height / fontSize)
        // The minimum number of characters in a streak
        let minCharacters = maxCharacters / 2
        // A random number between min and max
        let randomCharacterCount = Int.random(in: minCharacters...maxCharacters)
        
        let characterGenerator = RandomCharacterGenerator()
        
        for index in  1...randomCharacterCount {
            // Get a reandom character
            let character = characterGenerator.getRandomCharacter()
            // Create label node
            let label = self.createCharacterNode(character: character, fontSize: self.fontSize)
            // Set the position
            label.zPosition = self.zPosition + 1
            label.position = self.createPosition(index: index, fontSize: self.fontSize)
            // Get and add the animation
            let animation = self.createAnimation(index: index)
            label.run(animation)
            // Das to parent view
            self.addChild(label)
        }
    }
    
    private func createPosition(index : Int, fontSize : CGFloat) -> CGPoint {
        let yOffset = fontSize * CGFloat(index)
        let labelPostion = CGPoint(x: 0, y: self.size.height / 2 - yOffset )
        return labelPostion
    }
    
    private func createCharacterNode ( character : String, fontSize : CGFloat) -> SKLabelNode {
        let label = SKLabelNode(text: character)
        label.fontSize = fontSize
        label.fontName = "Arial"
        label.fontColor = SKColor.green
        label.alpha = 1
        return label
    }
    
    private func createAnimation(index : Int) -> SKAction {
        let duration = 1.2
        // Wait depending on index position
        let delayAction = SKAction.wait(forDuration: 0.1 * Double(index))
        // Fade in Animation
        //let fadeInAction = SKAction.fadeIn(withDuration: duration)
        
        // Wait and do nothing
        let colorAction = SKAction.colorTransitionAction(fromColor: SKColor.white, toColor: SKColor.green, duration: duration)
                
        // Wait and do nothing
        let waitAction = SKAction.wait(forDuration: duration)
        // Fade out Animation
        let fadeOutAction = SKAction.fadeOut(withDuration: duration)
        // Remove yourself from parent view
        let doneAction = SKAction.removeFromParent()
        // Combine all actions to a sequence
        let sequence = SKAction.sequence([delayAction,  colorAction  , waitAction, fadeOutAction, doneAction])
        return sequence
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
