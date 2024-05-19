//
//  ColorExtension.swift
//  uuugl
//
//  Created by 장승호 on 4/30/24.
//

import Foundation
import UIKit
import SwiftUI

extension Color {
    init(_ hex: String, _ opacity: Double = 1) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b, opacity: opacity)
    }
    
    static func black100(_ opacity: Double=1) -> Color {
        return Color("#1B1C1F", opacity)
    }
    
    static func placeholderGray(_ opacity: Double = 1) -> Color {
        return Color("#A3A5A8", opacity)
    }
    
    static func inputGray(_ opacity: Double = 1) -> Color {
        return Color("#A4A4A4", opacity)
    }
    
    static func red100(_ opacity: Double = 1) -> Color {
        return Color("#FF1C1C", opacity)
    }
    
    static func blue100(_ opacity: Double = 1) -> Color {
        return Color("#387DFF", opacity)
    }
    
    static func white100(_ opacity: Double = 1) -> Color {
        return Color("#FFFFFF", opacity)
    }
    
    static func borderGray(_ opacity: Double=1) -> Color {
        return Color("#E2E2E2", opacity)
    }
    
    static func lotto645Yellow(_ opacity: Double=1) -> Color {
        return Color("#FBC400", opacity)
    }
    
    static func lotto645Blue(_ opacity: Double=1) -> Color {
        return Color("#69C8F2", opacity)
    }
    
    static func lotto645Red(_ opacity: Double=1) -> Color {
        return Color("#FF7272", opacity)
    }
    
    static func lotto645Gray(_ opacity: Double=1) -> Color {
        return Color("#AAA", opacity)
    }
    
    static func lotto645Green(_ opacity: Double=1) -> Color {
        return Color("#B0D840", opacity)
    }
    
    
    static func lotto720Group(_ opacity: Double=1) -> Color {
        return Color("#C7C7C7", opacity)
    }
    static func lotto720Red(_ opacity: Double=1) -> Color {
        return Color("#FF4C4D", opacity)
    }
    static func lotto720Orange(_ opacity: Double=1) -> Color {
        return Color("#FF8e50", opacity)
    }
    static func lotto720Yellow(_ opacity: Double=1) -> Color {
        return Color("#FCD154", opacity)
    }
    static func lotto720Blue(_ opacity: Double=1) -> Color {
        return Color("#3BBDFF", opacity)
    }
    static func lotto720Purple(_ opacity: Double=1) -> Color {
        return Color("#8D71DB", opacity)
    }
    static func lotto720Gray(_ opacity: Double=1) -> Color {
        return Color("#777777", opacity)
    }
    
    
    
    
}
