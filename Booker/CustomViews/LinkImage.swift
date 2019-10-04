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
            Image(data: $0)?.resizable().aspectRatio(contentMode: .fit))
            } ?? AnyView(placeholder)
    }
    
    init(_ urlString: String?, @ViewBuilder placeholder: () -> Placeholder) {
        self.placeholder = placeholder()
        self.loader = ImageLoader(urlString: urlString)
    }
}

struct LinkImage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LinkImage("https://pbs.twimg.com/media/EFrrF1jU0AEr7fA?format=jpg&name=large") {
                Text("placeholder")
            }.frame(width: 250, height: 500)
            LinkImage("https://pbs.twimg.com/media/EFrrF1jU0AEr7fA?format=jpg&name=large") {
                Image(systemName: "camera")
            }
        }
    }
}


class ImageLoader: ObservableObject {
    var urlString: String?
    @Published var data: Data? = nil
    
    init(urlString: String?) {
        self.urlString = urlString
        load()
    }
    
    func callAsFunction() { load() }
    
    func load() {
        if let string = urlString,
            let url = URL(string: string) {
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                guard let result = data, error == nil else{
                    print(error!)
                    return
                }
                
                DispatchQueue.main.async {
                    self.data = result
                }
            }.resume()
        }
    }
}
