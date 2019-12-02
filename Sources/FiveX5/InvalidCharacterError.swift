//
//  File.swift
//  
//
//  Created by Daniel LEUCK on 11/27/19.
//

import Foundation

public struct InvalidCharacterError : Error, CustomStringConvertible {
    var char: Character
    
    public var description:String {
        return "\"\(char)\" is not a valid 5x5 emoji."
    }
}
