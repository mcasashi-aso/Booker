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
    
    var book: Book
    var createDate: Date
    var about: String
    var opinion: String
    
    static func < (lhs: BookingData, rhs: BookingData) -> Bool {
        lhs.createDate < rhs.createDate
    }
}

extension BookingData: CustomStringConvertible, CustomDebugStringConvertible {
    var description: String { "\(book.name)  -\(createDate.description)" }
    var debugDescription: String { "\(id.description)  -\(book.name)" }
}

extension BookingData: Codable, UserDefaultConvertible {}
