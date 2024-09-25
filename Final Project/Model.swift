//
//  Model.swift
//  Final Project
//
//  Created by Utz, Michael Paul on 4/11/24.
//
//  Luke Vellines, Michael utz
//  lvelline, mutz
//  Boss's Orders
// Apr 26
import Foundation
import UserNotifications

//todo
//X Connect each view - M
//X Make tasks completable - M
//Make view have a task or more - L
//X Assign new task - M
//Persistent storage for best game - L (Currently using UserDefaults, will eventually be NSCoder)
//X Notify user shortly after app close to tell them the boss is waiting for them - M
//SpriteKit for timer of shortest task
//X End game when task is under 0 - M
//End game screen design (likely build atop task assignment screen with Core Graphics - L
//(Optional)Difficulties - L
//README (Each)
//Scheduling (Each)
protocol GameDelegate: AnyObject {
    func endGame()
}
class Model {
    var currentClock = 0
    var timer = Timer()
    var boss = Boss()
    var bestGame: Int = UserDefaults.standard.integer(forKey: "record")
    var difficulty = "Easy"
    var canNotify = false
    var gameEnd = false
    weak var delegate: GameDelegate?
    var cController : CurrentController?
    
    init(){
        scheduleNotification()
        bestGame = UserDefaults.standard.integer(forKey: "record")
        getSettings()
    }
    
    func setCurrentController(c : CurrentController){
        cController = c
    }
    
    func startTimer() {
        gameEnd = false
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(onClock), userInfo: nil, repeats: true)
        boss.clear()
        getSettings()
    }
    
    func endTimer(){
        timer.invalidate()
        currentClock = 0
    }
    
    func getClock() -> String {
        return String(currentClock)
    }
    
    @objc func onClock(){
        currentClock += 1
        
        boss.updateBoss(currTime: currentClock)
        
        cController?.updateClocks()
    }
    
    func endGame(){
        gameEnd = true
        if(bestGame < currentClock){
            bestGame = currentClock
            UserDefaults.standard.set(bestGame, forKey: "record")
            //persistant storage using userDefaults
        }
        
        endTimer()
        
        //HANDLE ENDING GAME
        print("Game over!")
    }
    
    func updateTasks() -> String {
        var toReturn = ""
        boss.getTasks().forEach { task in
            print(task.print(currentTime: currentClock))
            if(task.getStatus()){
                toReturn += "+ "
            } else if(task.taskOverdue(_currentTime: currentClock)) {
                toReturn += "-"
                delegate?.endGame()
                endGame()
                
                
            }
            toReturn += task.print(currentTime: currentClock)
            toReturn += "\n"
        }
        
        return toReturn
    }
    
    //Need to build other environments to call this once various tasks are completed
    func attemptTask(attempt : String){
        boss.attemptTask(attempt: attempt, currentClock: currentClock)
    }
    
    private func doAuthorization() {
        let center = UNUserNotificationCenter.current()
        var opts : UNAuthorizationOptions = [.alert, .sound, .badge,.providesAppNotificationSettings]
        
        center.requestAuthorization(options: opts) { ok, err in
            if let err = err {
                print(err)
                return
            }
            if ok {
                self.canNotify = true
            }
        }
    }
    
    private func scheduleNotification() {
        doAuthorization()
        if(!canNotify){
            return
        }
        
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        dateComponents.hour = 9 //Set to go off every morning a 9:01 the day after playing
        dateComponents.minute = 1
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        let content = UNMutableNotificationContent()
        content.title = "Clock in now!"
        content.body = "The boss is impatiently awaiting for your arrival to get to work!"
        content.sound = UNNotificationSound.default
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request)
        
        print("Scheduled!")
    }
    func getSettings() {
        let myDefaults = UserDefaults.standard

        difficulty = myDefaults.string(forKey: difficultyKey) ?? "Easy"
        boss.changeDiff(diff: difficulty)
    }
    
}
