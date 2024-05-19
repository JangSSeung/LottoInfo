//
//  Lotto645ViewModel.swift
//  uuugl
//
//  Created by 장승호 on 5/8/24.
//

import Foundation
import Combine
import Alamofire
import SwiftUI

class Lotto645ViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    @Published var data: LottoData? = nil
    @Published var noData: Bool = false
    
    
    
    func getLotto645(round: Int64) {
        ApiService.getLotto645(getLottoNumber: "getLottoNumber", round: round)
            .sink(receiveCompletion: { (completion: Subscribers.Completion<AFError>) in
                if case let .failure(error) = completion {
                    print("Error: \(error.localizedDescription)")
                    self.noData = true
                }
            }, receiveValue: { (result: LottoData) in
                self.data = result
                print(result)
            })
            .store(in: &subscription)
    }
    
    // 당첨 숫자에 따른 공 색깔
    func numColor(num: Int64) -> Color {
        switch num {
        case 1...10:
            return Color.lotto645Yellow()
        case 11...20:
            return Color.lotto645Blue()
        case 21...30:
            return Color.lotto645Red()
        case 31...40:
            return Color.lotto645Gray()
        case 41...45:
            return Color.lotto645Green()
        default:
            return Color.white100()
        }
    }
    
    
}
