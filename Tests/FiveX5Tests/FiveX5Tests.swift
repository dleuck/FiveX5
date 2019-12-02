import XCTest
@testable import FiveX5

final class FiveX5Tests: XCTestCase {
    
    func testStringRepresentation() {
        XCTAssertEqual(Emoji.all.string, "😀⭐🐟🌞👽🍋⚽💧🐤🌼🍎🌈💡🌙👁🦋✏️🍕🧩🌲🎹🐇☂️🎈📕")
    }
    
    func testEquals() throws {
        XCTAssertEqual(try EmojiList("🌈💡🌙"), EmojiList([Emoji.all["🌈"]!, Emoji.all["💡"]!,                                                     Emoji(char:"🌙", name:"moon")]))
    }
    
    func testSubscripts() {
        XCTAssertEqual(Emoji.all["🍕"]!.char, "🍕")
        XCTAssertEqual(Emoji.all.first?.char, "😀")
        XCTAssertEqual(Emoji.all[2...3].map { $0 }, [Emoji.all[2], Emoji.all[3]])
    }
    
    /*
     static var allTests = [
         ("tests", tests),
         ("testStringRepresentation", testStringRepresentation),
         ("testEquals", testEquals),
         ("testSubscripts", testSubscripts),
     ]
     
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
     */
}
