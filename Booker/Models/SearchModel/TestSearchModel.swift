//
//  TestSearchModel.swift
//  Booker
//
//  Created by Masashi Aso on 2019/10/16.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import Foundation
import Combine

final class TestSearchModel: SearchModelProtocol {
    var books: [Book] = {
        TestModel().bookingDatas.map { $0.book }
    }()
    
    @Published var searchText = "" {
        didSet { search() }
    }
    
    func search() {
        books = books.shuffled()
    }
    
}
