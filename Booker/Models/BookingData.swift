//
//  Data.swift
//  Booker
//
//  Created by Masashi Aso on 2019/09/09.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI

struct BookingData: Hashable, Identifiable, Comparable {
    var id: Date { createDate }
    
    var book = Book(name: "", writer: "")
    var createDate = Date()
    var about = ""
    var opinion = ""
    
    static func < (lhs: BookingData, rhs: BookingData) -> Bool {
        lhs.createDate < rhs.createDate
    }
    
    init(book: Book, createdAt: Date = Date(), about: String, opinion: String) {
        (self.book, self.createDate, self.about, self.opinion) = (book, createdAt, about, opinion)
    }
}

extension BookingData: CustomStringConvertible, CustomDebugStringConvertible {
    var description: String { "\(book.name)  -\(createDate.description)" }
    var debugDescription: String { "\(id.description)  -\(book.name)" }
}

extension BookingData: Codable, UserDefaultConvertible {}
