//
//  ContentView.swift
//  Booker
//
//  Created by Masashi Aso on 2019/09/09.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State var newIsPresented = false
    
    @State var model: ModelProtocol
    
    var body: some View {
        NavigationView {
            List(model.bookingDatas.sorted(by: >)) { data in
                NavigationLink(destination: BookingDetailView(data: data)) {
                    BookingDataRow(data: data)
                }
            }
                .navigationBarTitle("Booker")
                .navigationBarItems(trailing: Button(action: {
                    self.newIsPresented.toggle()
                }) {
                    Image(systemName: "square.and.pencil").font(.body)
                })
                .sheet(isPresented: $newIsPresented, onDismiss: nil) {
                    NewBookingView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: TestModel())
    }
}
