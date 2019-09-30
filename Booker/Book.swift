//
//  Book.swift
//  Booker
//
//  Created by Masashi Aso on 2019/09/09.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI

struct Book: Hashable, Identifiable {
    var id = UUID()
    
    var name: String
    var writer: String
    var imageName: String
    var url: URL
}

extension Book: CustomStringConvertible, CustomDebugStringConvertible, CustomReflectable {
    var description: String { "\(name)  -\(writer)" }
    var debugDescription: String { "\(id)  -\(name)" }
    var customMirror: Mirror { Mirror(reflecting: self) }
}

extension Book: Codable, UserDefaultConvertible {}
