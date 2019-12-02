# 5x5 Emoji Password Standard & Library

5x5 (also written FiveX5) is a library for managing emoji passwords. It is designed to make it easy for people of all ages to create 
passwords that they can easily memorize. FiveX5 uses a set of 25 standard emojis that represent characters in a rad 25 password
string. Each character has an emoji, index (0-24), ascii equivalent and name.

The 5x5 emoji set is:

| Emoji | ASCII | Index | Name |
| ----- | ----- | ----- | ---- |
| 😀 | 0 | 0 | smile |
| ⭐ | 1 | 1 | star |
| 🐟 | 2 | 2 | fish |
| 🌞 | 3 | 3 | sun |
| 👽 | 4 | 4 | alien |
| 🍋 | 5 | 5 | lemon |
| ⚽ | 6 | 6 | soccer ball |
| 💧 | 7 | 7 | drop |
| 🐤 | 8 | 8 | bird |
| 🌼 | 9 | 9 | flower |
| 🍎 | a | 10 | apple |
| 🌈 | b | 11 | rainbow |
| 💡 | c | 12 | light |
| 🌙 | d | 13 | moon |
| 👁 | e | 14 | eye |
| 🦋 | f | 15 | butterfly |
| ✏️ | g | 16 | pencil |
| 🍕 | h | 17 | pizza |
| 🧩 | i | 18 | puzzle |
| 🌲 | j | 19 | tree |
| 🎹 | k | 20 | piano |
| 🐇 | m | 21 | rabbit |
| ☂️ | n | 22 | umbrella |
| 🎈 | p | 23 | balloon |
| 📕 | q | 24 | book |

### Criteria for Icon Selection
- Family friendly
- Easy to recognize
- Legible at small sizes
- No similar emoji
- Gender neutral

### ASCII Equivalents
The ASCII equivalents are "0123456789abcdefghijkmnp". The letters "l" and "o" are ommitted to avoid confusion with "1" and "0".

### Using Stories as a Memory Device
5x5 passwords are best remembered by constructing a story with the emoji. Examples
1. 😀 played ⚽ in the 💧:  😀⚽💧
2. Read a 📕 under a 🌲. Then play 🎹 with your pet 🐇:  📕🌲🎹🐇
3. I 👁 the ⭐s and 🌙 while eating 🍕:  👁⭐🌙🍕

### Checking for strong passwords
A minimum length of four emoji is recommended. There are 390,625 possible passwords for four emoji 5x5 passwords. Five or six
emoji passwords are strongly preferred. Five emojis provide 9,765,625 possibilities and six emojis provide 244,140,625.

Use `EmojiList.hasAdjacentRepeatingEmoji()` or the stronger `EmojiList.hasRepeatingEmoji()` to prevent passwords such
as "😀😀😀😀".
