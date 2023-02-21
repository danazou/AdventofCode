//
//  test.swift
//  AdventofCode2022
//
//  Created by Dana Zou on 10/12/2022.
//

import Foundation

func test() {
//print(Int(Array("a".utf8)[0]))
    let s = "[[9,2],[],[10,[6,1],5,4]]"
    
    let pattern = "([0-9.]+)*([A-Za-z]+)"
    // our goal is capture group 3, "h" in "ha"
    let regex = try! NSRegularExpression(pattern: pattern)
    let result = regex.matches(in:s, range:NSMakeRange(0, s.utf16.count))
    print (result)
    }

/*
 func compareInt (_ one: Int, _ two: Int) -> Bool? {
     if one > two {
         return false
     } else if one < two {
         return true
     }
     
     return nil
 }
 
 func compare (_ pairOne: [Any], _ pairTwo: [Any]) -> Bool? {
     var isRightOrder: Bool? = nil
     print("pairs: \(pairOne), \(pairTwo)")
     
//        if pairOne.count > pairTwo.count {
//            print ("counts: \(pairOne.count), \(pairTwo.count)")
//            isRightOrder = false
//            print ("order is: \(isRightOrder)")
//            return isRightOrder
//        }
     
     for (i, item) in pairTwo.enumerated() {
         if i > pairOne.count - 1 {
             // left ran out of items first
             print ("left ran out of items first")
             isRightOrder = false
             return isRightOrder
         }
         
         let pairOneInt: Int = pairOne[i] as? Int ?? -1
         let pairTwoInt: Int = item as? Int ?? -1
         
         print ("items: \(pairOne[i]), \(item)")
//            print (pairOneInt, pairTwoInt)
         if pairOneInt != -1 && pairTwoInt != -1 {
             // both items are integers
             if let isRightOrder = compareInt(pairOneInt, pairTwoInt) {
                 return isRightOrder
             }
         } else if pairOneInt == -1 && pairTwoInt == -1 {
             print ("both items are lists")
             let pairOneArray: [Any] = pairOne[i] as! [Any]
             let pairTwoArray = item as! [Any]
             isRightOrder = compare(pairOneArray, pairTwoArray)
             return isRightOrder
         } else if (pairOneInt == -1 && pairTwoInt != -1) || (pairOneInt != -1 && pairTwoInt == -1) {
             //one is list
             print ("mixed types, converting and retrying")
             switch (pairOneInt, pairTwoInt) {
             case (-1 , _):
                 let pairOneArray: [Any] = [pairOne[i]]
                 let pairTwoConverted = item as! [Any]
                 isRightOrder = compare(pairOneArray, pairTwoConverted)
                 return isRightOrder
             case (_, -1):
                 let pairOneConverted = [pairOneInt]
                 let pairTwoArray: [Any] = item as! [Any]
                 isRightOrder = compare(pairOneConverted, pairTwoArray)
                 return isRightOrder
             default:
                 print ("default case triggered")
                 continue
             }
//                print ("pairOne is list")
//                let pairTwoConverted = [pairTwo[i]]
//                let pairOneArray: [Any] = item as! [Any]
//                isRightOrder = compare(pairOneArray, pairTwoConverted)

//            } else if pairOneInt != -1 && pairTwoInt == -1 {
//                print ("pairTwo is list")
//                let pairOneConverted = [pairOneInt]
//                let pairTwoArray: [Any] = pairTwo[i] as! [Any]
//                isRightOrder = compare(pairOneConverted, pairTwoArray)


//            } else if pairOneInt > pairTwoInt {
//                print ("pairOne value is greater than pairTwo")
//                isRightOrder = false
             
         }

     }
     
     print ("order is: \(isRightOrder)")
     return isRightOrder
 }

 */
