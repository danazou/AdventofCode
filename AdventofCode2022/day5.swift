//
//  day5.swift
//  AdventofCode2022
//
//  Created by Dana Zou on 05/12/2022.
//

import Foundation

func day5(){
    let input = day5PuzzleInput.split(separator: "\n", omittingEmptySubsequences: false).map{String($0)}
    
    let separator = input.firstIndex(where: {$0.isEmpty}) ?? 0
    
    let stackData = Array(input[..<(separator-1)]).map{Array($0)}
    let numberOfStacks = input[separator-1].max()?.wholeNumberValue ?? 0
    // Value of optional type 'String.Element?' (aka 'Optional<Character>') must be unwrapped to refer to member 'wholeNumberValue' of wrapped base type 'String.Element' (aka 'Character'). Chain the optional using '?' to access member 'wholeNumberValue' only for non-'nil' base values
    var stacksPart1: [[String]] = Array(repeating: [], count: numberOfStacks)
    
    for row in stackData {
        for crateIndex in stride(from: 1, to: row.count, by: 4){
            if row[crateIndex] != " " {stacksPart1[crateIndex/4].insert(String(row[crateIndex]), at: 0)}
        }
    }
    
    let instructionData = Array(input[(separator+1)...])
    let instructions: [[Int]] = instructionData.map{
        $0.split(separator: " ").filter{Int($0) != nil}.map{Int($0) ?? 0}
    }
    
    for instruction in instructions {
        let cratesToMove = instruction[0]
        let start = instruction[1] - 1
        let end = instruction[2] - 1
        
        var cratesMoved = 0
        while cratesMoved < cratesToMove {
            stacksPart1[end].append(stacksPart1[start].removeLast())
            cratesMoved += 1
        }
    }
    
    var topCrates9000: String = ""

    for stack in stacksPart1 {
        topCrates9000 += stack.last!
    }

    print (topCrates9000)
    
    //PART II
    
    var stacksPart2: [[String]] = Array(repeating: [], count: numberOfStacks)
        
    for row in stackData {
        for crateIndex in stride(from: 1, to: row.count, by: 4){
            if row[crateIndex] != " " {stacksPart2[crateIndex/4].insert(String(row[crateIndex]), at: 0)}
        }
    }
    
    for instruction in instructions {
        let cratesToMove = instruction[0]
        let start = instruction[1] - 1
        let end = instruction[2] - 1
        let cratesInStack = stacksPart2[start].count
        
        stacksPart2[end].append(contentsOf: stacksPart2[start][(cratesInStack-cratesToMove)...])
        stacksPart2[start].removeLast(cratesToMove)
        
        /*
         append subrange
         remove subrange
         */

    }
    
    var topCrates9001: String = ""

    for stack in stacksPart2 {topCrates9001 += stack.last!}

    print (topCrates9001)
}

/*
 how do i know how many stacks there are?
 
 ideally, create an array for each stack there are
 removeLast is preferred
 add crates to front of stack
 need to know which stack to add it in; 1 - 5 - 9...; crateIndex/4
 
 also check if it's a character
 */

let day5DemoInput =
"""
    [D]
[N] [C]
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
"""

