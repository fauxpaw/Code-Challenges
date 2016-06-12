//: Playground - noun: a place where people can play

import UIKit

//problem #2
//convert an int to a base 16 number (aka hexadecimal)
func findHex (input: Int) -> String {
    func convertToBase16(input: Int) -> String{
        let dict = [10: "A", 11: "B", 12: "C", 13: "D", 14: "E", 15: "F"]
        let quotient = input/16
        let remainder = input % 16
        
        if input < 10
        {
            return "\(input)"
        }
        else if remainder > 9
        {
            return "\(convertToBase16(quotient))\(dict[remainder]!)"
        }
        else
        {
            return "\(quotient)\(remainder)"
        }
    }
    return "0x\(convertToBase16(input))"
}

//test examples given

findHex(9)
findHex(1452)
findHex(62)
findHex(919162387162387613)
findHex(7462741274687)

//------------------------------------------------------------------------------------


//Problem #1
//write a function that checks an array for palindromes
func checkArrayForPalindrome(input: [String]) -> [String]{
    func checkTwoCharacters (input: String) -> Bool {
        
        if !input.isEmpty {
            //convert string to lowercase
            let wordCopy = input.lowercaseString
            var count = 0
            //specify current pointers to corresponding characters
            var startIndex = wordCopy.startIndex
            var endIndex = wordCopy.endIndex.predecessor()
            
            //for as long as the characters match, we will move to the next set of characters
            while (wordCopy[startIndex] == wordCopy[endIndex]) && (count < wordCopy.characters.count/2 )
            {
                count+=1
                startIndex = startIndex.successor()
                endIndex = endIndex.predecessor()
            }
            
            return count == wordCopy.characters.count/2
        }
        //if input is empty string declare false
        return false
    }
    return input.filter{checkTwoCharacters($0)}
    
}

let myArray = ["sun", "moon", "racecar", "firehouse", "dad", "Mom"]
let otherArray = ["civic", "eye", "nova", "swift", "refer", "wow", "rotator", "kayak", "noon", "pepper", "madam"]

checkArrayForPalindrome(myArray)
checkArrayForPalindrome(otherArray)

//-------------------------------------------------------------------------------------

//problem #3
//convert roman numeral string to int



func convertRomanNumeralToArabicNumber (input: String) -> Int
{
    func checkValidInput(input: String) -> Bool {
        for char in input.characters {
            switch char {
            case "I" :
                print("I is valid")
            case "X" :
                print("X is valid")
            case "V" :
                print("V is valid")
            case "L" :
                print("L is valid")
            case "M" :
                print("M is valid")
            case "C":
                print("C is valid")
            case "D" :
                print("D is valid")
            default :
                print("String not a valid roman numeral")
                return false
            }
        }
        return true
    }

    checkValidInput(input)
    
    let romanDictionary = ["I": 1, "V" : 5, "X" : 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    
    func romanToArabic(input: String) -> [Int]? {
        var intArray = [Int]()
        for character in input.characters {
            guard let int = romanDictionary[String(character)] else { return nil}
            intArray.append(int)
        }
        return intArray
    }
    
    func evaluateIntArray(arr : [Int])-> Int{
        
        var runningTotal = 0
        
        if !arr.isEmpty
        {
            //work right to left
            var currentIndex = arr.count - 1
            runningTotal = arr[currentIndex]
            
            while (currentIndex-1) >= 0{
                arr[currentIndex] <= arr[currentIndex-1] ? (runningTotal += arr[currentIndex-1]) : (runningTotal -= arr[currentIndex-1])
                currentIndex -= 1
            }
        }
        return runningTotal
    }
    guard let arrayOfInts = romanToArabic(input) else { return 0}
    return evaluateIntArray(arrayOfInts)
    
}

convertRomanNumeralToArabicNumber("XXII")
convertRomanNumeralToArabicNumber("IX")
convertRomanNumeralToArabicNumber("ABC")