//
//  NewBookingView.swift
//  Booker
//
//  Created by Masashi Aso on 2019/09/11.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI

struct NewBookingView: View {
    
    @Binding var booking: BookingData?
    @State var test: String = ""
    
    var body: some View {
        Form {
            List {
//                VStack {
                    TextField("test", text: $test)
//                    TextField(.test, text: $booking.about)
//                }
            }
        }
    }
}

struct NewBookingView_Previews: PreviewProvider {
    static var previews: some View {
        NewBookingView(booking: .constant(nil))
    }
}
