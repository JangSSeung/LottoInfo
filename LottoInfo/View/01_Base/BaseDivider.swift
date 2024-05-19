//
//  BaseDivider.swift
//  uuugl
//
//  Created by 장승호 on 4/30/24.
//

import SwiftUI

struct BaseDivider: View {
    
    let height: CGFloat = 1
    let color: Color = Color.borderGray()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(color)
                .frame(height: height)
                
        }
    }
}

#Preview {
    BaseDivider()
}
