import UIKit

// EULER QUESTION 6

func squareOfSum(num:Int) -> Int {
    
    
    var sumSquare = 0
    var squareSum = 0
    
    for i in 1...num {

        sumSquare += i
    }

    sumSquare = sumSquare * sumSquare

    for i in 1...num {

        squareSum += (i * i)
    }

    return (squareSum - sumSquare)
    
    }

squareOfSum(num: 10)
