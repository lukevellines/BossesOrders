//
//  ViewController.swift
//  Final Project
//
//  Created by Luke Vellines on 4/10/24.
//
//  Luke Vellines, Michael utz
//  lvelline, mutz
//  Boss's Orders
// Apr 26
import SpriteKit
import UIKit

class ViewController: UIViewController, CurrentController, GameDelegate {
    func endGame() {
        endGameScreen()
    }
    
    @IBOutlet weak var Timer : UILabel!
    @IBOutlet weak var TasksView : UITextView!
    @IBOutlet weak var bestGame : UILabel!
    
    var skView: SKView!
    var scene: SKScene!
    override func viewWillAppear(_ animated: Bool) {
        getModel().delegate = self
        getModel().setCurrentController(c: self)
        Timer.text = getModel().getClock()
        TasksView.text = getModel().updateTasks()
        getBestGame()
        
    }
    
  
    
    @IBAction func startClock(){
        getModel().startTimer()
        getBestGame()
    }

    func updateClocks() {
        print("Clock ticked")
        let model = getModel()
        
        Timer.text = model.getClock()
        TasksView.text = model.updateTasks()
    }
    
    func getBestGame() {
        bestGame.text = String(getModel().bestGame)
    }
    
    func getModel() -> Model {
        let appDel = UIApplication.shared.delegate as? AppDelegate
        return appDel!.model
    }
    func endGameScreen() {
        let xSprite = XSprite()
        skView = SKView(frame: view.frame)
        scene = SKScene(size: view.frame.size)
        scene.backgroundColor = .white
        xSprite.position = CGPoint(x: scene.size.width/2, y: scene.size.height/2)
        scene.addChild(xSprite)
        
        let bestGameText = SKLabelNode(text: "Your Time : \(Timer.text ?? "0")")
        bestGameText.fontSize = 40
        bestGameText.fontColor = .black
        bestGameText.position = CGPoint(x: scene.size.width / 2, y: scene.size.height-100)
        scene.addChild(bestGameText)
        
        
        
        
        let text = SKLabelNode(text: "You're Fired!")
        text.fontSize = 40
        text.fontColor = .black
        text.position = CGPoint(x: scene.size.width / 2, y: 200)
        scene.addChild(text)
        print("X Sprite Position: \(xSprite.position)")
                print("Text Position: \(text.position)")
        
        
        
        
        skView.presentScene(scene)
        view.addSubview(skView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                self.skView.isHidden = true
            }
        
    }
    
    
      
}

