//
//  GameScene.swift
//  EX-GD-updateFunction
//
//  Created by Michael Robertson on 29/8/2024.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    //square shapeNode and the initial movement for it
    let square = SKShapeNode(rectOf: CGSize(width: 50, height: 50))
    var moveX = 1
    
    //car spriteNode and the initial movement variable for it
    let car = SKSpriteNode(imageNamed: "yellowCar")
    var carX: Float = 0
    
    
    //didMove fucntion to run once; initial setup for notes
    override func didMove(to view: SKView) {
        
        //add square and make it yellow
        square.fillColor = SKColor.yellow
        addChild(square)
        
        //add car object
        addChild(car)
        
    }

    //keyDown function to check what button is pressed and accellerates the car in that direction
    override func keyDown(with event: NSEvent) {
        
        //The acceleration increase to the right
        if event.keyCode == 124 {
            carX += 1
        }
        
        //The acceleration increase to the left
        if event.keyCode == 123 {
            carX -= 1
        }
        
    }
    
    //Slows the car if the button is not pressed
    override func keyUp(with event: NSEvent) {
        
        //car is supposed to decellerate if the key is not pressed
        if event.keyCode == 123 {
            carX += 0.5
        }
        if event.keyCode == 124 {
            carX -= 0.5
        }
        
    }
    
    /*
     Update function: This function runs approximately 60 times per second, corrosponding with the framerate given.
     Movement is given here to change the acceleration of the objects given
    */
    override func update(_ currentTime: TimeInterval) {
        
        //Moves the square to the left based on the moveX variable
        square.position.x = square.position.x + CGFloat(moveX)
        
        //If the square collides with the wall; change the direction of the movement
        if square.position.x > 512 - 25 {
            moveX = -moveX
        }
        if square.position.x < 512 + 25 {
            moveX = +moveX
        }
        
        //If within the boundaries, move the cars position based on the carX variable.
        if carX > 0 && car.position.x < 512 - 61{
            car.position.x = car.position.x + CGFloat(carX)
            
        }
        else if carX < 0 && car.position.x > -512 + 61 {
            car.position.x = car.position.x + CGFloat(carX)
        }
        
        //if the car falls outside those boundaries, reduce the speed to 0
        else {
            carX = 0
        }
        
    }
}
