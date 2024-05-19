//
//  LottoInfoApp.swift
//  LottoInfo
//
//  Created by 승호 on 2024/05/19.
//

import SwiftUI

@main
struct LottoInfoApp: App {
    
    let common = CommonUse()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                AppView()
                    .environmentObject(common)
                    .preferredColorScheme(.light)
                    .environment(\.colorScheme, .light)
            }
        }
    }
}
