//
//  Lotto720ViewModel.swift
//  uuugl
//
//  Created by 장승호 on 5/13/24.
//

import Foundation
import Combine
import Alamofire
import SwiftUI

class Lotto720ViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    
    func postLotto720(round: Int) {
        ApiService.postLotto720(round: round)
            .sink(receiveCompletion: { (completion: Subscribers.Completion<AFError>) in
                if case let .failure(error) = completion {
                    print("Error: \(error.localizedDescription)")
                    
                }
            }, receiveValue: { (result: LottoData2) in
                
            })
            .store(in: &subscription)
    }
    
    
    // 당첨 숫자에 따른 공 색깔
    func numColor(num: Int) -> Color {
        switch num {
        case 1:
            return Color.lotto720Red()
        case 2:
            return Color.lotto720Orange()
        case 3:
            return Color.lotto720Yellow()
        case 4:
            return Color.lotto720Blue()
        case 5:
            return Color.lotto720Purple()
        case 6:
            return Color.lotto720Gray()
        default:
            return Color.lotto720Group()
        }
    }
    
    
}
