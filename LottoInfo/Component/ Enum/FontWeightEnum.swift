//
//  FontWeightEnum.swift
//  uuugl
//
//  Created by 장승호 on 4/30/24.
//

import Foundation
import SwiftUI

public enum FontWeightEnum {
    case extraBold, bold, regular, light
    
    func getFontType() -> String {
        switch self {
        case .extraBold:
            return Font.DEFAULT_EXTRA_BOLD_FONT
            
        case .bold:
            return Font.DEFAULT_BOLD_FONT
            
        case .regular:
            return Font.DEFAULT_REGULAR_FONT
            
        case .light:
            return Font.DEFAULT_LIGHT_FONT
        }
    }
        
}
