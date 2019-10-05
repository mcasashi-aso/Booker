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
                          onCommit: {
                            UIApplication.shared.windows.first { $0.isKeyWindow }?.endEditing(true)
                            self.editingBookTitle = false
                })
                
                if editingBookTitle {
                    SearchResultsView(books: searchModel.books, data: $data)
                        .frame(height: 200)
                }
            }.navigationBarTitle("New Booking")
        }
    }
}

struct NewBookingView_Previews: PreviewProvider {
    static var previews: some View {
        NewBookingView(searchModel: SearchModel())
    }
}


struct SearchResultsView: View {
    var books: [Book]
    @Binding var data: BookingData
    var body: some View {
        if !books.isEmpty { return AnyView(
            ScrollView(.horizontal) {
                ForEach(books) { book in
                    SuggestedBookView(book: book)
                        .frame(width: 150)
                        .gesture(TapGesture(count: 1).onEnded {
                            self.data.book = book
                        })
                }
            })
        }else { return AnyView(
            Text("No Result")
        )}
    }
}
