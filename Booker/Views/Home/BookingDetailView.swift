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
    
    var body: some View {
        ScrollView {
            VStack {
                NavigationLink(destination: BookView(book: data.book)) {
                    HStack {
                        GeometryReader { geometry in
                            LinkImage(self.data.book.imageURL) {
                                Image(systemName: "book")
                                    .font(.largeTitle)
                            }   .padding()
                                .frame(width: geometry.size.width / 256 * 81)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(data.book.writer ?? "")
                            Text(data.book.releaseDate?.dayString ?? "")
                            Button(action: {}) {
                                Text("Apple Books")
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                }   .frame(height: UIScreen.main.bounds.width / 16 * 9)
                    .foregroundColor(.black)
                
                Divider()
                Text(data.about).padding()
            }
        }
    }
}

struct BookingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookingDetailView(data: TestModel().bookingDatas[1])
    }
}
