//
//  EndGameScene.swift
//  ExplodingMonkeys
//
//  Created by Dmitry Reshetnik on 23.06.2020.
//  Copyright © 2020 Dmitry Reshetnik. All rights reserved.
//

import SpriteKit

class EndGameScene: SKScene {
    weak var viewController: GameViewController!
    var currentPlayer: Int!
    
    override func didMove(to view: SKView) {
        backgroundColor = UIColor(hue: 0.669, saturation: 0.99, brightness: 0.67, alpha: 1)
        
        let gameOver = SKLabelNode(fontNamed: "SF Pro")
        gameOver.horizontalAlignmentMode = .center
        gameOver.text = currentPlayer == 1 ? "PLAYER TWO WIN!" : "PLAYER ONE WIN!"
        gameOver.fontSize = 48
        gameOver.zPosition = 4
        addChild(gameOver)
        
        gameOver.position = CGPoint(x: 512, y: 384)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            let newGame = GameScene(size: self.size)
            newGame.viewController = self.viewController
            self.viewController.currentGame = newGame
            self.viewController.activatePlayer(number: 1)
            newGame.player1Score = 0
            newGame.player2Score = 0
            
            let transition = SKTransition.doorway(withDuration: 1.5)
            self.view?.presentScene(newGame, transition: transition)
        }
    }
}
