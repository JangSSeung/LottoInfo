//
//  ButtonCustom.swift
//  uuugl
//
//  Created by 장승호 on 4/30/24.
//

import SwiftUI

struct ButtonCustom: View {
    
    
    let text: String
    
    var fontColor: Color = Color.white100()
    var backgroundColor: Color = Color.blue100()
    
    var width: CGFloat = .infinity
    var height: CGFloat = 38
    
    let doAction: (()->Void)
    
    var body: some View {
        ZStack {
            Button(action: {
                doAction()
            }) {
                Text(text)
                    .bold15(fontColor)
                    .frame(maxWidth: width, minHeight: height, maxHeight: height)
                    .background(backgroundColor)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .buttonStyle(BaseButtonStyle(0.8))
            
        }
    }
}

#Preview {
    ButtonCustom(text: "go", doAction: {
        
    })
}
