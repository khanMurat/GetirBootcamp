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


question1(index: 2)
question2(num: 63636)
let array = question3(array: ["murat","burak","ronaldo"]) {return $0.count}
let array2 = question3(array: [1,2,3,4,5]) { return String($0)}
print(array)
print(array2)

