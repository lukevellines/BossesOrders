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

class TriviaViewController: UIViewController, CurrentController {
    @IBOutlet weak var Timer : UILabel!
    
    @IBOutlet weak var Question1 : UILabel!

    override func viewWillAppear(_ animated: Bool) {
        getModel().setCurrentController(c: self)
        Timer.text = getModel().getClock()
    }
    
    func updateClocks() {
        print("Clock ticked")
        let model = getModel()
        
        Timer.text = model.getClock()
    }
    
    @IBAction func Q1Positive(){
        triviaSubmission(submission: "Question 1Y")
    }
    
    @IBAction func Q1Negitive(){
        triviaSubmission(submission: "Question 1N")
    }
    
    @IBAction func Q2Positive(){
        triviaSubmission(submission: "Question 2Y")
    }
    
    @IBAction func Q2Negitive(){
        triviaSubmission(submission: "Question 2N")
    }
    
    func triviaSubmission(submission : String){
        //Ensure submission is equal to task's key
        //May be any unique string, this is temporary to show how to do it
        getModel().attemptTask(attempt: submission)
    }
    
    func getModel() -> Model {
        let appDel = UIApplication.shared.delegate as? AppDelegate
        return appDel!.model
    }
}
