//
//  BaseTextField.swift
//  uuugl
//
//  Created by 장승호 on 4/30/24.
//

import SwiftUI

struct BaseTextField: View {
    
    @Binding var text: String
    @Binding var placeholder: String
    @Binding var isFocused: Bool
    
    
    var fontSize: CGFloat = 12
    var fontColor: Color = Color.black100()
    var placeholderColor: Color = Color.placeholderGray()
    
    var background: Color = Color.white
    var noEditingBackground: Color = Color.gray
    var cornerRadius: CGFloat = 10
    
    var isBorder: Bool = true
    var isBorderColorChange: Bool = false
    var borderColor: Color = Color.gray
    var changeBorderColor: Color = Color.blue
    var borderWidth: CGFloat = 1
    
    var leftPadding: CGFloat = 16
    var rightPadding: CGFloat = 16
    
    var type: UIKeyboardType = .default
    var limit: Int?
    var isEditing: Bool = true
    var width: CGFloat = .infinity
    var height: CGFloat = 40
    
    var onChange: ((String) -> Void)? = nil
    var onCommit: ((String) -> Void)? = nil
    
    
    var body: some View {
        
        ZStack {
            BaseTextFieldRepresentable(text: $text,
                                       placeholder: $placeholder,
                                       isFocused: $isFocused,
                                       fontSize: fontSize,
                                       fontColor: fontColor,
                                       placeholderColor: placeholderColor,
                                       background: background,
                                       noEditingBackground: noEditingBackground,
                                       cornerRadius: cornerRadius,
                                       leftPadding: leftPadding,
                                       rightPadding: rightPadding,
                                       type: type,
                                       limit: limit,
                                       isEditing: isEditing,
                                       onCommit: onCommit)
            
            .onChange(of: self.text) { text in
                if let onChange = onChange {
                    onChange(text)
                }
            }
            
            .onChange(of: self.placeholder) { text in
                if let onChange = onChange {
                    onChange(placeholder)
                }
            }
            
        }
        .background(self.isEditing ? background : noEditingBackground)
        .cornerRadius(cornerRadius)
        .overlay(RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(!isBorder ? Color.clear : isBorderColorChange ? (isFocused ? changeBorderColor : borderColor) : borderColor, lineWidth: borderWidth))
        .frame(maxWidth: width, minHeight: height, maxHeight: height)
        .onTapGesture {
            // 복사,붙여넣기 팝업
            UIApplication.shared.sendAction(#selector(UIResponder.becomeFirstResponder), to: nil, from: nil, for: nil)
        }
        
    } // end body
}

struct BaseTextField_Previews: PreviewProvider {
    @State static var text:String = "165156"
    @State static var isFocused: Bool = false
    
    
    static var previews: some View {
        BaseTextField(text: $text,
                     placeholder: .constant("gdgdgdgdgd"),
                    isFocused: $isFocused,
                    type: .default,
                    onCommit: {
            text in
        })
        .frame(width: 300, height: 50)
    }
}
