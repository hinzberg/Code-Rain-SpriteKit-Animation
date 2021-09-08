//  SKColor + Helper.swift
//  Matrix-Code-Rain-SpriteKit
//  Created by Holger Hinzberg on 03.09.21.

import SpriteKit

struct SKColorComponents {
    var red = CGFloat(0)
    var green = CGFloat(0)
    var blue = CGFloat(0)
    var alpha = CGFloat(0)
}

extension SKColor {
    func components() -> SKColorComponents {
        
        let spacedColor = self.usingColorSpace(NSColorSpace.deviceRGB) ?? self
        
        var components = SKColorComponents()
        components.red = spacedColor.redComponent
        components.green = spacedColor.greenComponent
        components.blue = spacedColor.blueComponent
        components.alpha = spacedColor.alphaComponent
        return components
    }
}

func linearInterpolate(startValue : CGFloat, endValue : CGFloat, fraction : CGFloat) -> CGFloat
{
    return (endValue-startValue) * fraction + startValue
}

extension SKAction {
    static func colorTransitionAction(fromColor : SKColor, toColor : SKColor, duration : Double) -> SKAction
    {
        let customAction =  SKAction.customAction(withDuration: duration) { (node : SKNode!, elapsedTime : CGFloat) -> Void in
            
            let startComponents = fromColor.components()
            let endComponents = toColor.components()
            
            let fraction = CGFloat(elapsedTime / CGFloat(duration))
            
            let transitionRedComponent
                = linearInterpolate(startValue: startComponents.red, endValue: endComponents.red, fraction: fraction)
            let transitionGreenComponent
                = linearInterpolate(startValue: startComponents.green, endValue: endComponents.green, fraction: fraction)
            let transitionBlueComponent
                = linearInterpolate(startValue: startComponents.blue, endValue: endComponents.blue, fraction: fraction)
            let transitionAlphaComponent
                = linearInterpolate(startValue: startComponents.alpha, endValue: endComponents.alpha, fraction: fraction)
            
            let transitionColor = SKColor(red: transitionRedComponent,
                                          green: transitionGreenComponent,
                                          blue: transitionBlueComponent,
                                          alpha: transitionAlphaComponent)
            
            // Cast SKNode to SKLabelNode because we need the fontColor
            (node as? SKLabelNode)?.fontColor = transitionColor
        }
        return customAction
    }
}


