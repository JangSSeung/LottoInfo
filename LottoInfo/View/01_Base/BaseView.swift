//
//  BaseView.swift
//  uuugl
//
//  Created by 장승호 on 4/30/24.
//

import SwiftUI

struct BaseView<Content>: View where Content: View {
    private let content: Content
    // 페이지 정보 받아서-> 스,토어정보에 현재 정보 넣기 null 이면 기존 방식 , 아니면 바로띄워주기
    //private let currPage: String?
    
    public init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
        //self.currPage = currPage
        
    }
    
    
    var body: some View {
        ZStack {
            self.content
                .navigationBarBackButtonHidden(true)
                .navigationTitle("")
                .toolbar(.hidden, for: .navigationBar)
        }
        
        //키보드 사용하는 곳에서만 사용하는걸로 변경
//        .onTapGesture {
//            //키보드 내리는 이벤트
//            UIApplication.shared.endEditing()
//        }
    }
    
}
