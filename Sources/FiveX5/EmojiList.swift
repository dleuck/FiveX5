//
//  EmojiList.swift
//
//  Created by Daniel LEUCK on 11/27/19.
//

import Foundation

/**
 A string of 5x5 emoji characters. This generally represents a 5x5 password.
 */
struct EmojiList : Collection, Hashable, Equatable, CustomStringConvertible, CustomDebugStringConvertible {
    
    var emojis: [Emoji]
    
    init(_ emojis: Emoji...) {
        self.init(emojis)
    }
    
    init(_ emojis: String) throws {
        var newList = [Emoji]()

        for char in emojis {
            let emoji = Emoji.all[char]
            if emoji==nil {
                throw InvalidCharacterError(char:char)
            } else {
                newList.append(emoji!)
            }
        }
        
        self.init(newList)
    }
    
    init(_ emojis: [Emoji]) {
        self.emojis = emojis
    }
    
    static func fromASCII(_ asciiText: String) throws -> EmojiList {
        var newEmojis = [Emoji]()
        
        for c in asciiText {
            let emoji = Emoji.fromASCII(c)
            if emoji == nil {
                throw InvalidCharacterError(char:c)
            }
            
            newEmojis.append(emoji!)
        }
        
        return EmojiList(newEmojis)
    }
    
    subscript(_ char: Character) -> Emoji? {
        return emojis.filter{ $0.char == char }.first
    }
    
    subscript(position: EmojiList.Index) -> EmojiList.Element {
        return emojis[position]
    }
    
    var string: String { return map({"\($0.char)"}).joined() }
    
    var ascii: String { String(emojis.map { $0.ascii }) }
    
    var description: String { return "[\(map({"\($0.char)"}).joined(separator: ", "))]" }
    
    var debugDescription: String { return emojis.debugDescription }
    
    // Hashable & equatable

    var hashValue: Int { emojis.hashValue }

    func hash(into hasher: inout Hasher) { emojis.hash(into: &hasher) }
    
    static func ==(lhs: EmojiList, rhs: EmojiList) -> Bool {
        return lhs.emojis == rhs.emojis && lhs.emojis == rhs.emojis
    }

    // Collection functions & properties
    
    typealias Element = Emoji
    
    typealias Index = Int
    
    var startIndex: EmojiList.Index { return emojis.startIndex }
    
    var endIndex: EmojiList.Index { return emojis.endIndex }
    
    var isEmpty: Bool { return emojis.isEmpty }
    
    var count: Int { return emojis.count }
    
    func index(after i: EmojiList.Index) -> EmojiList.Index {
        return emojis.index(after: i)
    }
}
