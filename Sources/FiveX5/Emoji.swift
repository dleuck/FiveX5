//
//  Emoji.swift
//
//  Created by Daniel LEUCK on 11/27/19.
//

/**
 An Emoji from the 5x5 standard set of 25:
     😀⭐🐟🌞👽🍎⚽💧🐤🌼👟🌈💡🌙👁🦋✏️🍕🧩🌲🎹🐇☂️🎈📕
 */
public struct Emoji : Hashable, Equatable, CustomStringConvertible, CustomDebugStringConvertible {

    // Omit "l" and "o" to avoid confusion with 1 and 0
    private static let AlphaChars = "abcdefghijkmnpqr"
    
    public var char: Character
    public var name: String
    
    init(char: Character, name: String) {
        self.char = char
        self.name = name
    }
    
    public var index: Int {
        Emoji.all.firstIndex(of:self)!
    }
    
    public var ascii: Character {
        
        if index < 10 {
            return index.description.first!
        }
        
        let startIndex = Emoji.AlphaChars.startIndex
        let charIndex = Emoji.AlphaChars.index(startIndex, offsetBy: index - 10)
        
        return Emoji.AlphaChars[charIndex]
    }
    
    public static func fromASCII(_ asciiChar:Character) -> Emoji? {
        let lcChar = asciiChar.lowercased().first!
        
        for emoji in Emoji.all {
            if emoji.ascii == lcChar {
                return emoji
            }
        }
        
        return nil
    }
    
    public var description: String { return char.description }
    
    public var debugDescription: String { return "\(char) \(ascii) (\(index)) \(name)" }
    
    public var hexString: String {
        return String(char.unicodeScalars.first!.value, radix: 16, uppercase: true)
    }
    
    public var unicodeString: String {
        return char.unicodeScalars.first!.escaped(asASCII: true)
    }
    
    // candidates: 🌵🐢🌮🎲🎼🎺🏀🍩🍍🥝🥕
    
    public static var all = EmojiList(
        Emoji(char:"😀", name:"smile"),
        Emoji(char:"⭐", name:"star"),
        Emoji(char:"🐟", name:"fish"),
        Emoji(char:"🌞", name:"sun"),
        Emoji(char:"👽", name:"alien"),

        Emoji(char:"🍎", name:"apple"),
        Emoji(char:"⚽", name:"soccer ball"),
        Emoji(char:"💧", name:"drop"),
        Emoji(char:"🐤", name:"bird"),
        Emoji(char:"🌼", name:"flower"),

        
        Emoji(char:"👟", name:"shoe"),
        Emoji(char:"🌈", name:"rainbow"),
        Emoji(char:"💡", name:"light"),
        Emoji(char:"🌙", name:"moon"),
        Emoji(char:"👁", name:"eye"),
            
        Emoji(char:"🦋", name:"butterfly"),
        Emoji(char:"✏️", name:"pencil"),
        Emoji(char:"🍕", name:"pizza"),
        Emoji(char:"🧩", name:"puzzle"),
        Emoji(char:"🌲", name:"tree"),
            
        Emoji(char:"🎹", name:"piano"),
        Emoji(char:"🐇", name:"rabbit"),
        Emoji(char:"☂️", name:"umbrella"),
        Emoji(char:"🎈", name:"balloon"),
        Emoji(char:"📕", name:"book")
    )
    
    // Hashable & equatable

    public var hashValue: Int { char.hashValue }

    public func hash(into hasher: inout Hasher) { char.hash(into: &hasher) }
    
    public static func ==(lhs: Emoji, rhs: Emoji) -> Bool {
        return lhs.char == rhs.char && lhs.char == rhs.char
    }
}
