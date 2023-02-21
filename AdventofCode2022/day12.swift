//
//  day12.swift
//  AdventofCode2022
//
//  Created by Dana Zou on 21/12/2022.
//

import Foundation

func day12() {
    let map = day12PuzzleInput.split(separator: "\n").map{Array($0)}
    var source: (Int, Int)? = nil
    var target: (Int, Int)? = nil
    
    // get start/source & end/target
    for (i, line) in map.enumerated() {
        if let j = line.firstIndex(of: "S") {
            source = (i, j)
        }
        if let j = line.firstIndex(of: "E") {
            target = (i, j)
        }
    }
    
    var distMap: [[Int]] = Array(repeating: Array(repeating: 99999, count: map[0].count), count: map.count)
    var distMapPart2 = distMap
    var unvisitedNodes: [(Int, Int)] = []
    var prev: [[(Int, Int)]] = Array(repeating: Array(repeating: (-1, -1), count: map[0].count), count: map.count)
    
    for (i, line) in map.enumerated(){
        for j in line.indices {
            let v = (i, j)
            unvisitedNodes.append(v)
        }
        distMap[source!.0][source!.1] = 0
    }
    //    print(unvisitedNodes)
    
    var unvisitedNodesPart2 = unvisitedNodes
    
    var u: (Int, Int) = (0,0)
    
//part1: while !unvisitedNodes.isEmpty {
//        //        print (distMap)
//        //        print(unvisitedNodes)
//        var min = 999999
//
//        // u = vertex in Q with min dist[u]
//        for vertex in unvisitedNodes {
//            if distMap[vertex.0][vertex.1] < min{
//                min = distMap[vertex.0][vertex.1]
//                u = vertex
//            }
//        }
//
//        if u == target! {
//            //            print ("we've reached the target")
//            print (distMap[u.0][u.1])
//            //            print (prev[u.0][u.1])
//            break part1
//        }
//
//        //        print ("u = \(u)")
//        unvisitedNodes.remove(at: unvisitedNodes.firstIndex(where: {$0 == u})!)
//
//        // evaluate neighbour, neighbour character must only be 1 higher or lower
//        let neighbors: [(Int, Int)] = [(u.0 - 1, u.1), (u.0 + 1, u.1), (u.0, u.1+1), (u.0, u.1-1)]
//        //        print ("neighbors: \(neighbors)")
//
//        var utf8ValueU = Int(Array(map[u.0][u.1].utf8)[0])
//        if u == source! {
//            utf8ValueU = 97 // utf8 of a
//        }
//
//        var utf8ValueNeighbor: Int = 0
//        // up, left, right, down
//        for neighbor in neighbors {
//            //            print ("evaluating neighbor: \(neighbor)")
//            switch neighbor {
//            case (-1, _), (map.count, _):
//                continue
//            case (_, -1), (_, map[0].count):
//                continue
//            default:
//                //                print("neighbor is \(map[neighbor.0][neighbor.1])")
//                utf8ValueNeighbor = Int(Array(map[neighbor.0][neighbor.1].utf8)[0])
//                if neighbor == target! {
//                    utf8ValueNeighbor = 122
//                }
//                //                print(utf8ValueU, utf8ValueNeighbor)
//            }
//
//            // if neighbor is a letter that is > current + 1
//            if utf8ValueNeighbor > utf8ValueU + 1 {
//                //                print ("neighbor unreachable")
//                //                neighbors[i] = (-1, -1)
//                continue
//            }
//
//            if unvisitedNodes.contains(where: {$0 == neighbor}) {
//                //                print ("visiting neighbor")
//                let alt = distMap[u.0][u.1] + 1
//                //                print (alt)
//                if alt < distMap[neighbor.0][neighbor.1] {
//                    //                    print ("updating dist")
//                    distMap[neighbor.0][neighbor.1] = alt
//                    prev[neighbor.0][neighbor.1] = u
//                }
//            }
//        }
//    }
        
//        var s: [(Int, Int)] = []
//        u = target!
//        if prev[u.0][u.1] != (-1, -1) {
//            while u >= (0 , 0) {
//                s.insert(u, at: 0)
//                u = prev[u.0][u.1]
//            }
//        }
    
        // part 2 - find shortest path from any a to E
        // we can go from E to any a
    distMapPart2[target!.0][target!.1] = 0
    u = target!
    var stepsToA: [Int] = []
        
        while !unvisitedNodesPart2.isEmpty {
            var min = 999999
            
            // is there a way to check whether the remaining nodes are all "a" or of distance 999999 and hence unaccessible?
            for vertex in unvisitedNodesPart2 {
                if distMapPart2[vertex.0][vertex.1] < min {
                    min = distMapPart2[vertex.0][vertex.1]
                    u = vertex
                }
            }
            
            let uChar = map[u.0][u.1]

            if uChar == "a" {
                stepsToA.append(distMapPart2[u.0][u.1])
                print(stepsToA)
                break
            }
            
            print ("u = \(u), \(uChar)")
            unvisitedNodesPart2.remove(at: unvisitedNodesPart2.firstIndex(where: {$0 == u})!)
            
            // up, left, right, down
            let neighborsPart2 = [(u.0 - 1, u.1), (u.0 + 1, u.1), (u.0, u.1+1), (u.0, u.1-1)]
            print ("neighbors: \(neighborsPart2)")
            var utf8ValueU = 0
            
            switch u {
            case (target!.0, target!.1):
                utf8ValueU = 122
            case (source!.0, source!.1):
                utf8ValueU = 97
            default:
                utf8ValueU = Int(Array(uChar.utf8)[0])
            }
            
            var utf8ValueNeighbor: Int
            
            for neighbor in neighborsPart2 {
            print ("evaluating neighbor: \(neighbor)")
                
                switch neighbor {
                case (-1, _), (map.count, _):
                    continue
                case (_, -1), (_, map[0].count):
                    continue
                default:
                    utf8ValueNeighbor = Int(Array(map[neighbor.0][neighbor.1].utf8)[0])
                    print("neighbor is \(map[neighbor.0][neighbor.1])")
                    if neighbor == target! {
                        utf8ValueNeighbor = 122
                    }
                }
                
                if utf8ValueNeighbor - utf8ValueU < -1 {
                    print ("neighbor unreachable")
                    continue
                }
                
                if unvisitedNodesPart2.contains(where: {$0 == neighbor}) {
                    print ("visiting neighbor")
                    let alt = distMapPart2[u.0][u.1] + 1
                    if alt < distMapPart2[neighbor.0][neighbor.1] {
                        print ("updating dist")
                        distMapPart2[neighbor.0][neighbor.1] = alt
                    }
                    if map[neighbor.0][neighbor.1] == "a" {
                        print("peeked at a, retracting 1 step")
                        unvisitedNodesPart2.remove(at: unvisitedNodesPart2.firstIndex(where: {$0 == neighbor})!)
                        unvisitedNodesPart2.append(neighbor)
                    }
                } else {
                    print("neighbor already visited")
                }
            }
        }
        
    print("Shortest steps from a to z: \(stepsToA.max()!) steps")
        
        
    }
    
    /*
     1  function Dijkstra(Graph, source):
     2
     3      for each vertex v in Graph.Vertices:
     4          dist[v] ← INFINITY
     5          prev[v] ← UNDEFINED
     6          add v to Q
     7      dist[source] ← 0
     8
     9      while Q is not empty:
     10          u ← vertex in Q with min dist[u]
     11          remove u from Q
     12
     13          for each neighbor v of u still in Q:
     14              alt ← dist[u] + Graph.Edges(u, v)
     15              if alt < dist[v]:
     16                  dist[v] ← alt
     17                  prev[v] ← u
     18
     19      return dist[], prev[]
     
     if u == target, terminate // may not be necessary as I only need # of steps
     1  S ← empty sequence
     2  u ← target
     3  if prev[u] is defined or u = source:          // Do something only if the vertex is reachable
     4      while u is defined:                       // Construct the shortest path with a stack S
     5          insert u at the beginning of S        // Push the vertex onto the stack
     6          u ← prev[u]                           // Traverse from target to source
     */
    
