//
//  Folder.swift
//  AdventofCode2022
//
//  Created by Dana Zou on 10/12/2022.
//

import Foundation

class Folder {
    let folderName: String
    var files: [(_: String, value: Int)] = []
    var parent: String? = nil
    var children: [String: Folder] = [:]
    var totalSize: Int? = nil
    
    init(folderName: String, parent: String?) {
        self.folderName = folderName
        self.parent = parent
    }
    
    var folderDescription: String {
        return ("name: \(folderName), files: \(files), children: \(children), parent: \(parent ?? "no parent"), totalSize: \(totalSize ?? 0)")
    }
    
//    init(files: [(filename: String, value: Int)], parent: Int?, children: Array<Int>) {
////        self.folderName = folderName
//        self.files = files
//        self.parent = parent
//        self.children = children
//    }
}
