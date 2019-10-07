//
//  HorizontalSec.swift
//  Booker
//
//  Created by Masashi Aso on 2019/10/07.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI

struct HorizontalSelectView<Value, Cell>: View where Value: Identifiable, Cell: View {
    var datas: [Value]
    @Binding var selecting: Value
    
    var cell: (Value) -> Cell
    
    var body: some View {
        if !datas.isEmpty { return AnyView(
            ScrollView(.horizontal) {
                HStack {
                    ForEach(datas) { data in
                        self.cell(data)
                            .gesture(TapGesture(count: 1).onEnded {
                                withAnimation { self.selecting = data }
                            })
                    }
                }
            })
        }else {
            return AnyView(Text("blank"))
        }
    }
    
    init(_ datas: [Value], selecting: Binding<Value>,
         @ViewBuilder cell: @escaping (Value) -> Cell) {
        self.datas = datas
        self._selecting = selecting
        self.cell = cell
    }
}

fileprivate struct HorizontalSelectView_For_Previews: View {
    enum Season: String, CaseIterable, Identifiable {
        var id: String { rawValue }
        case spring, summer, fall, winter
    }
    @State var selecting: Season = .spring
    var body: some View {
        HorizontalSelectView(Season.allCases, selecting: $selecting) { season in
            Text(season.rawValue)
                .animation(.spring())
                .foregroundColor(season == self.selecting ? .red : .black)
        }
    }
}

struct HorizontalSelectView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalSelectView_For_Previews()
    }
}
