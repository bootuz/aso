//
//  Letter.swift
//  Kartuli
//
//  Created by Астемир Бозиев on 15.01.2023.
//

import Algorithms
import Foundation


struct Letter: Identifiable, Equatable {
    let id: Int
    let georgianLetter: String
    let latinLetter: String
    let cyrillicLetter: String
    let pronounciation: String

    var georgianAlphabet: String {
        return "აბგდევზთიკლმნოპჟრსტუფქღყშჩცძწჭხჯჰ"
    }

    static var alphabet: [Letter] {
        return [
            Letter(id: 1, georgianLetter: "ა", latinLetter: "a", cyrillicLetter: "а", pronounciation: "1"),
            Letter(id: 2, georgianLetter: "ბ", latinLetter: "b", cyrillicLetter: "б", pronounciation: "2"),
            Letter(id: 3, georgianLetter: "გ", latinLetter: "g", cyrillicLetter: "г", pronounciation: "3"),
            Letter(id: 4, georgianLetter: "დ", latinLetter: "d", cyrillicLetter: "д", pronounciation: "4"),
            Letter(id: 5, georgianLetter: "ე", latinLetter: "e", cyrillicLetter: "е", pronounciation: "5"),
            Letter(id: 6, georgianLetter: "ვ", latinLetter: "v", cyrillicLetter: "в", pronounciation: "6"),
            Letter(id: 7, georgianLetter: "ზ", latinLetter: "z", cyrillicLetter: "з", pronounciation: "7"),
            Letter(id: 8, georgianLetter: "თ", latinLetter: "t", cyrillicLetter: "т", pronounciation: "8"),
            Letter(id: 9, georgianLetter: "ი", latinLetter: "i", cyrillicLetter: "и", pronounciation: "9"),
            Letter(id: 10, georgianLetter: "კ", latinLetter: "k’", cyrillicLetter: "", pronounciation: "10"),
            Letter(id: 11, georgianLetter: "ლ", latinLetter: "l", cyrillicLetter: "л", pronounciation: "11"),
            Letter(id: 12, georgianLetter: "მ", latinLetter: "m", cyrillicLetter: "м", pronounciation: "12"),
            Letter(id: 13, georgianLetter: "ნ", latinLetter: "n", cyrillicLetter: "н", pronounciation: "13"),
            Letter(id: 14, georgianLetter: "ო", latinLetter: "o", cyrillicLetter: "о", pronounciation: "14"),
            Letter(id: 15, georgianLetter: "პ", latinLetter: "p’", cyrillicLetter: "п’", pronounciation: "15"),
            Letter(id: 16, georgianLetter: "ჟ", latinLetter: "zh", cyrillicLetter: "ж", pronounciation: "16"),
            Letter(id: 17, georgianLetter: "რ", latinLetter: "r", cyrillicLetter: "р", pronounciation: "17"),
            Letter(id: 18, georgianLetter: "ს", latinLetter: "s", cyrillicLetter: "с", pronounciation: "18"),
            Letter(id: 19, georgianLetter: "ტ", latinLetter: "t’", cyrillicLetter: "т’", pronounciation: "19"),
            Letter(id: 20, georgianLetter: "უ", latinLetter: "u", cyrillicLetter: "у", pronounciation: "20"),
            Letter(id: 21, georgianLetter: "ფ", latinLetter: "p", cyrillicLetter: "п", pronounciation: "21"),
            Letter(id: 22, georgianLetter: "ქ", latinLetter: "k", cyrillicLetter: "к", pronounciation: "22"),
            Letter(id: 23, georgianLetter: "ღ", latinLetter: "gh", cyrillicLetter: "", pronounciation: "23"),
            Letter(id: 24, georgianLetter: "ყ", latinLetter: "q’", cyrillicLetter: "", pronounciation: "24"),
            Letter(id: 25, georgianLetter: "შ", latinLetter: "sh", cyrillicLetter: "ш", pronounciation: "25"),
            Letter(id: 26, georgianLetter: "ჩ", latinLetter: "ch", cyrillicLetter: "ч", pronounciation: "26"),
            Letter(id: 27, georgianLetter: "ც", latinLetter: "ts", cyrillicLetter: "ц", pronounciation: "27"),
            Letter(id: 28, georgianLetter: "ძ", latinLetter: "dz", cyrillicLetter: "дз", pronounciation: "28"),
            Letter(id: 29, georgianLetter: "წ", latinLetter: "ts’", cyrillicLetter: "ц’", pronounciation: "29"),
            Letter(id: 30, georgianLetter: "ჭ", latinLetter: "ch’", cyrillicLetter: "ч’", pronounciation: "30"),
            Letter(id: 31, georgianLetter: "ხ", latinLetter: "kh", cyrillicLetter: "х’", pronounciation: "31"),
            Letter(id: 32, georgianLetter: "ჯ", latinLetter: "j", cyrillicLetter: "дж", pronounciation: "32"),
            Letter(id: 33, georgianLetter: "ჰ", latinLetter: "h", cyrillicLetter: "", pronounciation: "33")
        ]
    }

    static func == (lhs: Letter, rhs: Letter) -> Bool {
            return lhs.georgianLetter == rhs.georgianLetter
        }
}
