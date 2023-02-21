//
//  day11.swift
//  AdventofCode2022
//
//  Created by Dana Zou on 14/12/2022.
//

import Foundation

func day11() {
    let input = day11PuzzleInput.split(separator: "\n")
    var monkeyGuide: [[String]] = []
    var monkeyInfo: [String] = []
    
    for line in input {
        monkeyInfo.append(String(line))
        if monkeyInfo.count == 6 { // each chunk of text in input is six lines
            monkeyGuide.append(monkeyInfo)
            monkeyInfo = []
        }
    }
    
    func findInt (in input: String, separator: Character) -> [Int] {
        return input.split(separator: separator).filter({Int($0) != nil}).map({Int($0)!})
    }
    
    var monkeys: [Monkey] = []

    // initialise each Monkey based on input
    for monkey in monkeyGuide {
        // get items
        var items: [Int] = []
        let itemsStr = monkey[1].components(separatedBy: CharacterSet.decimalDigits.inverted)
        for item in itemsStr {
            if let number = Int(item) {
                items.append(number)
            }
        }
        
        // get operation
        let operationStr = monkey[2].split(separator: "=").last!.split(separator: " ")
        let operation = (String(operationStr[1]), Int(operationStr[2]) ?? 0 ) // identifies operator & number, if not number (i.e. "old"), returns 0
        
        // get test
        let testNum = findInt(in: monkey[3], separator: " ").first!
        func testFunction (_ num: Int) -> Bool {
            num % testNum == 0
        }
        
        let test = testFunction
        
        let isTrue = findInt(in: monkey[4], separator: " ").first!
        let isFalse = findInt(in: monkey[5], separator: " ").first!
        
        monkeys.append(Monkey(items: items, operation: operation, test: test, isTrue: isTrue, isFalse: isFalse, testNum: testNum))
    }
    
//    for monkey in monkeys {
//        print(monkey.monkeyDescription)
//    }
    var inspectionCount = Array(repeating: 0, count: monkeys.count)
    
//    for _ in 0..<20 {
//        for (i, monkey) in monkeys.enumerated() {
////            print ("monkey: \(monkey)")
//            while !monkey.items.isEmpty {
//                let output = monkey.inspect()
//                print("output: \(output)")
//                monkeys[output.to].receive(output.item)
//                inspectionCount[i] += 1
//                print(monkeys[output.to].items)
//            }
//        }
//    }
//    inspectionCount.sort(by: >)
//    print (inspectionCount[0] * inspectionCount[1])
    
    // Part II
    
    var inspectionCountPart2 = Array(repeating: 0, count: monkeys.count)
    // create an array of z values for each item
    for monkey in monkeys {
        monkey.initZValues(numOfMonkeys: monkeys.count, monkeys: monkeys)
//        print(monkey.monkeyDescription)
    }
    
    for _ in 0..<10000 {
        for (i, monkey) in monkeys.enumerated(){
            while !monkey.itemsPart2.isEmpty{
                inspectionCountPart2[i] += 1
                let output = monkey.inspectPart2(numOfMonkeys: monkeys.count, i, monkeys)
                monkeys[output.to].receivePart2(output.itemZValues)
            }
        }
    }
    
    print(inspectionCountPart2)
    inspectionCountPart2.sort(by: >)
    print (inspectionCountPart2[0] * inspectionCountPart2[1])
    
}

/*

 for monkey in monkeys:
    let zValues = []
    for item in monkey.itmes:
        for i in 0..< monkeys.count:
            zValues.append(item % monkeys[i].testNum) // -> need for each monkey
        monkey.part2Items = zValues
        zValues = []
 
 func initZValues(numOfMonkeys: Int):
    for item in items:
        let zValues = []
        for i in 0..<numOfMonkeys:
            zValues.append(item % monkeys[i].testNum)
        self.part2Items = zValues
        zValues = []
 
 what about making this a function in Monkey?
 can't do it while initialising Monkey because we don't know other monkeys' testNum yet
 
 
 Monkey 0:
   Starting items: 79, 98
        // where $0 is operand
   Operation: new = old * 19
        // split at ": ", old =
   Test: divisible by 23
        // where Int($0) != nil
     If true: throw to monkey 2
     If false: throw to monkey 3
 
 for each item, keep track of an array of z, where z = x % a(m)
 each time monkey inspects the item, z = f(x % a(m)) % a(m)
 
        x % a1 = r
     f(x) % a1 = f(r) % a1
 
    f(x) % a1 % a2 = f(r) % a1 - correct
 
    f(x) = new x; f(r) % a = new r
 
     f(x) % a2 = r
  g(f(x)) % a2 = g(r) % a2
 
 f(x) % a2 =  (f(x) % a1) % a2 -> r
 
 
    (a + v) % a2 = r
     g(a+v) % a2 = g(r) % a2
 
 
 */


let day11DemoInput =
"""
Monkey 0:
  Starting items: 79, 98
  Operation: new = old * 19
  Test: divisible by 23
    If true: throw to monkey 2
    If false: throw to monkey 3

Monkey 1:
  Starting items: 54, 65, 75, 74
  Operation: new = old + 6
  Test: divisible by 19
    If true: throw to monkey 2
    If false: throw to monkey 0

Monkey 2:
  Starting items: 79, 60, 97
  Operation: new = old * old
  Test: divisible by 13
    If true: throw to monkey 1
    If false: throw to monkey 3

Monkey 3:
  Starting items: 74
  Operation: new = old + 3
  Test: divisible by 17
    If true: throw to monkey 0
    If false: throw to monkey 1
"""

let day11PuzzleInput =
"""
Monkey 0:
  Starting items: 91, 66
  Operation: new = old * 13
  Test: divisible by 19
    If true: throw to monkey 6
    If false: throw to monkey 2

Monkey 1:
  Starting items: 78, 97, 59
  Operation: new = old + 7
  Test: divisible by 5
    If true: throw to monkey 0
    If false: throw to monkey 3

Monkey 2:
  Starting items: 57, 59, 97, 84, 72, 83, 56, 76
  Operation: new = old + 6
  Test: divisible by 11
    If true: throw to monkey 5
    If false: throw to monkey 7

Monkey 3:
  Starting items: 81, 78, 70, 58, 84
  Operation: new = old + 5
  Test: divisible by 17
    If true: throw to monkey 6
    If false: throw to monkey 0

Monkey 4:
  Starting items: 60
  Operation: new = old + 8
  Test: divisible by 7
    If true: throw to monkey 1
    If false: throw to monkey 3

Monkey 5:
  Starting items: 57, 69, 63, 75, 62, 77, 72
  Operation: new = old * 5
  Test: divisible by 13
    If true: throw to monkey 7
    If false: throw to monkey 4

Monkey 6:
  Starting items: 73, 66, 86, 79, 98, 87
  Operation: new = old * old
  Test: divisible by 3
    If true: throw to monkey 5
    If false: throw to monkey 2

Monkey 7:
  Starting items: 95, 89, 63, 67
  Operation: new = old + 2
  Test: divisible by 2
    If true: throw to monkey 1
    If false: throw to monkey 4
"""
