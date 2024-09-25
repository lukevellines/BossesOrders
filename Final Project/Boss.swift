//
//  Boss.swift
//  Final Project
//
//  Created by Utz, Michael Paul on 4/18/24.
//
//  Luke Vellines, Michael utz
//  lvelline, mutz
//  Boss's Orders
// Apr 26
import Foundation

class Boss {
    var nextTaskTime = 1
    var tasks : [Task] = []
    
    var maxTaskWait = 10
    
    
    func assignTask(task : Task){
        tasks.append(task)
    }
    
    func changeDiff(diff : String){
        if(diff == "Hard"){
            maxTaskWait = 6
        } else {
            maxTaskWait = 10
        }
    }
    
    func clear(){
        nextTaskTime = 1
        tasks = []
    }
    
    func updateBoss(currTime : Int) {
        if(shouldGenerateTask(currTime: currTime)){
            assignTask(task: generateTask(currTime: currTime))
            
            nextTaskTime = currTime + Int.random(in: 4...maxTaskWait) //Make new task in this many seconds
        }
        
        if(tasks.count > 7){
            tasks.remove(at: 0)
        }
    }
    
    func shouldGenerateTask(currTime : Int) -> Bool {
        return (nextTaskTime <= currTime)
    }
    
    func generateTask(currTime : Int) -> Task {
        let rand = Int.random(in: 0...5)
        
        if(rand == 0) {
            return Task(TaskName: "Trivia: Boss Back", TaskKey: "Question 1Y", TimeDue: 15 + currTime)
        } else if (rand == 1) {
            return Task(TaskName: "Clean", TaskKey: "CleanedOut", TimeDue: 20 + currTime)
        } else if (rand == 2) {
            return Task(TaskName: "Trivia: New Ink", TaskKey: "Question 2Y", TimeDue: 15 + currTime)
        } else if (rand == 3) {
            return Task(TaskName: "Trivia: Minor Fire", TaskKey: "Question 2N", TimeDue: 15 + currTime)
        } else if (rand == 4) {
            return Task(TaskName: "Math", TaskKey: "MathComplete", TimeDue: 30 + currTime)
        }
        
        return Task(TaskName: "Trivia: Boss Left", TaskKey: "Question 1N", TimeDue: 15 + currTime)
    }
    
    func getTasks() -> [Task] {
        return tasks
    }
    
    func attemptTask(attempt : String, currentClock : Int){
        getTasks().forEach{ task in
            task.matchTask(taskAttempt: attempt, currentTime: currentClock)
        }
    }
}
