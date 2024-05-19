//
//  Common.swift
//  uuugl
//
//  Created by 장승호 on 4/30/24.
//

import Foundation
import SwiftUI

struct Common {
    
    //MARK: Device Width 리턴
    static func getDeviceWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    //MARK: Device Height 리턴
    static func getDeviceHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    static func browser(_ url:String) {
        if let url = URL(string: url), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    static func convertToKoreanNumber(_ number: Int64) -> String {
        let units = ["", "만 ", "억 ", "조 ", "경 "]
            var result = ""
            var num = number
            var unitIndex = 0

            while num > 0 {
                let remainder = num % 10000
                if remainder > 0 {
                    result = "\(remainder)\(units[unitIndex])" + result
                }
                num /= 10000
                unitIndex += 1
            }

            return result.isEmpty ? "영" : result
    }
    
    
    //MARK: 공통 토스트 메시지 호출
    static func toast(_ message: String, _ position: ToastPosition = .bottom) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: NSNotification.Name(Common.KEY.COMMON_MESSAGE_TOAST), object: MessageData(message: message, position: position))
        }
    }
    
    //MARK: 숫자+문자 있을때 숫자만 추출
    static func extractNumbers(from text: String) -> String {
        let pattern = "[0-9]+" // 숫자만 매칭
        if let regex = try? NSRegularExpression(pattern: pattern, options: []) {
            let results = regex.matches(in: text, options: [], range: NSRange(text.startIndex..., in: text))
            let numbers = results.map { String(text[Range($0.range, in: text)!]) }
            return numbers.joined()
        }
        return ""
    }
    
    struct KEY {
        static let COMMON_MESSAGE_TOAST = "CommonMessageToast"
    }
    
    //path 관련
    static func getSaveAddress() -> String {
        return UserDefaults.standard.string(forKey: "SaveAddress") ?? ""
    }
    
    static func removeSaveAddress() {
        UserDefaults.standard.removeObject(forKey: "SaveAddress")
    }
    
    static func setSaveAddress(_ token: String) {
        UserDefaults.standard.set(token, forKey: "SaveAddress")
    }

}
