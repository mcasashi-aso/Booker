//
//  BookView.swift
//  Booker
//
//  Created by Masashi Aso on 2019/10/07.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI

struct BookView: View {
    let book: Book
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                
                LinkImage(self.book.imageURL) {
                    Image(systemName: "book")
                        .font(.system(size: 60))
                }.frame(height: geometry.size.height * 0.6)
                
                Button(action: {
                    guard let url = self.book.url else { return }
                    UIApplication.shared.open(url)
                }) {
                    Text("Open in Apple Books")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .disabled(self.book.url == nil)
                .frame(width: geometry.size.width - 90, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color.gray)
                )
                
                Text(self.book.writer ?? "")
                
                Text(self.book.releaseDate?.dayString ?? "")
                
                if self.book.about != nil {
                    Text(self.book.about!).padding()
                }
            }
        }
        .navigationBarTitle(book.name)
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(book: TestModel().bookingDatas[1].book)
    }
}
