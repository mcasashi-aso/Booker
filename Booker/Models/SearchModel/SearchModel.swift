//
//  SearchModel.swift
//  Booker
//
//  Created by Masashi Aso on 2019/10/03.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import Foundation
import Combine

class SearchModel: SearchModelProtocol {
    
    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    @Published var books = [Book]()
    
    var searchText = "" {
        didSet { search() }
    }
    
    func search() {
        guard let cordedText = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let countryCode = Locale.current.regionCode,
            let languageCode = Locale.current.languageCode,
            let url = URL(string: "https;//itunes.apple.com/search?term=\(cordedText)&media=ebook&entity=ebook&country=\(countryCode)&limit=15&lang\(languageCode)") else { return }
        
        URLSession.shared.dataTask(with: url) { (result, _, error) in
            guard let result = result, error != nil else {
                print("API(iTunesAPI): \(String(describing: error))"); return
            }
            do {
                let decoded = try self.decoder.decode(iTunesAPIResponse.self, from: result)
                DispatchQueue.main.async {
                    self.books = decoded.results.map { self.itunesAPIResponseToBook(from: $0) }
                }
            }catch let error {
                print("search error: \(error)")
            }
        }
    }
}
