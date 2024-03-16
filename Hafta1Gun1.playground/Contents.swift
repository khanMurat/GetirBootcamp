import UIKit


func question1(){
   
    
    
}

func question2(input : String) {
    
    var splitList = input.split(separator: " ")
    
    var dict : [String:Int] = [:]
    
    for item in splitList {
        
        if dict[String(item)] == nil {
            dict[String(item)] = 1
        }else{
            dict[String(item)] = dict[String(item)]! + 1
        }
    }
    
    for (item,index) in dict {
        print("\(item) : \(index) kere geçiyor")
    }
}

func question4(){
  /*
    https://developer.apple.com/documentation/swift/hashable
    
  Dökümantasyonda incelendiğinde Set veri yapısının hashable protokolünü uyguladığını görüyoruz.Hashable
   diğer programlama dillerinde HashMap Swiftte Dictionary de de kullanılan bir protokol.Bu protokolü uygulayan yapılarda bir çeşit hash fonksiyonu uygulanır ve unique değerler atanır.Böylelikle bu unique değer aracılığıyla aranan elaman direk bulunabilir.
   
   Set hashable protokolünü uyguladığına göre Array için bulma zamanı O(n) dersek Set için bu O(1) diyebiliriz(çakışma olmadığını varsayarsak).Böylelikle Set ile daha hızlı istenen değere ulaşılabilir.
   
 */
}

// EULER QUESTIONS

func question5(range:Int) -> Int {
    
    var result = 0
    
    for i in 1..<range {
        
        if i % 3 == 0 || i % 5 == 0 {
            
            result += i
        }
        
    }
    return result
}

func question6(value:Int) -> Int {
    
    if value == 0 || value == 1 {
        return 1
    }
    
    return question6(value: value - 1) + question6(value: value - 2)
}

func question7(){
    
}
   

question2(input: "Merhaba nasılsınız iyiyim siz nasılsınız bende iyiyim")
question5(range: 10)
question6(value: 8)

