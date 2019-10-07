//
//  BookView.swift
//  Booker
//
//  Created by Masashi Aso on 2019/10/07.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI

struct BookView: View {
    let book: Book
    var body: some View {
        Text(book.name)
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(book: TestModel().bookingDatas[1].book)
    }
}
