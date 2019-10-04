//
//  SearchModelProtocol.swift
//  Booker
//
//  Created by Masashi Aso on 2019/10/05.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import Foundation
import Combine

protocol SearchModelProtocol: ObservableObject {
    var books: [Book] { get set }
    var searchText: String { get set }
    func search()
    func itunesAPIResponseToBook(from res: iTunesAPIResponse.Result) -> Book
}

extension SearchModelProtocol {
    func itunesAPIResponseToBook(from res: iTunesAPIResponse.Result) -> Book {
        Book(name: res.trackName,
             writer: res.artistName,
             about: res.description,
             imageURL: res.artworkUrl100.flatMap { string in
                var url = URL(string: string)
                url?.deleteLastPathComponent()
                url?.appendPathComponent("1024x1024bb.jpg")
                return url
             },
             smallImageURL: res.artworkUrl100.flatMap { URL(string: $0) ?? nil },
             url: res.trackViewUrl.flatMap { URL(string: $0) },
             releaseDate: res.releaseDate)
    }
}
