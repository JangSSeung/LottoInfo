//
//  ApiResponse.swift
//  uuugl
//
//  Created by 장승호 on 4/30/24.
//

import Foundation

struct ApiResponse<T: Codable>: Codable {
    var data: T?
    var status: String
    var errorMessage: String?
}
