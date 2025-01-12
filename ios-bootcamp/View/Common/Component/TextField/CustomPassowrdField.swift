//
//  CustomPassowrdView.swift
//  ios-bootcamp
//
//  Created by Neeraj Kumar on 12/01/25.
//

import SwiftUI

struct CustomPasswordField: View {
    @Binding var password: String
    var hint: String
    var keyboardType: UIKeyboardType
    var borderColor: Color
    var cornerRadius: CGFloat
    var padding: CGFloat
    var viewPadding: CGFloat
    var iconColor: Color
    
    // State to toggle password visibility
    @State private var isSecured: Bool = true
    
    init(
        hint: String,
        password: Binding<String>,
        keyboardType: UIKeyboardType = .default,
        borderColor: Color = .blue,
        cornerRadius: CGFloat = 8,
        padding: CGFloat = 16,
        viewPadding: CGFloat = 10,
        iconColor: Color = .blue
    ) {
        self._password = password
        self.hint = hint
        self.keyboardType = keyboardType
        self.borderColor = borderColor
        self.cornerRadius = cornerRadius
        self.padding = padding
        self.viewPadding = viewPadding
        self.iconColor = iconColor
    }
    
    var body: some View {
        
        // TextField with visibility toggle
        HStack(spacing: 16) {
            VStack {
                if isSecured {
                    SecureField(hint, text: $password)
                        .keyboardType(keyboardType)
                        .autocorrectionDisabled(true) // Disable suggestions for password
                    
                } else {
                    TextField(hint, text: $password)
                        .keyboardType(keyboardType)
                        .autocorrectionDisabled(true) // Disable autocorrection
                }
            }
            Button(action: {
                isSecured.toggle()
            }) {
                Image(systemName: isSecured ? "eye.fill" : "eye.slash.fill")
                    .foregroundColor(iconColor)
                    .opacity(0.8)
            }
            
        }
        .padding(padding)
        .background(RoundedRectangle(cornerRadius: cornerRadius).stroke(borderColor, lineWidth: 2))
        .padding(.top, viewPadding)
    }
}

struct PasswordContentView: View {
    @State private var password: String = ""
    var body: some View {
        CustomPasswordField(hint: "Password", password: $password)
    }
}

#Preview {
    PasswordContentView()
}
