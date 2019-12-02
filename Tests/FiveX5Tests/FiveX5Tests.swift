import XCTest
@testable import FiveX5

final class FiveX5Tests: XCTestCase {
    
    func testStringRepresentation() {
        XCTAssertEqual(Emoji.all.string, "😀⭐🐟🌞👽🍋⚽💧🐤🌼🍎🌈💡🌙👁🦋✏️🍕🧩🌲🎹🐇☂️🎈📕")
    }
    
    func testEquals() throws {
        XCTAssertEqual(try EmojiList("🌈💡🌙"), EmojiList([Emoji.all["🌈"]!, Emoji.all["💡"]!,
                                                                 Emoji(char:"🌙", name:"moon")]))
    }
    
    func testSubscripts() {
        XCTAssertEqual(Emoji.all["🍕"]!.char, "🍕")
        XCTAssertEqual(Emoji.all.first?.char, "😀")
        XCTAssertEqual(Emoji.all[2...3].map { $0 }, [Emoji.all[2], Emoji.all[3]])
    }
    
    func testASCIIConversion() throws {
        let pw = try EmojiList("🍋⚽🧩🌲✏️")
        
        print(pw.ascii)
        
        XCTAssertEqual(pw, try EmojiList.fromASCII(pw.ascii))
    }
    
    func testAdjacentRepeatingEmoji() throws {
        XCTAssertFalse(try EmojiList("🍋⚽🧩🌲✏️").hasAdjacentRepeatingEmoji())
        XCTAssertFalse(try EmojiList("🍋⚽🧩⚽✏️").hasAdjacentRepeatingEmoji())
        XCTAssertTrue(try EmojiList("🍋⚽⚽🌲✏️").hasAdjacentRepeatingEmoji())
    }
    
    func testRepeatingEmoji() throws {
        XCTAssertFalse(try EmojiList("🍋⚽🧩🌲✏️").hasRepeatingEmoji())
        XCTAssertTrue(try EmojiList("🍋⚽🧩⚽✏️").hasRepeatingEmoji())
        XCTAssertTrue(try EmojiList("🍋⚽🧩🌲🍋").hasRepeatingEmoji())
        XCTAssertTrue(try EmojiList("🍋⚽⚽🌲✏️").hasRepeatingEmoji())
    }
    
    func testOutput() {
        print(Emoji.all.string)
        print(Emoji.all)
        print(Emoji.all.debugDescription)
        
        print(Emoji.all["🍕"]!.description)
        print(Emoji.all["🌼"]!.debugDescription)
        print(Emoji.all[2].debugDescription)
        
        print(Emoji.all[3...10])
        
        do {
            try print(EmojiList("🌈💡🌙👁🦋"))
        } catch let err as InvalidCharacterError {
            print(err.description)
        } catch { /* Can't happen */ }
    }

    /*
    func testPrintForDocs() {
        for emoji in Emoji.all {
            print("| \(emoji.char) | \(emoji.ascii) | \(emoji.index) | \(emoji.name) |")
        }
    }

     static var allTests = [\(emoji.asciiChar) |
         ("testOutput", testOutput),
         ("testStringRepresentation", testStringRepresentation),
         ("testEquals", testEquals),
         ("testSubscripts", testSubscripts),
     ]
     */
}
