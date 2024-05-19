//
//  BaseButtonStyle.swift
//  uuugl
//
//  Created by 장승호 on 4/30/24.
//

import SwiftUI

import SwiftUI

struct BaseButtonStyle: ButtonStyle {
    
    let opacity:CGFloat
    let scaleEffect: CGFloat
    
    init(_ opacity:CGFloat = 0.85, _ scaleEffect: CGFloat = 1) {
        self.opacity = opacity
        self.scaleEffect = scaleEffect
    }
    
    func makeBody(configuration: Configuration) -> some View {
        BaseButtonStyleView(configuration: configuration, opacity: opacity, scaleEffect: scaleEffect)
    }
}

private extension BaseButtonStyle {
    struct BaseButtonStyleView: View {
        @Environment(\.isEnabled) var isEnabled
        let configuration: BaseButtonStyle.Configuration
        let opacity: CGFloat
        let scaleEffect: CGFloat
        var body: some View {
            return configuration.label
                .opacity(isEnabled ? (configuration.isPressed ? opacity : 1.0) : 0.85)
                .scaleEffect(isEnabled ? (withAnimation{configuration.isPressed} ? scaleEffect : 1.0) : 1.0)
                
        }
    }
}
