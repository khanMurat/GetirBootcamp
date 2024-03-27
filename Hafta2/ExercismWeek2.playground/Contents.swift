import UIKit


//Sum of Multiples

func toLimit(_ limit: Int, inMultiples: [Int]) -> Int {

    var set = Set<Int>()
    var result = 0
    
    guard !inMultiples.isEmpty else {return 0}

    for value in inMultiples {
        
        if value == 0 {
            continue
        }
        for i in 1..<limit {
            
            if i % value == 0 {
                
                set.insert(i)
                print(value)
            }
        }
    }

   return set.reduce(0,+)
}

toLimit(4, inMultiples: [])

// *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

// Sum Square Difference

func squareOfSum(n:Int) -> Int {

    var sumSquare = 0
    var squareSum = 0
    
    for i in 1...n {

        sumSquare += i
    }

    sumSquare = sumSquare * sumSquare

    for i in 1...n {

        squareSum += (i * i)
    }

    return abs(squareSum - sumSquare)
}

// *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

//RNA Transcription

func toRna(_ dna: String) -> String {
  // Write your code for the 'Rna Transcription' exercise in this file.
    var rna = ""
    
    let dict : [String:String] = [
        "G": "C",
        "C": "G",
        "T": "A",
        "A": "U"
    ]

    for char in dna {
        let value = dict[String(char)]
        if  value != nil {

          rna.append(value!)
        }
    }
    return rna
}

// *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

//Gigasecond

func gigasecond(from: Date) -> Date {
  // Write your code for the 'Gigasecond' exercise in this file.
    
    return from.addingTimeInterval(1_000_000_000)
}

gigasecond(from: Date.now)

// *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

//Accumulate

extension Collection {
    func accumulate<T>(_ operation: (Element) -> T) -> [T] {
        var result: [T] = []
        for item in self {
            result.append(operation(item))
        }
        return result
    }
}

// *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

// Write your code for the 'TwoFer' exercise in this file.

func twoFer(name : String? = nil) -> String {

    if let name = name {
       return "One for \(name), one for me."
    }else if name == ""{
        return "One for you, one for me."
    }else{
       return "One for you, one for me."
    }
}

// *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

// Leap Year

class Year {
  // Write your code for the 'Leap' exercise in this file.
    var calendarYear : Int

    init(calendarYear:Int){
           self.calendarYear = calendarYear
    }

    var isLeapYear : Bool {

        if calendarYear % 4 == 0 {

            if calendarYear % 100 == 0 {

                if calendarYear % 400 == 0 {
                        return true
                }else{
                     return false
                }
            }else{
                 return true
            }
        }else{
             return false
        }
    }
}

// *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

//Reverse String

func reverseString(_ input : String) -> String {
    // Write your code for the 'Reverse String' exercise in this file.

    var array = [String]()
    var result = ""
    
    for char in input {
        array.insert(String(char), at: 0)
    }
    
    array.forEach { value in
        result.append(value)
    }
    return result
}

// *-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*--*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

class Bob {
  static func response(_ message: String) -> String {
      
    let trimmedMessage = message.trimmingCharacters(in: .whitespacesAndNewlines)
    let isQuestion = trimmedMessage.hasSuffix("?")
    let isYelling = trimmedMessage.uppercased() == trimmedMessage && trimmedMessage.rangeOfCharacter(from: CharacterSet.letters) != nil
    let isSilent = trimmedMessage.isEmpty
    
    if isYelling && isQuestion {
      return "Calm down, I know what I'm doing!"
    } else if isYelling {
      return "Whoa, chill out!"
    } else if isQuestion {
      return "Sure."
    } else if isSilent {
      return "Fine. Be that way!"
    } else {
      return "Whatever."
    }
  }
}


Bob.response("Fine. Be that way!")
