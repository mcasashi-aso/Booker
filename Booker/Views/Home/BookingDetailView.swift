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
                HStack {
                    LinkImage(data.book.imageURL) {
                        Image(systemName: "book").font(.largeTitle)
                    }   .padding()
                        .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.width / 16 * 9)
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .firstTextBaseline) {
                            Text(data.book.writer ?? "")
                            Text(data.book.releaseDate?.dayString ?? "")
                        }.lineLimit(1)
                        Text(data.book.about ?? "")
                    }
                }
                
                if data.book.about != nil {
                    Text(data.book.about!).padding()
                }
                
                Divider()
                Text(data.about).padding()
            }
        }.navigationBarTitle(data.book.name)
    }
}

struct BookingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookingDetailView(data: TestModel().bookingDatas[1])
    }
}
