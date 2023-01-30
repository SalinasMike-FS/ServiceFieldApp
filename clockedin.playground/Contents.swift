import UIKit

//create a class that has a function that tracks clocked in time

class ClockIn {
    var clockInTime: Date?
    var clockOutTime: Date?
    
    func clockIn() {
        clockInTime = Date()
    }
    
    func clockOut() {
        clockOutTime = Date()
    }
    
    func timeWorked() -> TimeInterval {
        guard let clockInTime = clockInTime, let clockOutTime = clockOutTime else { return 0 }
        return clockOutTime.timeIntervalSince(clockInTime)
    }

    //create a function that starts a timer and stops it when clocked out
    func startTimer() {
        clockIn()
        Timer.scheduledTimer(withTimeInterval: timeWorked(), repeats: false) { _ in
            self.clockOut()
        }

        

    }

    //create a function that adds the time worked to a total time worked for the pay period

    func totalTimeWorked() -> TimeInterval {
        var totalTimeWorked: TimeInterval = 0
        totalTimeWorked += timeWorked()
        return totalTimeWorked
    }

//create a function that calculates the pay for the pay period
    
        func payPeriodPay() -> Double {
            let payRate: Double = 15.00
            let payPeriodPay = payRate * totalTimeWorked()
            return payPeriodPay
        }

//create a function that save the information 
    
        func save() {
            let defaults = UserDefaults.standard
            defaults.set(clockInTime, forKey: "clockInTime")
            defaults.set(clockOutTime, forKey: "clockOutTime")
            defaults.set(totalTimeWorked(), forKey: "totalTimeWorked")
            defaults.set(payPeriodPay(), forKey: "payPeriodPay")
        }
    




}

