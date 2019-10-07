//
//  MyStack.swift
//  Booker
//
//  Created by Masashi Aso on 2019/10/07.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI

struct MyStack<Content>: View where Content: View {
    
    var content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        if content is 
    }
}

struct MyStack_Previews: PreviewProvider {
    static var previews: some View {
        MyStack {
            Text("ace")
            Text("mn")
        }
    }
}
