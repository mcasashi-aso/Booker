//
//  NewBookingView.swift
//  Booker
//
//  Created by Masashi Aso on 2019/09/11.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI

struct NewBookingView: View {
    
    @State var booking = BookingData(book: Book(name: "", writer: "", imageName: "", url: URL(string: "google.com")!), createDate: Date(), about: "", opinion: "")
    
    var body: some View {
        Form {
            List {
                TextField(.test, text: $booking.book.name)
            }
        }
    }
}

struct NewBookingView_Previews: PreviewProvider {
    static var previews: some View {
        NewBookingView()
    }
}
