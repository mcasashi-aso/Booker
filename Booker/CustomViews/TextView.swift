//
//  TextView.swift
//  Booker
//
//  Created by Masashi Aso on 2019/10/11.
//  Copyright © 2019 Masashi Aso. All rights reserved.
//

import SwiftUI

class _TextView: UITextView, UITextViewDelegate {
    private lazy var placeholderLabel = UILabel(frame: CGRect(x: 6, y: 6, width: 0, height: 0))
    var placeholder: String? = nil {
        didSet {
            placeholderLabel.text = placeholder
            placeholderLabel.sizeToFit()
        }
    }
    
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        delegate = self
        configure()
        apply()
    }
    
    private func configure() {
        placeholderLabel.textColor = UIColor.systemGray3
        addSubview(placeholderLabel)
    }
    
    private func apply() {
        placeholderLabel.isHidden = text.isEmpty ? false : true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        apply()
    }
}

struct TextView: UIViewRepresentable {
    @Binding var text: String
    var font: UIFont
    var placeholder: String?
    var isEditable: Bool
    
    func makeUIView(context: Context) -> _TextView {
        _TextView()
    }
    
    func updateUIView(_ textView: _TextView, context: Context) {
        textView.text = text
        textView.font = font
        textView.isEditable = isEditable
        textView.placeholder = placeholder
    }
    
    init(_ text: Binding<String>, font: UIFont = .preferredFont(forTextStyle: .body),
         isEditable: Bool, placeholder: String? = nil) {
        self._text = text
        self.font = font
        self.isEditable = isEditable
        self.placeholder = placeholder
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        TextView(.constant("longlongtext\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\nlonglonglong\n\n\n\n\n\n\n\n\n\naaaaaaaaaaa"),
                 font: UIFont.preferredFont(forTextStyle: .largeTitle), isEditable: false)
            
            TextView(.constant(""), isEditable: true, placeholder: "placeholder")
        }
    }
}
