//
//  KeyboardManage.swift
//  uuugl
//
//  Created by 장승호 on 4/30/24.
//

import Foundation
import UIKit

final class KeyboardManage: ObservableObject {
    
    @Published var keyboardHeight: CGFloat = 0
    
    @Published var status: KeyboardStatus = .hide
    
    enum KeyboardStatus {
        case show, hide
        var description : String {
            switch self {
            case .show: return "보임"
            case .hide: return "안보임"
            }
        }
    }

    private func listenForKeyboardNotifications() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification,
                                               object: nil,
                                               queue: .main) { (notification) in
            guard let userInfo = notification.userInfo,
                  let keyboardRect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
            
            self.keyboardHeight = keyboardRect.height
            self.status = .show
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification,
                                               object: nil,
                                               queue: .main) { (notification) in
            self.keyboardHeight = 0
            self.status = .hide
        }
    }

    init() {
        self.listenForKeyboardNotifications()
    }
    
}
