//
//  NewBookingView.swift
//  Booker
//
//  Created by Masashi Aso on 2019/09/11.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI

struct NewBookingView: View {
    
    @State var data = BookingData(book: Book(name: "", writer: ""), about: "", opinion: "")
    
    var body: some View {
        NavigationView {
            List {
                TextField(.test, text: $data.book.name)
                
                
            }
        }.navigationBarTitle("New Booking")
    }
}

struct NewBookingView_Previews: PreviewProvider {
    static var previews: some View {
        NewBookingView()
    }
}
