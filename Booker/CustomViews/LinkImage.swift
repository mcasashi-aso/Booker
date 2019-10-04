//
//  LinkImage.swift
//  Booker
//
//  Created by Masashi Aso on 2019/10/03.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI
import Combine

struct LinkImage<Placeholder>: View where Placeholder: View {
    
    @ObservedObject var loader: ImageLoader
    var placeholder: Placeholder
    
    var body: some View {
        loader.data.map { AnyView(
            Image(data: $0)?.resizable().aspectRatio(contentMode: .fit)
            )} ?? AnyView(placeholder)
    }
    
    init(_ url: URL?, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        self.loader = ImageLoader(url: url)
    }
}

struct LinkImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LinkImage(URL(string: "https://pbs.twimg.com/media/EFrrF1jU0AEr7fA?format=jpg&name=large")) {
                Text("placeholder")
            }.frame(width: 250, height: 500)
            LinkImage(URL(string: "https://pbs.twimg.com/media/EFrrF1jU0AEr7fA?format=jpg&name=large")) {
                Image(systemName: "camera")
            }
        }
    }
}


class ImageLoader: ObservableObject {
    @Published var data: Data? = nil
    
    init(url: URL?) {
        load(url)
    }
    
    func load(_ url: URL?) {
        if let url = url {
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let error = error { print("Error: \(error)") }
                
                DispatchQueue.main.async {
                    self.data = data
                }
            }.resume()
        }
    }
}
