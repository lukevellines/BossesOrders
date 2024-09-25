//
//  CleaningViewController.swift
//  Final Project
//
//  Created by Utz, Michael Paul on 4/18/24.
//
//  Luke Vellines, Michael utz
//  lvelline, mutz
//  Boss's Orders
// Apr 26
import UIKit

class CleaningViewController: UIViewController, CurrentController {
    @IBOutlet weak var Timer : UILabel!
    @IBOutlet weak var Spot1 : UIButton!
    @IBOutlet weak var Spot2 : UIButton!
    @IBOutlet weak var Spot3 : UIButton!
    @IBOutlet weak var Spot4 : UIButton!
    @IBOutlet weak var Spot5 : UIButton!
    @IBOutlet weak var Spot6 : UIButton!
    @IBOutlet weak var Spot7 : UIButton!
    var clickCounter = 0
    var spotColors: [UIColor] = [UIColor.yellow, UIColor.green, UIColor.brown]

    override func viewWillAppear(_ animated: Bool) {
        getModel().setCurrentController(c: self)
        Timer.text = getModel().getClock()
        cleaningTaskAssigned()
    }

    func updateClocks() {
        let model = getModel()
        
        Timer.text = model.getClock()
    }
    
    func submitCleaningTask() {
        if(clickCounter >= 7){
            getModel().attemptTask(attempt: "CleanedOut")
        }
    }
    
    func getModel() -> Model {
        let appDel = UIApplication.shared.delegate as? AppDelegate
        return appDel!.model
    }
    func cleaningTaskAssigned() {
        Spot1.tintColor = spotColors[Int.random(in: 0...2)]
        Spot2.tintColor = spotColors[Int.random(in: 0...2)]
        Spot3.tintColor = spotColors[Int.random(in: 0...2)]
        Spot4.tintColor = spotColors[Int.random(in: 0...2)]
        Spot5.tintColor = spotColors[Int.random(in: 0...2)]
        Spot6.tintColor = spotColors[Int.random(in: 0...2)]
        Spot7.tintColor = spotColors[Int.random(in: 0...2)]
        clickCounter = 0

    }
    @IBAction func Spot1Press(sender:UIButton){
        Spot1.tintColor = UIColor.white
        clickCounter += 1
        submitCleaningTask()
    }
    @IBAction func Spot2Press(sender:UIButton){
        Spot2.tintColor = UIColor.white
        clickCounter += 1
        submitCleaningTask()
    }
    @IBAction func Spot3Press(sender:UIButton){
        Spot3.tintColor = UIColor.white
        clickCounter += 1
        submitCleaningTask()
    }
    @IBAction func Spot4Press(sender:UIButton){
        Spot4.tintColor = UIColor.white
        clickCounter += 1
        submitCleaningTask()
    }
    @IBAction func Spot5Press(sender:UIButton){
        Spot5.tintColor = UIColor.white
        clickCounter += 1
        submitCleaningTask()
    }
    @IBAction func Spot6Press(sender:UIButton){
        Spot6.tintColor = UIColor.white
        clickCounter += 1
        submitCleaningTask()
    }
    @IBAction func Spot7Press(sender:UIButton){
        Spot7.tintColor = UIColor.white
        clickCounter += 1
        submitCleaningTask()
    }
}
