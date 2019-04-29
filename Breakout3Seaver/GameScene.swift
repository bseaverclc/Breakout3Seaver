//
//  GameScene.swift
//  Breakout3Seaver
//
//  Created by Brian Seaver on 4/9/19.
//  Copyright © 2019 clc.seaver. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate{
    
    struct PhysicsMask {
        static let none: UInt32 = 0
        //static let all: UInt32 = UInt32.max
        static let ball: UInt32 =   0b0001
        static let block: UInt32 =  0b0010
        static let wall: UInt32   = 0b0011
        
    }
    
    var scoreNum = 0;
    var blocks: [SKSpriteNode] = []
    var ball = SKSpriteNode(imageNamed: "redBall")
    
    var score = SKLabelNode(fontNamed: "Arial")
    
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        border.angularDamping = 0
        border.linearDamping = 0
        border.categoryBitMask = PhysicsMask.wall
       // border.collisionBitMask = PhysicsMask.all
        border.contactTestBitMask = PhysicsMask.none
        self.physicsBody = border
        backgroundColor = UIColor.black
        physicsWorld.gravity = CGVector.zero
        
        
        createBlocks()
        createBall()
        score.text = "Score: change"
        score.fontColor = UIColor.blue
        score.position = CGPoint(x: 200, y: 200)
        score.fontSize = 30
        score.isHidden = false
        //score.zPosition = 10
        print(score.text)
        addChild(score)
       
        }
    
 func seaverFunction()
 {
    }
    func vetteFunc(){
        
    }
        
        func createBlocks()
        {
            let buffer = self.size.width/28
            let blockSize = CGSize(width: 5*buffer, height:  20.0)
            //print(viwe.safeAreaInsets.left)
            var x = view!.safeAreaInsets.left;
            
            x = x + buffer*2
            print(x)
            for i in 0...3{
                
                var block = SKSpriteNode(color: UIColor.blue, size: blockSize)
                block.physicsBody = SKPhysicsBody(rectangleOf: block.size)
                blocks.append(block)
                print(self.size.height)
                block.position = CGPoint(x: x, y: self.size.height-100)
                x = x + block.size.width + buffer
                block.physicsBody?.isDynamic = false
                block.physicsBody?.linearDamping = 0
                block.physicsBody?.angularDamping = 0
                block.physicsBody?.restitution = 1
                block.physicsBody?.friction = 0
               block.physicsBody?.categoryBitMask = PhysicsMask.block
               // block.physicsBody?.collisionBitMask = PhysicsMask.ball
                
                block.physicsBody?.contactTestBitMask = PhysicsMask.ball
               
                addChild(blocks[i])
            
        }
    }
        
            func createBall(){
                ball.scale(to: CGSize(width: 10, height: 10))
                ball.physicsBody = SKPhysicsBody(circleOfRadius: 5.0)
                ball.position = CGPoint(x: 50, y: 50)
                ball.physicsBody?.restitution = 1.0
                ball.physicsBody?.linearDamping = 0
                ball.physicsBody?.angularDamping = 0
                ball.physicsBody?.allowsRotation = false
                ball.physicsBody?.friction = 0
                ball.physicsBody?.categoryBitMask = PhysicsMask.ball
                //ball.physicsBody?.collisionBitMask = PhysicsMask.block
                //ball.physicsBody?.contactTestBitMask = PhysicsMask.block
                
               
                addChild(ball)
                ball.physicsBody?.applyImpulse(CGVector(dx: 1, dy: 1))
            }
        
    func didBegin(_ contact: SKPhysicsContact) {
        print("contact")
        scoreNum+=1
        score.text = "Score: \(scoreNum)"
        if let x = (contact.bodyA.node) as? SKSpriteNode{
        x.removeFromParent()
            print("remove?")
        }
    
    }
       
    
    
    
}

