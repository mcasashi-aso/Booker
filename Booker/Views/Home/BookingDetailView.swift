//
//  BookingDetailView.swift
//  Booker
//
//  Created by Masashi Aso on 2019/10/02.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI

struct BookingDetailView: View {
    
    var data: BookingData
    
    @State var editing = false
    
    var body: some View {
        ScrollView {
            VStack {
                NavigationLink(destination: BookView(book: data.book)) {
                    GeometryReader { geometry in
                        HStack(spacing: 0) {
                            LinkImage(self.data.book.imageURL) {
                                Image(systemName: "book")
                                    .font(.largeTitle)
                            }
                            .padding()
                            .frame(width: geometry.size.width / 3)
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    if self.data.book.writer != nil {
                                        Text(self.data.book.writer!) }
                                    if self.data.book.releaseDate != nil {
                                        Text(self.data.book.releaseDate!.dayString) }
                                }
                                Spacer()
                            }
                            .frame(width: geometry.size.width / 2)
                        }
                    }
                }
                .frame(height: UIScreen.main.bounds.width / 16 * 9)
                .foregroundColor(.primary)
                
                Divider()
                HStack {
                    VStack(alignment: .leading) {
                        Text("About").font(.title)
                            .padding(.leading)
                        Text(data.about)
                            .padding(.leading)
                        Text("Opinion").font(.title)
                            .padding([.leading, .top])
                        Text(data.opinion)
                            .padding(.leading)
                        Text("ReadingDate").font(.title)
                            .padding([.leading, .top])
                        Text(data.createDate.dayString)
                            .padding(.leading)
                    }
                    Spacer()
                }
            }
        }
        .navigationBarItems(trailing: Button(action: {
            self.editing.toggle()
        }) { Text("Edit") })
            .sheet(isPresented: $editing) {
                NewBookingView(data: self.data, searchModel: SearchModel())
        }
    }
}

struct BookingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookingDetailView(data: TestModel().bookingDatas[3])
    }
}
