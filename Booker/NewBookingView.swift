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
    @ObservedObject var searchModel: SearchModelProtocol
    
    var body: some View {
        NavigationView {
            List {
                TextField(.test, text: $searchModel.searchText, onEditingChanged: { edited in
                    
                }, onCommit: {
                    
                })
                
            }
        }.navigationBarTitle("New Booking")
    }
}

struct NewBookingView_Previews: PreviewProvider {
    static var previews: some View {
        NewBookingView(searchModel: SearchModel())
    }
}
