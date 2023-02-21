//
//  day10.swift
//  AdventofCode2022
//
//  Created by Dana Zou on 14/12/2022.
//

import Foundation

func day10(){
    let program = day10PuzzleInput.split(separator: "\n").map({$0.split(separator: " ")})
    var xRegister = 1
    var cycleNumber = 0
    var signalStrength = 0
    
    func calculateSignalStrength (for cycleNumber: Int, _ line: [String.SubSequence]) {
        if cycleNumber == 20 || (cycleNumber-20) % 40 == 0 {
            signalStrength += cycleNumber * xRegister
        }
    }
    
    for line in program {
        let command = line[0]
        cycleNumber += 1

        if command == "addx" {
            calculateSignalStrength(for: cycleNumber, line)
            cycleNumber += 1
            calculateSignalStrength(for: cycleNumber, line)
            if let v = Int(line[1]) {
                xRegister += v
            }
        } else {
            calculateSignalStrength(for: cycleNumber, line)
        }
    }
    
    print (signalStrength)
    
    //Part II
    var pixelPosition = -1
    var spritePositions = [0, 1, 2]
    var CRT: String = ""
    cycleNumber = 0
    xRegister = 1
    
    func drawPixel () {
        if spritePositions.contains(pixelPosition) {
            CRT += "#"
        } else { CRT += "." }
        
        if cycleNumber % 40 == 0 {
            CRT += "\n"
            cycleNumber = 0
            pixelPosition = cycleNumber - 1
        }
    }
    
    for line in program {
        let command = line[0]
        cycleNumber += 1
        pixelPosition = cycleNumber - 1
        
        if command == "addx" {
            drawPixel()
            
            cycleNumber += 1
            pixelPosition += 1
            drawPixel()
            
            xRegister += Int(line[1])!
            spritePositions = [xRegister - 1, xRegister, xRegister+1]
        } else {
            drawPixel()
        }
    }
    print (CRT)

}



/*
 addx takes 2 cycles
 noop takes 1 cycle
 
 signalStrength = cyclenumber x X
 For now, consider the signal strength (the cycle number multiplied by the value of the X register) during the 20th cycle and every 40 cycles after that (that is, during the 20th, 60th, 100th, 140th, 180th, and 220th cycles).
 
 idea1
 when parsing input, create an array [15, 0, -11, 0]
 
 15, 15, 4, 4, 10, 10,
 
 Part II
 spritePositions = [0, 1, 2]
 pixelPosition = 0 ->
 for line in instructions:
    // line 1 Cycle 1, X = 1, sprite 012, pixel position = 0, addx15, CRT: #
    cycle += 1
    if "addx":
        if spritePositions.contains(pixelPosition): CRT + "#"
        else: CRT + "."
        
        cycle += 1
        if spritePositions.contains(pixelPosition): CRT + "#"
        else: CRT + "."
 
        X += v
        spritePositions[].map({$0+x})
 
    else (i.e. noop):
        if spritePositions.contains(pixelPosition): CRT + "#"
        else: CRT + "."
 
    // Cycle 2, X = 1, sprite 012, pixel position 1, continue addx15, CRT: ## ; end X = 16
    
    // line 2 Cycle 3, X=16, sprite 15 16 17, pixel position 2, addx -11, CRT: ##.
 xRegister
 when cycle = 41, add line break first
 
 */

let day10DemoInput =
"""
addx 15
addx -11
addx 6
addx -3
addx 5
addx -1
addx -8
addx 13
addx 4
noop
addx -1
addx 5
addx -1
addx 5
addx -1
addx 5
addx -1
addx 5
addx -1
addx -35
addx 1
addx 24
addx -19
addx 1
addx 16
addx -11
noop
noop
addx 21
addx -15
noop
noop
addx -3
addx 9
addx 1
addx -3
addx 8
addx 1
addx 5
noop
noop
noop
noop
noop
addx -36
noop
addx 1
addx 7
noop
noop
noop
addx 2
addx 6
noop
noop
noop
noop
noop
addx 1
noop
noop
addx 7
addx 1
noop
addx -13
addx 13
addx 7
noop
addx 1
addx -33
noop
noop
noop
addx 2
noop
noop
noop
addx 8
noop
addx -1
addx 2
addx 1
noop
addx 17
addx -9
addx 1
addx 1
addx -3
addx 11
noop
noop
addx 1
noop
addx 1
noop
noop
addx -13
addx -19
addx 1
addx 3
addx 26
addx -30
addx 12
addx -1
addx 3
addx 1
noop
noop
noop
addx -9
addx 18
addx 1
addx 2
noop
noop
addx 9
noop
noop
noop
addx -1
addx 2
addx -37
addx 1
addx 3
noop
addx 15
addx -21
addx 22
addx -6
addx 1
noop
addx 2
addx 1
noop
addx -10
noop
noop
addx 20
addx 1
addx 2
addx 2
addx -6
addx -11
noop
noop
noop
"""

let day10PuzzleInput =
"""
noop
addx 7
addx -1
addx -1
addx 5
noop
noop
addx 1
addx 3
addx 2
noop
addx 2
addx 5
addx 2
addx 10
addx -9
addx 4
noop
noop
noop
addx 3
addx 5
addx -40
addx 26
addx -23
addx 2
addx 5
addx 26
addx -35
addx 12
addx 2
addx 17
addx -10
addx 3
noop
addx 2
addx 3
noop
addx 2
addx 3
noop
addx 2
addx 2
addx -39
noop
addx 15
addx -12
addx 2
addx 10
noop
addx -1
addx -2
noop
addx 5
noop
addx 5
noop
noop
addx 1
addx 4
addx -25
addx 26
addx 2
addx 5
addx 2
noop
addx -3
addx -32
addx 1
addx 4
addx -2
addx 3
noop
noop
addx 3
noop
addx 6
addx -17
addx 27
addx -7
addx 5
addx 2
addx 3
addx -2
addx 4
noop
noop
addx 5
addx 2
addx -39
noop
noop
addx 2
addx 5
addx 3
addx -2
addx 2
addx 11
addx -4
addx -5
noop
addx 10
addx -18
addx 19
addx 2
addx 5
addx 2
addx 2
addx 3
addx -2
addx 2
addx -37
noop
addx 5
addx 4
addx -1
noop
addx 4
noop
noop
addx 1
addx 4
noop
addx 1
addx 2
noop
addx 3
addx 5
noop
addx -3
addx 5
addx 5
addx 2
addx 3
noop
addx -32
noop
"""
