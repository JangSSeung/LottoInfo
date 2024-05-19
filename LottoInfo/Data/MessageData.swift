//
//  MessageData.swift
//  uuugl
//
//  Created by 장승호 on 5/9/24.
//

import Foundation

struct MessageData {
    var title: String? = nil
    var message: String = ""
    var type: PopupType = .ALERT
    var position: ToastPosition = .bottom
}

enum ToastPosition {
    case center, bottom
}

enum PopupType: String, Codable, CaseIterable {
    case ALERT, CONFIRM, CONFIRM_DELETE, ERROR, CONFIRM_WARN
    func getLabel() -> String {
        switch self {
        case .ALERT:            return "확인"
        case .CONFIRM:          return "확인"
        case .CONFIRM_DELETE:   return "삭제"
        case .ERROR:            return "에러"
        case .CONFIRM_WARN:            return "확인"
        }
    }
    
    
    func getButtonLabel() -> String {
        switch self {
        case .ALERT:            return "확인"
        case .CONFIRM:          return "확인"
        case .CONFIRM_DELETE:   return "삭제"
        case .ERROR:            return "확인"
        case .CONFIRM_WARN:            return "확인"
        }
    }
}
