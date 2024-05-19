//
//  CommonUse.swift
//  uuugl
//
//  Created by 장승호 on 5/9/24.
//

import Foundation
import Combine
import Alamofire
import SwiftUI

class CommonUse: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
 
    // lotto645 검색 error
    @Published var noData: Bool = false
    
}
