import Foundation

struct GameModel {
    
    var secretNumber: Int
    var guesses: Int
    var lastNumber = ""
    
    var min = 1
    var max = 100
    
    mutating func more() -> Int? {
        
        while min != max {
            var mid = (min + max) / 2
            
            if secretNumber > mid {
                self.guesses += 1
                min = mid + 1
                mid = (min + max) / 2
                lastNumber = "Your number is \(mid)?"
            } else {
                print("error")
            }
            return mid
        }
        return nil
    }
    
    mutating func less() -> Int? {
        
        while min != max {
            var mid = (min + max) / 2
            
            if secretNumber < mid {
                self.guesses += 1
                max = mid - 1
                mid = (min + max) / 2
                lastNumber = "Your number is \(mid)?"
            }
            return mid
        }
        return nil
    }
}

