//
//  NewBookingView.swift
//  Booker
//
//  Created by Masashi Aso on 2019/09/11.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI

struct NewBookingView<ObsearvableModel: SearchModelProtocol>: View {
    
    @State var editingBookTitle = false
    @State var data = BookingData(book: Book(name: "", writer: ""), about: "", opinion: "")
    @ObservedObject var searchModel: ObsearvableModel
    
    var body: some View {
        NavigationView {
            List {
                TextField("title", text: $searchModel.searchText,
                          onEditingChanged: { _ in self.editingBookTitle = true },
                          onCommit: { self.endEditing() })
                
                if editingBookTitle {
                    HorizontalSelectView(searchModel.books, selection: $data.book) { book in
                        ZStack {
                            SuggestedBookView(book: book)
                            if book == self.data.book { Image(systemName: "checkmark") }
                        }
                    }.frame(height: 200)
                }
            }.navigationBarTitle("New Booking")
        }
    }
    
    func endEditing() {
        UIApplication.shared.windows.first { $0.isKeyWindow }?.endEditing(true)
        editingBookTitle = false
    }
}

struct NewBookingView_Previews: PreviewProvider {
    static var previews: some View {
        NewBookingView(searchModel: SearchModel())
    }
}
