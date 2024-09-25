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

class MathViewController: UIViewController, CurrentController {
    @IBOutlet weak var Timer : UILabel!
    @IBOutlet weak var Question1 : UILabel!
    @IBOutlet weak var Question2 : UILabel!
    @IBOutlet weak var Question3 : UILabel!
    var qArray1 : [String] = ["5-2", "9/3", "1*3"]
    var qArray2 : [String] = ["6+6", "(12/1) * 1", "3*4"]
    var qArray3 : [String] = ["5+4", "9-2+2", "8+1"]
    @IBOutlet weak var answerBox1 : UITextField!
    @IBOutlet weak var answerBox2 : UITextField!
    @IBOutlet weak var answerBox3 : UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        getModel().setCurrentController(c: self)
        Timer.text = getModel().getClock()
        Question1.text = qArray1[Int.random(in: 0...2)]
        Question2.text = qArray2[Int.random(in: 0...2)]
        Question3.text = qArray3[Int.random(in: 0...2)]
        
        answerBox1.text = ""
        answerBox2.text = ""
        answerBox3.text = ""
    }
    
    @IBAction func submitPressed(sender: UIButton){
        if(answerBox1.text == "3" &&
           answerBox2.text == "12" &&
           answerBox3.text == "9"){
            getModel().attemptTask(attempt: "MathComplete")
        }
    }
    
    func updateClocks() {
        let model = getModel()
        
        Timer.text = model.getClock()
    }
    
    func getModel() -> Model {
        let appDel = UIApplication.shared.delegate as? AppDelegate
        return appDel!.model
    }
    
    
}
