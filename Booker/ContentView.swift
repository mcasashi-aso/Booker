//
//  ContentView.swift
//  Booker
//
//  Created by Masashi Aso on 2019/09/09.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var datas: [BookingData] = [
        BookingData(book: Book(name: "book", writer: "writer", imageName: "image", url: URL(string: "www.google.com")!), createDate: Date(), about: "about", opinion: "opinion")
    ]
    
    var body: some View {
        NavigationView {
            List(datas) { data in
                HStack {
                    VStack {
                        Text(data.book.name)
                        Text(data.about)
                    }
                    Spacer()
                    Text(data.createDate.description)
                }
            }.navigationBarTitle("Booker")
                .navigationBarItems(trailing: Button(action: {}) {
                    Image(systemName: "square.and.pencil")
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
