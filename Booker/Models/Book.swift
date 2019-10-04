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
    var imageURL: URL?
    var smallImageURL: URL? = nil
    var url: URL?
    var releaseDate: Date?
    
    init(name: String, writer: String, about: String? = nil, imageURL: URL? = nil, url: URL? = nil, releaseDate: Date? = nil) {
        (self.name, self.writer, self.about, self.imageURL, self.url, self.releaseDate)
            = (name, writer, about, imageURL, url, releaseDate)
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
        case smallImageURL = "artworkUrl100"
        case url = "trackViewUrl"
        case about = "description"
        case releaseDate = "releaseDate"
    }
}
