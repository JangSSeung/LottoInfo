//
//  BaseHeader.swift
//  uuugl
//
//  Created by 장승호 on 4/30/24.
//

import SwiftUI

struct BaseHeader: View {
    
    var title: String?
    
    var body: some View {
        VStack (spacing: 0) {
            ZStack {
                HStack(spacing: 0) {
                    Button(action: {
                        
                    }) {
                        Image("img_text_logo")
                            .resizable()
                            .frame(width: 62, height: 42)
                    }
                    .buttonStyle(BaseButtonStyle(1))
                    
                    Spacer()
                }
                
                if let title = self.title {
                    Text(title)
                }
                
                HStack (spacing: 0) {
                    Spacer()
                    Text("Login")
                }
            }
            .frame(height: 70)
            .padding(.horizontal, 20)
            
            BaseDivider()
        }
    }
}

#Preview {
    BaseHeader()
}
