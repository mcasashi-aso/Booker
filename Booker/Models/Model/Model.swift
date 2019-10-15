//
//  Model.swift
//  Booker
//
//  Created by Masashi Aso on 2019/10/05.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import Foundation
import Combine

final class Model: ModelProtocol {
    
    private let userDefaults = UserDefaults.standard
    
    init() {
        
    }
    
    @Published var bookingDatas = UserDefaults.standard.get(.bookingDatas) ?? [] {
        didSet { userDefaults.set(bookingDatas, forKey: .bookingDatas) }
    }
    
}
