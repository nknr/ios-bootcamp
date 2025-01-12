//
//  CustomField.swift
//  ios-bootcamp
//
//  Created by Neeraj Kumar on 12/01/25.
//

import SwiftUI

struct CustomInputField: View {
    @Binding var text: String
    let hint: String
    let keyboardType: UIKeyboardType
    let borderColor: Color
    let cornerRadius: CGFloat
    let padding: EdgeInsets
    let borderStroke: CGFloat
    let isDisabled: Bool
    let disableBorderColor: Color
    
    init(hint: String,
         text: Binding<String>,
         keyboardType: UIKeyboardType = .default,
         borderColor: Color = .blue,
         cornerRadius: CGFloat = 8,
         padding: EdgeInsets = EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16),
         borderStroke: CGFloat = 2,
         isDisabled: Bool = false,
         disableBorderColor: Color = .gray
         
    ) {
        self.hint = hint
        self._text = text
        self.keyboardType = keyboardType
        self.borderColor = borderColor
        self.cornerRadius = cornerRadius
        self.padding = padding
        self.borderStroke = borderStroke
        self.isDisabled = isDisabled
        self.disableBorderColor = disableBorderColor
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            TextField(hint, text: $text)
                .keyboardType(keyboardType)
                .disabled(isDisabled)
                .autocorrectionDisabled(true) // Disable autocorrection
                .disableAutocorrection(true)
                .padding(padding)
                .background(RoundedRectangle(cornerRadius: cornerRadius).stroke(isDisabled ? disableBorderColor : borderColor, lineWidth: borderStroke))
        }
    }
}

struct ContentInputField: View {
    @State private var name: String = "Neeraj"
    @State private var disableField: String = "Hello"
    var body: some View {
        Group {
            CustomInputField(hint: "Name", text: $name)
            CustomInputField(hint: "Disable field ", text: $disableField, isDisabled: true)
        }
        .padding()
    }
}


#Preview {
    ContentInputField()
}
