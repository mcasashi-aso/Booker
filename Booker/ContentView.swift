//
//  ContentView.swift
//  Booker
//
//  Created by Masashi Aso on 2019/09/09.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var newIsPresented = false
    
    @State var datas: [BookingData] = {
        let aBook = Book(name: "a", writer: "a", imageName: "image", url: URL(string: "www.google.com")!)
        let aData = BookingData(book: aBook, createDate: Date(), about: "about", opinion: "opinion")
        
        return [aData]
    }()
    
    var body: some View {
        NavigationView {
            List(datas.sorted(by: <)) { data in
                HStack {
                    Image(systemName: "book").font(.largeTitle)
                    VStack {
                        Text(data.book.name).font(.title)
                        Text(data.about)
                    }
                    Spacer()
                    Text(data.createDate.description)
                }
            }.navigationBarTitle("Booker")
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
        ContentView()
    }
}
