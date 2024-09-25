//
//  Task.swift
//  Final Project
//
//  Created by Utz, Michael Paul on 4/11/24.
//
//  Luke Vellines, Michael utz
//  lvelline, mutz
//  Boss's Orders
// Apr 26
import Foundation

class Task {
    let completeTime : Int
    let name : String
    let key : String
    var completed = false
    var timeCompleted = -1
    
    init(TaskName : String, TaskKey : String, TimeDue : Int){
        name = TaskName
        completeTime = TimeDue
        key = TaskKey
    }
    
    func setComplete(){
        completed = true
    }
    
    func getStatus() -> Bool {
        return completed
    }
    
    func timeLeft(currentTime : Int) -> Int {
        if (!getStatus()) {
            return completeTime - currentTime
        }
        
        return timeCompleted
    }
    
    func taskOverdue(_currentTime : Int) -> Bool {
        return (timeLeft(currentTime: _currentTime) <= 0)
    }
    
    func getName() -> String {
        return name
    }
    
    func getKey() -> String {
        return key
    }
    
    func matchTask(taskAttempt : String, currentTime : Int) -> Bool {
        if(getKey() == taskAttempt) {
            timeCompleted = timeLeft(currentTime: currentTime)
            completed = true
        }
        
        return getStatus()
    }
    
    func print(currentTime : Int) -> String {
        return getName() + " - " + String(max(0, timeLeft(currentTime: currentTime))) + " Seconds Left"
    }
}
