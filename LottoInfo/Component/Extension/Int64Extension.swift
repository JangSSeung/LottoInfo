//
//  Int64Extension.swift
//  uuugl
//
//  Created by 장승호 on 5/9/24.
//

import Foundation
import SwiftUI

extension Int64 {
    //MARK: 콤마 처리
    func comma() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(for: self) ?? ""
    }
    
    //MARK: 콤마 처리 + 원 처리
    func commaUnit() -> String {
        let val = self.comma()
        return val.isEmpty ? "" : "\(val)원"
    }
}
