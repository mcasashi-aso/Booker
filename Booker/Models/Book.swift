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
    var imageURL: URL? = nil
    var smallImageURL: URL?
    var url: URL?
    var releaseDate: Date?
    
    init(name: String, writer: String, about: String? = nil,
         imageURL: URL? = nil, smallImageURL: URL? = nil,
         url: URL? = nil, releaseDate: Date? = nil) {
        self.name = name; self.writer = writer; self.about = about
        self.imageURL = imageURL; self.smallImageURL = smallImageURL
        self.url = url; self.releaseDate = releaseDate
    }
    
    init(from iTunesAPIResponse: iTunesAPIResponse) {
        name = iTunesAPIResponse.trackName
        writer = iTunesAPIResponse.artistName
        about = iTunesAPIResponse.description
        smallImageURL = iTunesAPIResponse.artworkUrl100
        if var url = iTunesAPIResponse.artworkUrl100 {
            url.deleteLastPathComponent()
            url.appendPathComponent("1000x1000bb.jpg")
            imageURL = url
        }
        url = iTunesAPIResponse.trackViewUrl
        releaseDate = iTunesAPIResponse.releaseDate
        
    }
}

extension Book: CustomStringConvertible, CustomDebugStringConvertible, CustomReflectable {
    var description: String { "\(name)  -\(writer)" }
    var debugDescription: String { "\(id)  -\(name)" }
    var customMirror: Mirror { Mirror(reflecting: self) }
}

extension Book: Codable, UserDefaultConvertible {}
