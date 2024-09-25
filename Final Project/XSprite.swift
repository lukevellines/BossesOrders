//
//  EndScreenView.swift
//  Final Project
//
//  Created by Luke Vellines on 4/19/24.
//
//  Luke Vellines, Michael utz
//  lvelline, mutz
//  Boss's Orders
// Apr 26
import SpriteKit
class XSprite: SKSpriteNode {
    init() {
        let image = SKTexture(imageNamed: "boss.jpeg")
        super.init(texture:image, color: .clear, size: image.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

