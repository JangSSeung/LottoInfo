//
//  FontExtension.swift
//  uuugl
//
//  Created by 장승호 on 4/30/24.
//

import Foundation
import UIKit
import SwiftUI

//MARK: - Font Extension
extension Font {
    
    // 300
    static let DEFAULT_LIGHT_FONT = "NanumSquareOTF_acL"
    // 400
    static let DEFAULT_REGULAR_FONT = "NanumSquareOTF_acR"
    // 700
    static let DEFAULT_BOLD_FONT = "NanumSquareOTF_acB"
    // 800
    static let DEFAULT_EXTRA_BOLD_FONT = "NanumSquareOTF_acEB"
    
        
    static func defaultLight(_ size:CGFloat = 14) -> Font {
        return Font.custom(DEFAULT_LIGHT_FONT, size: size)
    }

    static func defaultRegular(_ size:CGFloat = 14) -> Font {
        return Font.custom(DEFAULT_REGULAR_FONT, size: size)
    }
    
    static func defaultBold(_ size:CGFloat = 14) -> Font {
        return Font.custom(DEFAULT_BOLD_FONT, size: size)
    }

    static func defaultExtraBold(_ size:CGFloat = 14) -> Font {
        return Font.custom(DEFAULT_EXTRA_BOLD_FONT, size: size)
    }
    
}
