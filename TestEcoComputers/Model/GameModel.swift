import Foundation

class GameModel {
    
    var hiddenNumber: Int = 0
    var guesses: Int = 0
    var lastNumber = String()
    
    var min = 1
    var max = 100
    
    func more() -> Int? {
        
        while min != max {
            var mid = (min + max) / 2
            
            if hiddenNumber > mid {
                min = mid + 1
                mid = (min + max) / 2
                lastNumber = "Your number is \(mid)?"
            }
            return mid
        }
        return nil
    }
    
    func less() -> Int? {
        
        while min != max {
            var mid = (min + max) / 2
            
            if hiddenNumber < mid {
                max = mid - 1
                mid = (min + max) / 2
                lastNumber = "Your number is \(mid)?"
            }
            return mid
        }
        return nil
    }
    func middleNumber() -> Int? {
        
        while min != max {
            let mid = ((min + max) / 2) - (min/2)
            
            if hiddenNumber == Int(mid) {
                lastNumber = "Your number is \(mid)!"
            }
            return mid
        }
        return nil
    }
}





