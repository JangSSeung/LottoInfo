//
//  ToastMsg.swift
//  uuugl
//
//  Created by 장승호 on 5/9/24.
//

import SwiftUI

struct ToastMsg: View {
    
    @Binding var isShow:Bool
    
    var message: String
    var position: ToastPosition = .bottom
    
    var body: some View {
        ZStack {
            //토스트 메시지
            if self.isShow {
                VStack {
                    if self.position == .bottom {
                        Spacer()
                    }
                    HStack {
                        Text(self.message)
                            .font(Font.defaultBold(12))
                            .foregroundColor(Color.white100())
                    }
                    .padding(8)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(minHeight: 50)
                    .background(Color.black100(0.6))
                    .cornerRadius(10)
                    .padding(40)
                }.transition(AnyTransition.opacity.animation(.linear(duration: 0.1)))
                    .padding(.bottom, self.position == .bottom ? 35 : 0)
            }
        }
    }
}

#if DEBUG
struct ToastMsg_Previews: PreviewProvider {
    static var previews: some View {
        ToastMsg(isShow: .constant(true), message: "테스트", position: .bottom)
    }
}
#endif
