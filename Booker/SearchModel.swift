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
        
    }
    
    func comfirmToURLString() -> String {
        return ""
    }
    
    struct iTunesAPIRes {
        var results: [Book]
    }
    
}
