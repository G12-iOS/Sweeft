import UIKit

//MARK: ამოცანა 1
/*
 გვაქვს 1,5,10,20 და 50 თეთრიანი მონეტები. დაწერეთ ფუნქცია, რომელსაც გადაეცემა თანხა (თეთრებში)
 და აბრუნებს მონეტების მინიმალურ რაოდენობას, რომლითაც შეგვიძლია ეს თანხა დავახურდაოთ.
 */
func minSplit(_ amount: Int) -> Int {
    let dividers = [50, 20, 10, 5, 1]
    var rest = amount
    var count = 0
    
    for divider in dividers {
        count += rest / divider
        rest %= divider
        if rest == 0 { break }
    }
    return count
}

 /*
 let exampleOne = minSplit(9) //(1, 1, 1, 1, 5) -> 5
 print(exampleOne)
 let exampleTwo = minSplit(26) //(1, 5, 20) -> 3
 print(exampleTwo)
 let exampleThree = minSplit(172) //(1, 1, 20, 50, 50, 50) -> 6
 print(exampleThree)
 let exampleFour = minSplit(136) //(2, 1, 1, 1, 1) -> 6
 print(exampleFour)
*/



//MARK: ამოცანა 2
/*
 დაწერეთ ფუნქცია რომელიც დააჯამებს ციფრებს ორ რიცსხვს შორის.
 მაგალითად გადმოგვეცემა 19 და 22. მათ შორის ციფრების ჯამი იქნება :
 // 19, 20, 21, 22
 // (1 + 9) + (2 + 0) + (2 + 1) + (2 + 2) = 19
 */

// მოცემულ ამოცანაში პირობაა ფუნქციამ დააჯამოს ციფრები ორ რიცხვს შორის, თუმცა
// განსაზღვრული არაა მოიაზრება თუ არა სამნიშნა რიცხვები რადგან ყველა მაგალითი ორნიშნაა.
// მოცემული ფუნქცია მრავალნიშნა რიცხვებზეც მუშაობს

func sumOfDigits(_ start: Int, _ end: Int) -> Int {
    var total = 0
    for number in start...end {
        var n = number
        while n > 0 {
            total += n % 10
            n /= 10
        }
    }
    return total
}

// print(sumOfDigits(7, 8))
// print(sumOfDigits(17, 20))
// print(sumOfDigits(10, 12))
// print(sumOfDigits(99, 102))
// print(sumOfDigits(999, 1001))




//MARK: ამოცანა 3
/*
 მოცემულია String რომელიც შედგება „(" და „)" ელემენტებისგან. დაწერეთ ფუნქცია რომელიც აბრუნებს
 ფრჩხილები არის თუ არა მათემატიკურად სწორად დასმული.
 */


func isProperly(sequence: String) -> Bool {
    var balance = 0
    
    for char in sequence {
        if char == "(" {
            balance += 1
        } else if char == ")" {
            balance -= 1
        }
        
        if balance < 0 {
            return false
        }
    }
    return balance == 0
}

/*
 print(isProperly(sequence: "(()())"))  // true
 print(isProperly(sequence: ")(()"))    // false
 print(isProperly(sequence: "(()())(")) // false
 */



//MARK: ამოცანა 4

/*
 გვაქვს N ფიცრისგან შემდგარი ხიდი. სიძველის გამო ზოგიერთი ფიცარი ჩატეხილია. ზურიკოს შეუძლია
 გადავიდეს შემდეგ ფიცარზე ან გადაახტეს ერთ ფიცარს. (რათქმაუნდა ჩატეხილ ფიცარზე ვერ გადავა)
 ჩვენი ამოცანაა დავითვალოთ რამდენი განსხვავებული კომბინაციით შეუძლია ზურიკოს ხიდის გადალახვა.
 გადმოგვეცემა ხიდის სიგრძე და ინფორმაცია ჩატეხილ ფიცრებზე. 0 აღნიშნავს ჩატეხილ ფიცარს 1_ანი კი მთელს.
 დასაწყისისთვის ზურიკო დგას ხიდის ერთ მხარეს (არა პირველ ფიცარზე) და გადალახვად ჩათვლება ხიდის
 მეორე მხარე (ბოლო ფიცრის შემდეგი ნაბიჯი)
 */

func countWays(n: Int, steps: [Int]) -> Int {
    if n == 0 || steps.isEmpty || n != steps.count {
        return 0
    }
    
    guard steps.allSatisfy({ $0 == 0 || $0 == 1 }) else {
        return 0
    }
    
    
    var dp = Array(repeating: 0, count: n + 2)
    dp[0] = 1
    
    for i in 1...n {
        if steps[i - 1] == 1 {
            dp[i] = dp[i - 1] + (i > 1 ? dp[i - 2] : 0)
        }
    }
    dp[n + 1] = dp[n] + dp[n - 1]
    
    return dp[n + 1]
}

//let exampleOne = countWays(n: 3, steps: [1, 0, 1])
//let exampleTwo = countWays(n: 4, steps: [0, 1, 0, 1])
//let exampleThree = countWays(n: 9, steps: [1, 1, 1, 1, 1, 1, 1, 1, 1])
//print("\(exampleOne), \(exampleTwo), \(exampleThree)")


//MARK: ამოცანა 5
// გადმოგეცემათ მთელი რიცხვი N. დაწერეთ ფუნქცია რომელიც დაითვლის რამდენი 0ით ბოლოვდება N!(ფაქტორიალი)

func zeros(_ number: Int) -> Int {
    var count = 0
    var divisor = 5
    
    while number / divisor > 0 {
        count += number / divisor
        divisor *= 5
    }
    return count
}

//print(zeros(7))
//print(zeros(12))
//print(zeros(490))
