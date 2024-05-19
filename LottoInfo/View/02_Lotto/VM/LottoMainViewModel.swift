//
//  LottoMainViewModel.swift
//  uuugl
//
//  Created by 장승호 on 5/9/24.
//

import Foundation
import Combine
import Alamofire
import SwiftUI

class LottoMainViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    @Published var noData: Bool = false
}
