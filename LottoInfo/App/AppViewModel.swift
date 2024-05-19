//
//  AppViewModel.swift
//  uuugl
//
//  Created by 장승호 on 5/9/24.
//

import Foundation
import Combine
import Alamofire

class AppViewModel: ObservableObject {
    var subscription = Set<AnyCancellable>()
    
    //MARK: Global Toast
    @Published var isToastShow: Bool = false
    @Published var toastMessage: String = ""
    @Published var toastPosition: ToastPosition = .bottom
    
}
