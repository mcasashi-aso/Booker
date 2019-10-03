//
//  TestModel.swift
//  Booker
//
//  Created by Masashi Aso on 2019/10/01.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import Foundation
import Combine

class TestModel: ModelProtocol, ObservableObject {
    
    init() {}
    
    @Published var bookingDatas: [BookingData] = {
        let aBook = Book(name: "HuMain Interface", writer: "Jef Raskin")
        let aDate = Date(month: 9, day: 25, hour: 15, minute: 2)
        let aData = BookingData(book: aBook, createdAt: aDate,
                                about: "人にやさしいシステムへの新たな指針",
                                opinion: "まだ読んでない。読みたい")
        let bBook = Book(name: "Ditective Conan", writer: "Gosyo Aoyama", imageURL: "conan",
                         url: "https://websunday.net/rensai/conan/")
        let bData = BookingData(book: bBook,
                                about: "真実はいつも一つ！",
                                opinion: "警察学校編も早く読みたいけど、単行本いつ出るかね")
        let cBook = Book(name: "消極性デザイン宣言", writer: "渡辺恵太", imageURL: "https://pbs.twimg.com/media/EFrrF1jU0AEr7fA?format=jpg&name=large")
        let cData = BookingData(book: cBook, createdAt: Date(year: 2018),
                                about: "消極的な人よ、声を上げよ。……いや、上げなくてよい。",
                                opinion: "読まねば")
        return [aData, bData, cData]
    }()

}
