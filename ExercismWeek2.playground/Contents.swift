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
