//
//  iTunesAPIResponse.swift
//  Booker
//
//  Created by Masashi Aso on 2019/10/04.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import Foundation

struct iTunesAPIResponse: Decodable {
    let artworkUrl100: URL?
    let trackViewUrl: URL?
    let releaseDate: Date?
    let trackName: String
    let description: String?
    let artistName: String
    private init() {
        artworkUrl100 = nil; trackViewUrl = nil; releaseDate = nil;
        trackName = ""; description = nil; artistName = ""
    }
}
