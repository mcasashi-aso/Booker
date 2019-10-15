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
    
    @State var editing: Bool
    
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
                            
                            VStack(alignment: .leading) {
                                Text(self.data.book.writer ?? "")
                                Text(self.data.book.releaseDate?.dayString ?? "")
                            }
                            .frame(width: geometry.size.width / 2)
                        }
                    }
                }
                .frame(height: UIScreen.main.bounds.width / 16 * 9)
                .foregroundColor(.primary)
                
                Divider()
                Text(data.about).padding()
                Text(data.opinion).padding()
            }
        }
        .navigationBarItems(trailing: Button(action: {
            
        }) { Text("Edit") })
            .sheet(isPresented: $editing) {
                <#code#>
        }
    }
}

struct BookingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookingDetailView(data: TestModel().bookingDatas[3])
    }
}
