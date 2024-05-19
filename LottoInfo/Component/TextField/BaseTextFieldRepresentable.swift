//
//  BaseTextFieldRepresentable.swift
//  uuugl
//
//  Created by 장승호 on 4/30/24.
//

import Foundation
import SwiftUI
import UIKit
import Combine

struct BaseTextFieldRepresentable: UIViewRepresentable {
    @Binding var text:String
    @Binding var placeholder: String
    @Binding var isFocused: Bool
    
    var fontSize: CGFloat = 12
    var fontColor: Color = Color.black100()
    var placeholderColor: Color = Color.placeholderGray()
    var background: Color = Color.white
    var noEditingBackground: Color = Color.gray
    var cornerRadius: CGFloat = 5
    
    var leftPadding: CGFloat = 16
    var rightPadding: CGFloat = 16
    
    var type: UIKeyboardType = .default
    var limit: Int?
    var isEditing: Bool = true
    
    var onCommit: ((String)->Void)?
    
    func makeUIView(context: UIViewRepresentableContext<BaseTextFieldRepresentable>) -> UITextField {
        let textField = UITextField()
        
        textField.backgroundColor = UIColor(isEditing ? background : noEditingBackground)
        textField.layer.cornerRadius = cornerRadius
        
        // 가운데 정렬
//        textField.textAlignment = .center
        
        textField.textColor = UIColor(fontColor)
        textField.font = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
        textField.keyboardType = type
        textField.delegate = context.coordinator
        
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        
        let leftPaddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: textField.frame.height))
        let rightPaddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: rightPadding, height: textField.frame.height))
        
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always
        
        textField.rightView = rightPaddingView
        textField.rightViewMode = .always
        
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor(placeholderColor)])
        
        textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        textField.placeholder = self.placeholder
        
        if !isEditing {
            textField.isUserInteractionEnabled = false
        }
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<BaseTextFieldRepresentable>) {
        uiView.text = self.text
        if isFocused {
            uiView.becomeFirstResponder()
        }
    }
    
    func makeCoordinator() -> BaseTextFieldRepresentable.Coordinator {
        Coordinator(text: $text, isFocused: $isFocused, limit: limit, isEditing: isEditing, onCommit: onCommit)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        @Binding var isFocused: Bool
        
        var limit: Int?
        var isEditing: Bool
        var onCommit: ((String)->Void)?
        
        init(text: Binding<String>, isFocused: Binding<Bool>, limit:Int?, isEditing:Bool = true, onCommit:((String) -> Void)?) {
            self._text = text
            self._isFocused = isFocused
            self.limit = limit
            self.isEditing = isEditing
            self.onCommit = onCommit
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            self.text = textField.text ?? ""
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            let text = textField.text ?? ""
            
            self.isFocused = false
            textField.resignFirstResponder()
            
            if let onCommit = self.onCommit {
                onCommit(text)
            }
            
            return true
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            
            let text = textField.text ?? ""
            
            if (textField.keyboardType == .numberPad) {
                guard let stringRange = Range(range, in: text) else { return false }
                let updatedText = text.replacingCharacters(in: stringRange, with: string)
                if !(updatedText.allSatisfy({ $0.isNumber })) {
                    return false
                }
            }
            
            if let limit = self.limit {
                guard let stringRange = Range(range, in: text) else { return false }
                let updatedText = text.replacingCharacters(in: stringRange, with: string)
                return updatedText.count <= limit
            }
            return true
        }
        
        func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            if (!isEditing) {
                return false
            }
            
//            print("textFieldShouldBeginEditing ----- 11111")
            
            return true
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                if !self.isFocused {
                    self.isFocused = true
                }
//                print("textFieldDidBeginEditing ----- 22222")
            }
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.isFocused = false
//                print("textFieldDidEndEditing ----- 33333")
            }
            
        }
    }
}
