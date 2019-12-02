//
//  Emoji.swift
//
//  Created by Daniel LEUCK on 11/27/19.
//

/**
 An Emoji from the 5x5 standard set of 25:
     😀⭐🐟🌞👽🍋⚽💧🐤🌼🍎🌈💡🌙👁🦋✏️🍕🧩🌲🎹🐇☂️🎈📕
 */
struct Emoji : Hashable, Equatable, CustomStringConvertible, CustomDebugStringConvertible {

    // Omit "l" and "o" to avoid confusion with 1 and 0
    private static let AlphaChars = "abcdefghijkmnpqr"
    
    var char: Character
    var name: String
    
    var index: Int {
        Emoji.all.firstIndex(of:self)!
    }
    
    var asciiChar: Character {
        
        if index < 10 {
            return index.description.first!
        }
        
        let startIndex = Emoji.AlphaChars.startIndex
        let charIndex = Emoji.AlphaChars.index(startIndex, offsetBy: index - 10)
        
        return Emoji.AlphaChars[charIndex]
    }
    
    public var description: String { return char.description }
    
    public var debugDescription: String { return "\(char) \(asciiChar) (\(index)) \(name)" }
    
    var hexString: String {
        return String(char.unicodeScalars.first!.value, radix: 16, uppercase: true)
    }
    
    var unicodeString: String {
        return char.unicodeScalars.first!.escaped(asASCII: true)
    }
    
    // candidates: 🌵🐢🌮🎲🎼🎺🏀🍩🍍🥝🥕
    
    static var all = EmojiList(
        Emoji(char:"😀", name:"smile"),
        Emoji(char:"⭐", name:"star"),
        Emoji(char:"🐟", name:"fish"),
        Emoji(char:"🌞", name:"sun"),
        Emoji(char:"👽", name:"alien"),

        Emoji(char:"🍋", name:"lemon"),
        Emoji(char:"⚽", name:"soccer ball"),
        Emoji(char:"💧", name:"drop"),
        Emoji(char:"🐤", name:"bird"),
        Emoji(char:"🌼", name:"flower"),

        Emoji(char:"🍎", name:"apple"),
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

    var hashValue: Int { char.hashValue }

    func hash(into hasher: inout Hasher) { char.hash(into: &hasher) }
    
    static func ==(lhs: Emoji, rhs: Emoji) -> Bool {
        return lhs.char == rhs.char && lhs.char == rhs.char
    }
}