let day5PuzzleInput =
"""
                [M]     [V]     [L]
[G]             [V] [C] [G]     [D]
[J]             [Q] [W] [Z] [C] [J]
[W]         [W] [G] [V] [D] [G] [C]
[R]     [G] [N] [B] [D] [C] [M] [W]
[F] [M] [H] [C] [S] [T] [N] [N] [N]
[T] [W] [N] [R] [F] [R] [B] [J] [P]
[Z] [G] [J] [J] [W] [S] [H] [S] [G]
 1   2   3   4   5   6   7   8   9

move 1 from 5 to 2
move 7 from 7 to 1
move 1 from 1 to 7
move 1 from 4 to 1
move 7 from 9 to 1
move 1 from 3 to 7
move 4 from 5 to 4
move 6 from 4 to 9
move 2 from 7 to 6
move 6 from 8 to 2
move 2 from 4 to 5
move 2 from 3 to 7
move 11 from 1 to 4
move 6 from 6 to 1
move 3 from 5 to 3
move 5 from 9 to 8
move 1 from 2 to 3
move 2 from 7 to 9
move 7 from 1 to 2
move 1 from 5 to 3
move 1 from 5 to 3
move 5 from 8 to 5
move 3 from 5 to 4
move 1 from 1 to 7
move 1 from 3 to 8
move 2 from 6 to 3
move 3 from 3 to 4
move 1 from 6 to 2
move 5 from 4 to 2
move 2 from 5 to 3
move 2 from 7 to 1
move 1 from 8 to 1
move 7 from 1 to 7
move 4 from 4 to 2
move 7 from 4 to 1
move 10 from 1 to 5
move 10 from 5 to 2
move 11 from 2 to 3
move 1 from 1 to 6
move 1 from 4 to 7
move 4 from 7 to 1
move 6 from 2 to 5
move 2 from 1 to 3
move 1 from 9 to 5
move 2 from 9 to 6
move 1 from 6 to 1
move 3 from 5 to 4
move 20 from 3 to 9
move 3 from 7 to 1
move 3 from 5 to 2
move 3 from 4 to 8
move 3 from 1 to 3
move 3 from 1 to 2
move 2 from 6 to 1
move 10 from 9 to 6
move 6 from 6 to 7
move 4 from 6 to 3
move 11 from 2 to 6
move 1 from 8 to 9
move 13 from 2 to 3
move 1 from 1 to 9
move 1 from 9 to 4
move 1 from 8 to 2
move 1 from 8 to 2
move 4 from 7 to 8
move 8 from 6 to 9
move 3 from 2 to 3
move 3 from 8 to 4
move 11 from 9 to 2
move 7 from 9 to 6
move 1 from 1 to 5
move 4 from 4 to 9
move 21 from 3 to 1
move 1 from 3 to 9
move 7 from 6 to 3
move 6 from 1 to 2
move 13 from 1 to 5
move 2 from 1 to 2
move 3 from 9 to 3
move 2 from 2 to 3
move 2 from 6 to 4
move 3 from 3 to 5
move 13 from 5 to 2
move 5 from 3 to 4
move 2 from 7 to 9
move 2 from 4 to 2
move 1 from 3 to 8
move 1 from 6 to 1
move 4 from 3 to 7
move 2 from 5 to 7
move 1 from 7 to 2
move 1 from 5 to 9
move 4 from 7 to 8
move 1 from 1 to 9
move 6 from 8 to 1
move 4 from 4 to 8
move 25 from 2 to 9
move 1 from 4 to 3
move 1 from 3 to 7
move 4 from 8 to 1
move 1 from 7 to 4
move 3 from 1 to 6
move 5 from 2 to 1
move 1 from 5 to 1
move 1 from 4 to 1
move 24 from 9 to 6
move 9 from 1 to 6
move 1 from 5 to 6
move 1 from 1 to 9
move 1 from 2 to 8
move 1 from 8 to 1
move 3 from 1 to 8
move 36 from 6 to 3
move 2 from 7 to 3
move 1 from 2 to 5
move 1 from 5 to 2
move 1 from 6 to 2
move 10 from 3 to 2
move 3 from 8 to 2
move 1 from 1 to 7
move 2 from 2 to 6
move 10 from 9 to 1
move 2 from 6 to 4
move 13 from 3 to 4
move 8 from 3 to 7
move 8 from 1 to 2
move 5 from 3 to 8
move 3 from 1 to 9
move 1 from 7 to 1
move 7 from 4 to 5
move 1 from 1 to 2
move 14 from 2 to 6
move 2 from 7 to 2
move 8 from 4 to 8
move 3 from 7 to 9
move 2 from 9 to 8
move 2 from 7 to 1
move 1 from 7 to 8
move 1 from 6 to 8
move 1 from 9 to 3
move 4 from 2 to 7
move 6 from 6 to 1
move 3 from 1 to 9
move 1 from 1 to 7
move 6 from 5 to 6
move 1 from 5 to 2
move 1 from 6 to 8
move 5 from 7 to 5
move 1 from 2 to 9
move 2 from 3 to 4
move 9 from 8 to 4
move 8 from 4 to 8
move 6 from 6 to 7
move 5 from 6 to 4
move 7 from 9 to 7
move 7 from 8 to 7
move 5 from 8 to 4
move 3 from 1 to 6
move 1 from 2 to 7
move 1 from 1 to 4
move 4 from 5 to 2
move 2 from 6 to 9
move 1 from 3 to 7
move 1 from 5 to 1
move 1 from 8 to 9
move 1 from 6 to 1
move 1 from 2 to 7
move 2 from 8 to 1
move 2 from 1 to 8
move 3 from 2 to 4
move 1 from 6 to 1
move 17 from 4 to 1
move 3 from 2 to 7
move 13 from 7 to 8
move 1 from 2 to 6
move 14 from 1 to 4
move 2 from 8 to 5
move 1 from 9 to 7
move 2 from 5 to 4
move 1 from 9 to 3
move 5 from 1 to 5
move 3 from 4 to 1
move 1 from 3 to 2
move 7 from 4 to 5
move 9 from 7 to 8
move 5 from 4 to 2
move 1 from 1 to 3
move 1 from 9 to 2
move 15 from 8 to 6
move 1 from 3 to 7
move 11 from 6 to 5
move 1 from 4 to 8
move 3 from 1 to 7
move 5 from 7 to 5
move 27 from 5 to 1
move 8 from 8 to 4
move 1 from 2 to 6
move 3 from 6 to 1
move 9 from 1 to 5
move 5 from 5 to 7
move 2 from 2 to 1
move 2 from 5 to 4
move 6 from 7 to 6
move 1 from 5 to 2
move 1 from 7 to 8
move 4 from 6 to 8
move 5 from 6 to 3
move 1 from 7 to 1
move 5 from 4 to 3
move 6 from 8 to 2
move 1 from 7 to 8
move 2 from 8 to 9
move 10 from 3 to 5
move 9 from 5 to 2
move 3 from 4 to 8
move 1 from 5 to 7
move 2 from 9 to 7
move 2 from 8 to 3
move 1 from 3 to 8
move 19 from 1 to 7
move 4 from 2 to 7
move 2 from 4 to 3
move 3 from 3 to 2
move 2 from 8 to 3
move 2 from 5 to 8
move 1 from 2 to 3
move 2 from 8 to 3
move 5 from 2 to 5
move 9 from 7 to 5
move 13 from 5 to 9
move 7 from 2 to 6
move 2 from 6 to 9
move 1 from 2 to 1
move 5 from 6 to 7
move 1 from 5 to 7
move 6 from 1 to 2
move 5 from 3 to 6
move 6 from 7 to 2
move 3 from 6 to 4
move 3 from 7 to 4
move 12 from 7 to 6
move 5 from 4 to 1
move 2 from 7 to 4
move 3 from 4 to 6
move 16 from 6 to 3
move 4 from 1 to 4
move 1 from 1 to 9
move 3 from 9 to 2
move 1 from 4 to 6
move 9 from 3 to 7
move 2 from 6 to 3
move 3 from 3 to 9
move 15 from 2 to 7
move 19 from 7 to 4
move 15 from 9 to 2
move 16 from 2 to 8
move 6 from 3 to 5
move 4 from 7 to 5
move 15 from 8 to 7
move 19 from 4 to 2
move 1 from 8 to 3
move 16 from 2 to 1
move 9 from 7 to 6
move 7 from 2 to 8
move 2 from 2 to 7
move 1 from 9 to 5
move 1 from 3 to 4
move 6 from 1 to 2
move 8 from 5 to 1
move 1 from 5 to 1
move 18 from 1 to 8
move 7 from 7 to 5
move 7 from 5 to 3
move 4 from 3 to 6
move 13 from 8 to 5
move 12 from 8 to 1
move 5 from 1 to 6
move 15 from 5 to 4
move 1 from 1 to 6
move 12 from 6 to 3
move 8 from 3 to 4
move 2 from 7 to 3
move 9 from 3 to 1
move 5 from 2 to 9
move 16 from 4 to 3
move 10 from 1 to 3
move 2 from 1 to 5
move 1 from 3 to 1
move 5 from 6 to 1
move 4 from 9 to 3
move 1 from 2 to 8
move 1 from 8 to 1
move 1 from 9 to 8
move 2 from 5 to 9
move 9 from 4 to 1
move 3 from 1 to 3
move 2 from 6 to 8
move 3 from 8 to 5
move 2 from 1 to 5
move 2 from 9 to 8
move 1 from 8 to 6
move 2 from 5 to 3
move 19 from 3 to 1
move 2 from 4 to 2
move 1 from 5 to 6
move 2 from 2 to 3
move 1 from 8 to 6
move 8 from 3 to 9
move 6 from 3 to 7
move 2 from 6 to 2
move 1 from 6 to 1
move 1 from 1 to 8
move 1 from 8 to 9
move 1 from 7 to 3
move 19 from 1 to 5
move 21 from 5 to 2
move 13 from 2 to 6
move 13 from 1 to 8
move 7 from 9 to 7
move 2 from 9 to 2
move 10 from 8 to 3
move 1 from 1 to 6
move 10 from 2 to 4
move 11 from 3 to 5
move 8 from 5 to 6
move 1 from 3 to 7
move 2 from 8 to 6
move 2 from 2 to 8
move 3 from 7 to 6
move 2 from 8 to 6
move 1 from 1 to 2
move 24 from 6 to 5
move 2 from 3 to 8
move 1 from 8 to 6
move 7 from 7 to 9
move 4 from 6 to 9
move 1 from 8 to 9
move 21 from 5 to 9
move 2 from 7 to 2
move 1 from 8 to 5
move 1 from 7 to 3
move 12 from 9 to 6
move 6 from 6 to 3
move 12 from 9 to 4
move 4 from 5 to 6
move 13 from 4 to 2
move 8 from 4 to 8
move 10 from 6 to 8
move 11 from 8 to 9
move 4 from 8 to 4
move 2 from 4 to 3
move 8 from 3 to 8
move 2 from 6 to 8
move 1 from 3 to 8
move 6 from 2 to 4
move 1 from 4 to 8
move 1 from 9 to 7
move 13 from 8 to 4
move 1 from 7 to 1
move 1 from 1 to 4
move 8 from 4 to 7
move 3 from 5 to 7
move 19 from 9 to 7
move 3 from 2 to 7
move 1 from 8 to 2
move 13 from 7 to 6
move 1 from 2 to 4
move 4 from 6 to 2
move 1 from 8 to 3
move 7 from 6 to 8
move 1 from 6 to 2
move 1 from 2 to 7
move 9 from 2 to 3
move 1 from 6 to 2
move 21 from 7 to 5
move 9 from 5 to 3
move 19 from 3 to 9
move 5 from 8 to 5
move 2 from 2 to 1
move 2 from 1 to 8
move 6 from 4 to 5
move 3 from 8 to 7
move 15 from 9 to 2
move 2 from 2 to 5
move 3 from 9 to 6
move 5 from 4 to 5
move 11 from 2 to 6
move 1 from 8 to 6
move 1 from 9 to 5
move 1 from 7 to 3
move 6 from 5 to 6
move 1 from 4 to 6
move 1 from 3 to 4
move 13 from 5 to 2
move 16 from 6 to 9
move 4 from 4 to 5
move 2 from 6 to 2
move 2 from 6 to 4
move 2 from 4 to 5
move 2 from 7 to 8
move 2 from 6 to 3
move 2 from 5 to 8
move 14 from 5 to 7
move 4 from 8 to 1
move 4 from 1 to 6
move 1 from 3 to 9
move 1 from 6 to 1
move 2 from 7 to 3
move 2 from 3 to 7
move 2 from 5 to 2
move 9 from 9 to 2
move 13 from 7 to 3
move 12 from 3 to 9
move 2 from 6 to 8
move 14 from 2 to 9
move 2 from 8 to 9
move 10 from 2 to 1
move 1 from 7 to 4
move 2 from 3 to 8
move 4 from 2 to 1
move 1 from 8 to 3
move 1 from 2 to 6
move 1 from 8 to 3
move 4 from 9 to 4
move 1 from 3 to 5
move 1 from 5 to 1
move 1 from 3 to 9
move 12 from 1 to 8
move 10 from 8 to 5
move 7 from 5 to 6
move 1 from 1 to 9
move 3 from 5 to 1
move 1 from 1 to 3
move 16 from 9 to 7
move 4 from 4 to 3
move 1 from 4 to 9
move 15 from 7 to 8
move 15 from 9 to 1
move 8 from 1 to 6
move 1 from 9 to 3
move 17 from 6 to 2
move 1 from 9 to 1
move 15 from 2 to 7
move 14 from 8 to 9
move 12 from 7 to 9
move 12 from 9 to 3
move 3 from 7 to 9
move 1 from 7 to 4
move 7 from 9 to 6
move 1 from 4 to 6
move 11 from 9 to 6
move 2 from 1 to 2
move 18 from 6 to 4
move 4 from 2 to 7
move 2 from 7 to 3
move 2 from 7 to 8
move 4 from 1 to 5
move 1 from 9 to 2
move 2 from 5 to 4
move 5 from 1 to 3
move 2 from 3 to 7
move 2 from 3 to 9
move 1 from 6 to 7
move 1 from 2 to 9
move 2 from 8 to 1
move 3 from 1 to 3
move 2 from 5 to 8
move 2 from 3 to 5
move 1 from 5 to 2
move 1 from 1 to 3
move 1 from 9 to 2
move 1 from 9 to 1
move 3 from 7 to 6
move 1 from 1 to 9
move 2 from 8 to 9
move 1 from 2 to 3
move 2 from 8 to 2
move 2 from 6 to 5
move 1 from 8 to 5
move 3 from 2 to 5
move 3 from 4 to 8
move 1 from 8 to 2
move 3 from 9 to 7
move 3 from 7 to 1
move 1 from 9 to 6
move 3 from 1 to 2
move 2 from 8 to 7
move 2 from 7 to 9
move 2 from 6 to 5
move 3 from 5 to 3
move 1 from 2 to 5
move 3 from 2 to 7
move 2 from 5 to 6
move 15 from 4 to 9
move 1 from 3 to 1
move 25 from 3 to 4
move 3 from 7 to 3
move 5 from 9 to 5
move 10 from 9 to 5
move 9 from 5 to 1
move 5 from 5 to 2
move 1 from 6 to 7
move 5 from 5 to 8
"""
