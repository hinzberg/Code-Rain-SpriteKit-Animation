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
        label.fontColor = SKColor.white
        label.alpha = 0
        return label
    }
    
    private func createAnimation(index : Int) -> SKAction {
        
        let delayDuration = 0.08
        let fadeDuration = 0.3
        let colorShiftDuration = 0.1
        let stayDuration = 1.0
        
        // Wait and do nothing. You will fade in soon
        let delayAction = SKAction.wait(forDuration: delayDuration * Double(index))
        // Fade in Animation
        let fadeInAction = SKAction.fadeIn(withDuration: fadeDuration)
        // Shift the color from white to green
        let colorShiftAction = SKAction.colorTransitionAction(fromColor: SKColor.white, toColor: SKColor.green, duration: colorShiftDuration)
        // All together now
        let introSequence = SKAction.sequence([delayAction, fadeInAction, colorShiftAction])

        // Wait and do nothing. Just be there
        let stayAction = SKAction.wait(forDuration: stayDuration)
        
        // Fade out Animation
        let fadeOutAction = SKAction.fadeOut(withDuration: fadeDuration)
        // Remove yourself from parent view
        let doneAction = SKAction.removeFromParent()
        // All together now
        let outroSequence = SKAction.sequence([fadeOutAction, doneAction])
                
        let lifecycleSequence = SKAction.sequence([introSequence, stayAction, outroSequence])
        return lifecycleSequence
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
