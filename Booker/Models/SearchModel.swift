//
//  SearchModel.swift
//  Booker
//
//  Created by Masashi Aso on 2019/10/03.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import Foundation
import Combine

class SearchModel: ObservableObject {
    
    @Published var results = [Book]()
    
    var searchText = "" {
        didSet { search() }
    }
    
    func search() {
        
        // TODO: get JSON from iTunesAPI
        var results: iTunesAPIRes = iTunesAPIRes(results: [])
        let urlChanged: [Book] = results.results.map { book in
            book.imageURL = book.smallImageURL
        }
    }
    
    func comfirmToURLString() -> String {
        return ""
    }
    
    struct iTunesAPIRes {
        var results: [Book]
    }
    
}
