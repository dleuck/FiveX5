//
//  EmojiList.swift
//
//  Created by Daniel LEUCK on 11/27/19.
//

import Foundation

/**
 A string of 5x5 emoji characters. This generally represents a 5x5 password.
 */
public struct EmojiList : Collection, Hashable, Equatable, CustomStringConvertible, CustomDebugStringConvertible {
    
    var emojis: [Emoji]
    
    public init(_ emojis: Emoji...) {
        self.init(emojis)
    }
    
    /**
     Throws InvalidCharacterError(char:) if any of the String's characters are not in the 25 character 5x5 emoji set.
     */
    public init(_ emojis: String) throws {
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
    
    public init(_ emojis: [Emoji]) {
        self.emojis = emojis
    }
    
    /**
     Throws InvalidCharacterError(char:) if any of the String's characters are not ascii equivalents for the 25
     character 5x5 emoji set. (0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,m,n,p,q)
     */
    public static func fromASCII(_ asciiText: String) throws -> EmojiList {
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
    
    public func hasAdjacentRepeatingEmoji() -> Bool {
        if emojis.count < 2 { return false }
        
        var lastEmoji = emojis.first!
        for emoji in emojis[1...] {
            if emoji == lastEmoji { return true }
            lastEmoji = emoji
        }
        
        return false
    }
    
    public func hasRepeatingEmoji() -> Bool {
        if emojis.count < 2 { return false }
        
        for emoji in emojis {
            var prunedEmojis = emojis
            prunedEmojis.remove(at: emojis.firstIndex(of: emoji)!)
            if prunedEmojis.contains(emoji) { return true }
        }
        
        return false
    }
    
    public subscript(_ char: Character) -> Emoji? {
        return emojis.filter{ $0.char == char }.first
    }
    
    public subscript(position: EmojiList.Index) -> EmojiList.Element {
        return emojis[position]
    }
    
    public var string: String { return map({"\($0.char)"}).joined() }
    
    public var ascii: String { String(emojis.map { $0.ascii }) }
    
    public var description: String { return "[\(map({"\($0.char)"}).joined(separator: ", "))]" }
    
    public var debugDescription: String { return emojis.debugDescription }
    
    // Hashable & equatable

    public var hashValue: Int { emojis.hashValue }

    public func hash(into hasher: inout Hasher) { emojis.hash(into: &hasher) }
    
    public static func ==(lhs: EmojiList, rhs: EmojiList) -> Bool {
        return lhs.emojis == rhs.emojis && lhs.emojis == rhs.emojis
    }

    // Collection functions & properties
    
    public typealias Element = Emoji
    
    public typealias Index = Int
    
    public var startIndex: EmojiList.Index { return emojis.startIndex }
    
    public var endIndex: EmojiList.Index { return emojis.endIndex }
    
    public var isEmpty: Bool { return emojis.isEmpty }
    
    public var count: Int { return emojis.count }
    
    public func index(after i: EmojiList.Index) -> EmojiList.Index {
        return emojis.index(after: i)
    }
}
