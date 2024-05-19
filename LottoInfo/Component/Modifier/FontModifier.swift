//
//  FontModifier.swift
//  uuugl
//
//  Created by 장승호 on 4/30/24.
//

import Foundation
import SwiftUI

struct FontModifier: ViewModifier {
    
    let font: Font
    let color: Color
    let lineSpacing: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(color)
            .lineSpacing(lineSpacing)
            .padding(.vertical, lineSpacing / 2)
    }
}

extension View {
    // extraBold 800
    func extraBold20(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultExtraBold(20), color: color, lineSpacing: 2))
    }
    
    func extraBold19(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultExtraBold(19), color: color, lineSpacing: 2))
    }
    
    func extraBold18(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultExtraBold(18), color: color, lineSpacing: 2))
    }
    
    func extraBold17(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultExtraBold(17), color: color, lineSpacing: 2))
    }
    
    func extraBold16(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultExtraBold(16), color: color, lineSpacing: 2))
    }
    
    func extraBold15(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultExtraBold(15), color: color, lineSpacing: 2))
    }
    
    func extraBold14(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultExtraBold(14), color: color, lineSpacing: 2))
    }
    
    func extraBold13(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultExtraBold(13), color: color, lineSpacing: 2))
    }
    
    func extraBold12(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultExtraBold(12), color: color, lineSpacing: 2))
    }
    
    func extraBold11(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultExtraBold(11), color: color, lineSpacing: 2))
    }
    
    func extraBold10(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultExtraBold(10), color: color, lineSpacing: 2))
    }
    
    // bold 700
    func bold20(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultBold(20), color: color, lineSpacing: 2))
    }
    
    func bold19(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultBold(19), color: color, lineSpacing: 2))
    }
    
    func bold18(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultBold(18), color: color, lineSpacing: 2))
    }
    
    func bold17(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultBold(17), color: color, lineSpacing: 2))
    }
    
    func bold16(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultBold(16), color: color, lineSpacing: 2))
    }
    
    func bold15(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultBold(15), color: color, lineSpacing: 2))
    }
    
    func bold14(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultBold(14), color: color, lineSpacing: 2))
    }
    
    func bold13(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultBold(13), color: color, lineSpacing: 2))
    }
    
    func bold12(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultBold(12), color: color, lineSpacing: 2))
    }
    
    func bold11(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultBold(11), color: color, lineSpacing: 2))
    }
    
    func bold10(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultBold(10), color: color, lineSpacing: 2))
    }
    
    // regular 400
    func regular20(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultRegular(20), color: color, lineSpacing: 2))
    }
    
    func regular19(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultRegular(19), color: color, lineSpacing: 2))
    }
    
    func regular18(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultRegular(18), color: color, lineSpacing: 2))
    }
    
    func regular17(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultRegular(17), color: color, lineSpacing: 2))
    }
    
    func regular16(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultRegular(16), color: color, lineSpacing: 2))
    }
    
    func regular15(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultRegular(15), color: color, lineSpacing: 2))
    }
    
    func regular14(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultRegular(14), color: color, lineSpacing: 2))
    }
    
    func regular13(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultRegular(13), color: color, lineSpacing: 2))
    }
    
    func regular12(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultRegular(12), color: color, lineSpacing: 2))
    }
    
    func regular11(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultRegular(11), color: color, lineSpacing: 2))
    }
    
    func regular10(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultRegular(10), color: color, lineSpacing: 2))
    }
    
    // light 300
    func light20(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultLight(20), color: color, lineSpacing: 2))
    }
    
    func light19(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultLight(19), color: color, lineSpacing: 2))
    }
    
    func light18(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultLight(18), color: color, lineSpacing: 2))
    }
    
    func light17(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultLight(17), color: color, lineSpacing: 2))
    }
    
    func light16(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultLight(16), color: color, lineSpacing: 2))
    }
    
    func light15(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultLight(15), color: color, lineSpacing: 2))
    }
    
    func light14(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultLight(14), color: color, lineSpacing: 2))
    }
    
    func light13(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultLight(13), color: color, lineSpacing: 2))
    }
    
    func light12(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultLight(12), color: color, lineSpacing: 2))
    }
    
    func light11(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultLight(11), color: color, lineSpacing: 2))
    }
    
    func light10(_ color: Color = Color.black100()) -> some View {
        modifier(FontModifier(font: Font.defaultLight(10), color: color, lineSpacing: 2))
    }
}
