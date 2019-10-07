//
//  UserDefaultsKeys.swift
//  Booker
//
//  Created by Masashi Aso on 2019/09/09.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI

fileprivate typealias Key = UserDefaultTypedKey

extension UserDefaultTypedKeys {
    static let bookingDatas = Key<Array<BookingData>>("bookingDatas")
    static let dataReadAgain = Key<Set<BookingData>>("dataReadAgain")
}
