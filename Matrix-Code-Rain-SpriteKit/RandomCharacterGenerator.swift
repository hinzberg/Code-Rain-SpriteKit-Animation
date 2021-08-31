//  RandomCharacterGenerator.swift
//  Matrix-Code-Rain-SpriteKit
//  Created by Holger Hinzberg on 29.08.21.

import Foundation

public class RandomCharacterGenerator {

    private var characters = [String]()
    
    init() {
        self.characters.append(contentsOf: ["a","b","c","d","e","f","g","h","i","j","k","l","m","n"])
        self.characters.append(contentsOf: ["o","p","q","r","s","t","u","v","w","x","y","z"])
        
        self.characters.append(contentsOf: ["A","B","C","D","E","F","G","H","I","J","K","L","M","N"])
        self.characters.append(contentsOf: ["O","P","Q","R","S","T","U","V","W","X","Y","Z"])
        
        self.characters.append(contentsOf: ["1","2","3","4","5","6","7","8","9","0"])
        
        self.characters.append(contentsOf: ["#","l","@","+","-","*","/","§","%","&","(",")","=","?","<",">","^","°","!",";"])
    }
    
    public func getRandomCharacter() -> String {
        return self.characters.randomElement()!
    }
}
