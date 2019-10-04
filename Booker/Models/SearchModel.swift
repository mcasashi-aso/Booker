//
//  SearchModel.swift
//  Booker
//
//  Created by Masashi Aso on 2019/10/03.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import Foundation
import Combine

protocol SearchModelProtocol {
    var books: [Book] { get set }
    var searchText: String { get set }
    
}

class SearchModel: ObservableObject {
    
    @Published var books = [Book]()
    
    var searchText = "" {
        didSet { search() }
    }
    
    func search() {
        
        // TODO: get JSON from iTunesAPI
        let json: Data = testData
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do {
            let response = try decoder.decode(APIResponse.self, from: json)
            books = response.results.map { Book(from: $0) }
        }catch let error {
            print("search error: \(error)")
        }
    }
    
    func comfirmToURLString() -> String {
        return ""
    }
    
    struct APIResponse: Decodable {
        var results: [iTunesAPIResponse]
    }
    
}
