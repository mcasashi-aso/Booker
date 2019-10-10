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
                Section(header: Text("Book")) {
                    TextField("title", text: $searchModel.searchText,
                              onEditingChanged: { _ in
                                self.searchModel.search()
                                self.editingBookTitle = true },
                              onCommit: { self.endEditing() })
                    
                    // FIXME: For Check text and books
                    Text("\(searchModel.searchText)-\(searchModel.books.count): \(searchModel.books[safe: 0]?.description ?? "")")
                        .lineLimit(1)
                    
                    // TODO: 高さ0のCell作れなくね
                    HorizontalSelectView(searchModel.books, selection: $data.book) { book in
                        ZStack {
                            SuggestedBookView(book: book)
                            if book == self.data.book {
                                Image(systemName: "checkmark")
                                Color.gray
                            }
                        }
                    }
                    .frame(height: self.editingBookTitle ? 200 : 0)
                }
                
                Section(header: Text("about")) {
                    // TODO: 改行できなくね？まじ？
                    TextField("about", text: $data.about)
                        .lineLimit(0)
                        .frame(minWidth: 100, maxWidth: 200, minHeight: 50, idealHeight: 200, maxHeight: 200, alignment: .topLeading)

                   
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("New Booking")
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
