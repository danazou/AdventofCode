//
//  day11Monkey.swift
//  AdventofCode2022
//
//  Created by Dana Zou on 14/12/2022.
//

import Foundation

class Monkey {
    var items: [Int]
    var itemsPart2: [[Int]] = []
    let operation: (Int) -> Int
    let test: (Int) -> Bool
    let isTrue: Int
    let isFalse: Int
    let testNum: Int
    
    // don't need inspectionConut here as we're keeping track outside
    var inspectionCount = 0
    var inspectionCountPart2 = 0

    init(items: [Int], operation: (String, Int), test: @escaping (Int) -> Bool, isTrue: Int, isFalse: Int, testNum: Int) {
        
        func operationFunction(worry:Int) -> Int {
            if operation.1 > 0 {
                switch operation.0 {
                case "*":
                    return worry * operation.1
                case "+":
                    return worry + operation.1
                default:
                    return 0
                }
            } else {
                switch operation.0 {
                case "*":
                    return worry * worry
                case "+":
                    return worry + worry
                default:
                    return 0
                }
            }
        }
                
        self.items = items
        self.operation = operationFunction
        self.test = test
        self.isTrue = isTrue
        self.isFalse = isFalse
        self.testNum = testNum
    }
    
    func inspect() -> (to: Int, item: Int) {
        self.inspectionCount += 1
        let worry = operation(items[0]) / 3
//        print ("worry: \(worry)")
        self.items.removeFirst()
//        print("items: \(self.monkeyDescription)")
        if test(worry) {
            return (isTrue, worry)
        } else {
            return (isFalse, worry)
        }
    }
    
    func receive(_ item: Int) {
        self.items.append(item)
//        print ("receiving monkey items: \(self.monkeyDescription)")
    }
    
    func initZValues(numOfMonkeys: Int, monkeys: [Monkey]){
        for item in items{
            var zValues: [Int] = []
            for i in 0..<numOfMonkeys{
                zValues.append(item % monkeys[i].testNum)
            }
            self.itemsPart2.append(zValues)
            zValues = []
        }
    }
    
    func inspectPart2(numOfMonkeys: Int, _ i : Int, _ monkeys: [Monkey]) -> (to: Int, itemZValues: [Int]){
//        print("current Z Values: \(itemsPart2[0])")
        inspectionCountPart2 += 1
        updateZValues(numOfMonkeys: numOfMonkeys, monkeys)
//        print("new Z Values: \(itemsPart2[0])")
        let items = itemsPart2.removeFirst()
//        print("item Z Values to be passed: \(items)")
        if items[i] == 0 {
            return (isTrue, items)
        } else {
            return (isFalse, items)
        }
    }
    
    func updateZValues(numOfMonkeys: Int, _ monkeys: [Monkey]) {
        var zValues = itemsPart2[0] // always inspecting the first item
        for i in 0..<numOfMonkeys {
            let z = zValues[i]
            let newZ = operation(z) % monkeys[i].testNum
            zValues[i] = newZ
        }
        itemsPart2[0] = zValues
//        print("Updated z values: \(zValues)")
    }
    
    func receivePart2(_ itemZValues: [Int]){
        self.itemsPart2.append(itemZValues)
    }
    
    
    /*
     func part2Inspect() -> (to: Int, item: [Int]):
        self.inspectionCount += 1
        for i in numOfMonkeys.indices:
            updateZValues
        let items = self.part2Items.removeFirst()
        if items[which monkey] == 0 : i.e. test is true
            return (isTrue, items)
        else:
            return (isFalse, items)
     
     func updateZValues(numOfMonkeys: Int) :
        let zValues = part2Items[0] // always inspecting the first item
        for i in 0..<numOfMonkeys:
            let z = zValues[i]
            let newZ = operation(z) % testNum
            zValues[i] = newZ
     
     func part2Receive(_ item: [Int]):
        self.part2Items.append(item)

     */
    var monkeyDescription: String {
        return ("\(itemsPart2), inspected items \(inspectionCount) times")
    }
}
