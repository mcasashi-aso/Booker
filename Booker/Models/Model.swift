//
//  Model.swift
//  Booker
//
//  Created by Masashi Aso on 2019/09/09.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI
import Combine

protocol ModelProtocol {
    var bookingDatas: [BookingData] { get set }
}

class Model: ModelProtocol, ObservableObject {
    
    private let userDefaults = UserDefaults.standard
    
    init() {
        
    }
    
    @Published var bookingDatas = UserDefaults.standard.get(.bookingDatas) ?? [] {
        didSet { userDefaults.set(bookingDatas, forKey: .bookingDatas) }
    }
    
}
