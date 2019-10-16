//
//  storage.swift
//  assignment2
//
//  Created by Luther Yu on 9/18/19.
//  Copyright © 2019 Luther Yu. All rights reserved.
//

import Foundation

class storage {
    var inputs: [String]
    
    init(){
        inputs = []
    }
    
    public func arrayOutput() -> String{
        var output: String = ""
        for i in inputs{
            output += i+"\n"
        }
        return output
    }
    
    public func add(str: String){
        inputs.append(str)
    }

}
