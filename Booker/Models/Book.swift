//
//  Book.swift
//  Booker
//
//  Created by Masashi Aso on 2019/09/09.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import Foundation

struct Book: Hashable, Identifiable {
    var id = UUID()
    
    var name: String
    var writer: String
    var about: String?
    var imageURL: String?
    var url: String?
    var releaseDate: Date?
    
    init(name: String, writer: String, imageURL: String? = nil, url: String? = nil) {
        (self.name, self.writer, self.imageURL, self.url) = (name, writer, imageURL, url)
    }
}

extension Book: CustomStringConvertible, CustomDebugStringConvertible, CustomReflectable {
    var description: String { "\(name)  -\(writer)" }
    var debugDescription: String { "\(id)  -\(name)" }
    var customMirror: Mirror { Mirror(reflecting: self) }
}

extension Book: Codable, UserDefaultConvertible {
    private enum CodingKeys: String, CodingKey {
        case name = "trackName"
        case writer = "artistName"
        case imageURL = "artworkUrl100"
        case url = "trackViewUrl"
        case about = "description"
        case releaseDate = "releaseDate"
    }
}
