//
//  ModelProtocol.swift
//  Booker
//
//  Created by Masashi Aso on 2019/10/05.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import Foundation
import Combine

protocol ModelProtocol: ObservableObject {
    var bookingDatas: [BookingData] { get set }
}