let day12DemoInput =
"""
Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi
"""
    
let day12PuzzleInput =
"""
abcccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaccaaaaaaaaccccccccccccccccccccccccccccccccccccaaaaaa
abcccccccccccccccccccccccccccccccaaaaaaaaaaaaaaaaaccaaaaaaccccccccccccccccccccccccccccccccccccccaaaaa
abcccccccccccccccccccccccccccccccccaaaaaaaacccaaaaccaaaaaaccccccccccccccccccccaaaccccccccccccccccaaaa
abcccccccccccccccccccccccccccccccccccaaaaaaaccaaccccaaaaaaccccccccccccccccccccaaaccccccccccccccccaaaa
abcccccccccccccccccccccccccccccaaacccaaaaaaaacccccccaaccaaccccccccccccccccccccaaaccccccccccccccccaaac
abcccccccccccccccccccccccccccccaaaaaaaaacaaaacccccccccccccccaccaaccccccccccccciiaaccaaaccccccccccaacc
abccccccccaaccccccccccccccccccaaaaaaaaaaccaaacccccccccccccccaaaaaccccccccacaiiiiijjaaaacccccccccccccc
abacccaaccaacccccccccccccccccaaaaaaaaaaccccacccccaaaaccccccccaaaaacccccccaaiiiiijjjjaaaccccccaacccccc
abacccaaaaaacccccccccccccccccaaaaaaaaccccccccccccaaaacccccccaaaaaacccccccaiiiioojjjjjacccaaaaaacccccc
abcccccaaaaaaacccccccccccccccccaaaaaaccccaaccccccaaaacccccccaaaaccccccccciiinnoooojjjjcccaaaaaaaccccc
abccccccaaaaaccccccccccccccccccaaaaaacccaaaaccccccaaacccccccccaaaccccccchiinnnooooojjjjcccaaaaaaacccc
abcccccaaaaacccccccccccccccccccaacccccccaaaaccccccccccccccccccccccccccchhiinnnuuoooojjjjkcaaaaaaacccc
abccccaaacaaccccccccccccccccccccccccccccaaaaccccccccccccccccccaaacccchhhhhnnntuuuoooojjkkkkaaaacccccc
abccccccccaacccccccccccccccccccccccccccccccccccccccccccccccccccaacchhhhhhnnnnttuuuuoookkkkkkkaacccccc
abcccccccccccccccccccaacaaccccccccccccccccccccccccccccccccccaacaahhhhhhnnnnntttxuuuoopppppkkkkacccccc
abcccccccccccccccccccaaaaacccccccccaccccccccccccccccccccccccaaaaahhhhmnnnnntttxxxuuupppppppkkkccccccc
abccccccccccccccccccccaaaaacccccaaaacccccccccccccccccccccccccaaaghhhmmmmttttttxxxxuuuuuupppkkkccccccc
abcccccccccccccccccccaaaaaaaccccaaaaaaccccccccccccccccccccccccaagggmmmmtttttttxxxxuuuuuuvppkkkccccccc
abcccccccccccccccccccaaaaaaaaaaacaaaaacccccccccccccccccccccccaaagggmmmttttxxxxxxxyyyyyvvvppkkkccccccc
abccccccccccccccccccccaaaaaaaaaaaaaaaccccccccccccccccccccaacaaaagggmmmtttxxxxxxxyyyyyyvvppplllccccccc
SbcccccccccccccccccccaaaaaaaaaacaccaaccccccccccccccccccccaaaaaccgggmmmsssxxxxEzzzyyyyvvvpplllcccccccc
abcccccccccccccccccccccaaaaaaccccccccccccccaacaaccccccccaaaaaccccgggmmmsssxxxxyyyyyvvvvqqplllcccccccc
abccccccccccccccccccccccaaaaaacccccccccccccaaaacccccccccaaaaaacccgggmmmmsssswwyyyyyvvvqqqlllccccccccc
abcccccccccccccccccccccaaaaaaaccccccccccccaaaaacccccccccccaaaaccccgggmmmmsswwyyyyyyyvvqqllllccccccccc
abcccccccccccccccccccccaaaccaaacccccccccccaaaaaaccccccccccaccccccccgggooosswwwywwyyyvvqqlllcccccccccc
abccccccccccccccccccccccacccccccccccccccccacaaaacccccccccccccccccccfffooosswwwwwwwwvvvqqqllcccccccccc
abccccccccccccccccccccccccccccccccccccccccccaacccccccccccccccccccccfffooosswwwwwrwwvvvqqqllcccccccccc
abccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccffooossswwwrrrwvvvqqqmmcccccccccc
abccccaaacccccccccccccccccccccccccccccccccccccccccccccccccccccccccccffooosssrrrrrrrrqqqqmmmcccccccccc
abccccaaacaacccccaaccccaaaacccccccccccccccccccccccccccccccccccccccccffooossrrrrrnrrrqqqqmmmcccaaacccc
abcccccaaaaaccaaaaacccaaaaacccccccccccccccccccccccccccccccccccccccccfffoooorrnnnnnnmqqmmmmmcccaaacccc
abccaaaaaaaacccaaaaaccaaaaaaccccccccccccccccccccccccccccccccccccccccfffooonnnnnnnnnmmmmmmmcccaaaccccc
abcccaaaaacccccaaaaaccaaaaaaccccccaacccccccccccccccccccccccccccccccccfffoonnnnneddnmmmmmmccccaaaccccc
abccccaaaaacccaaaaacccaaaaaacccccaaaaaaccccccccccccccccccccaaccccccccffeeeeeeeeeddddddddccccaaaaccccc
abccccaacaaacccccaacccccaacccccccaaaaaaaccccccccccccccccaaaaaccccccccceeeeeeeeeedddddddddccaccaaccccc
abccccaacccccccccccccccccccccccccaaaaaaaccaaaccccccccccccaaaaaccccccccceeeeeeeeaaaaddddddcccccccccccc
abcccccccccccaaccccccccccccccccccccccaaaaaaaaacccccccccccaaaaacccccccccccccaaaacaaaacccccccccccccccaa
abccccccccaacaaacccccccccccccccccccccaaaaaaaacccccccccccaaaaaccccccccccccccaaaccaaaaccccccccccccccaaa
abccccccccaaaaacccccccccccccccccccccacaaaaaaccccccccccccccaaacccccccccccccccaccccaaacccccccccccacaaaa
abcccccccccaaaaaaccccccccccccccccaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccacccccccccccaaaaaa
abcccccccaaaaaaaaccccccccccccccccaaaaaaaaaaaaacccccccccccccccccccccccccccccccccccccccccccccccccaaaaaa
"""

