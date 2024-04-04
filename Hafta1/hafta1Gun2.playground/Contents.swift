import UIKit


// Question 1
//Fonksiyonun parametre oalrak verilen sayıya göre + - karakterlerini ekrana yazdıran bir fonksiyon yazınız
//Örneğin; 1 için sadece +, 2 için +-, 5 için +-+-+ şeklinde

func question1(index:Int){
    
    guard index != 0 else {
        print("0 dan büyük bir sayı giriniz!")
        return}
    
    var result = ""
    
    for i in 1...index{
        if i % 2 == 0 {
            result.append("-")
        }else{
            result.append("+")
        }
    }
    print(result)
    
}

//Question 2
//Fonksiyona parametre olarak verilen sayıyı en büyük yapacak şekilde 5 sayısını ilgili basamağa koyunuz. Örneğin; parametre 0 için çıktı 50 olmalıdır. Parametre 28 için 528, parametre 920 için 9520 olmalıdır

func question2(num:Int){
    
    guard num > 0 else {
        print("0 dan büyük bir sayı giriniz.")
        return}
    
    var intStr = Array(String(num))
  
    for (index,char) in intStr.enumerated() {
        
        if char < "5" {
            intStr.insert("5", at: index)
            break
        }else{
            if index == intStr.count - 1 {
                intStr.insert("5", at: index + 1)
            }
        }
    }
    print(String(intStr))
}

//Question3
//HW: Iki parametreli ve FARKLI tipli bir generic ornegi yapiniz (T, U)

func question3<T,U>(array : [T],transform : (T) -> U) -> [U] {
    
    var transformedArray = [U]()
    
    for item in array {
        
        let transformedItem = transform(item)
        
        transformedArray.append(transformedItem)
    }
    return transformedArray
}

// EULER

//What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

func ebob(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return ebob(b, a % b)
    }
}

func ekok(_ a: Int, _ b: Int) -> Int {
    return a * b / ebob(a, b)
}

func enKucukOrtakKat() -> Int {
    var sonuc = 1
    for i in 1...10 {
        sonuc = ekok(sonuc, i)
    }
    return sonuc
}

// Sum Square Difference

func findDifference(n:Int) -> Int {

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

//Largest Product in a Series
//Problem 8

func largestProduct(in numberString: String) -> Int {
    let digits = numberString.compactMap { Int(String($0)) }
    var maxProduct = 0

    for i in 0...digits.count - 13 {
        var product = 1
        for j in 0..<13 {
            product *= digits[i + j]
        }
        maxProduct = max(maxProduct, product)
    }

    return maxProduct
}


largestProduct(in:"7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188")

findDifference(n: 10)
question1(index: 2)
question2(num: 63636)
let array = question3(array: ["murat","burak","ronaldo"]) {return $0.count}
let array2 = question3(array: [1,2,3,4,5]) { return String($0)}
print(array)
print(array2)
print(enKucukOrtakKat())

