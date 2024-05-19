//
//  UIApplicationExtension.swift
//  uuugl
//
//  Created by 장승호 on 4/30/24.
//

import Foundation
import UIKit
import SwiftUI
//MARK: - UIApplication Extension
extension UIApplication {
    //MARK: safe영역
    var keyWindow: UIWindow? {
        connectedScenes
            .compactMap {
                $0 as? UIWindowScene
            }
            .flatMap {
                $0.windows
            }
            .first {
                $0.isKeyWindow
            }
    }
    
    //MARK: View 클릭시 키보드 내림
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

