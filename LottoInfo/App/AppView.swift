//
//  AppView.swift
//  uuugl
//
//  Created by 장승호 on 5/9/24.
//

import SwiftUI

struct AppView: View {
    
    @EnvironmentObject var common: CommonUse
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    @StateObject var vm = AppViewModel()
    
    //Global Toast Notification Publiser
    let toastPubliser = NotificationCenter.default.publisher(for: NSNotification.Name(Common.KEY.COMMON_MESSAGE_TOAST))
    
    var body: some View {
        BaseView {
            LottoMainView()
                .padding(.top, self.safeAreaInsets.top)
            
            ToastMsg(isShow: self.$vm.isToastShow, message: self.vm.toastMessage, position: self.vm.toastPosition)
        }
        .ignoresSafeArea(.all)
        
        //토스트 메시지 호출 리시버
        .onReceive(self.toastPubliser) { obj in
            if let obj = obj.object {
                self.showToastMessage(obj)
            }
            
        }
    }
    
    //MARK: 토스트 메시지 호출
    private func showToastMessage(_ obj: Any) {
        let data = self.getMessage(obj)
        if !self.vm.isToastShow {
            self.vm.toastMessage = data.message
            self.vm.toastPosition = data.position
            DispatchQueue.main.async {
                withAnimation(.easeInOut(duration: 0.1)) {
                    if !self.vm.isToastShow {
                        self.vm.isToastShow = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                self.vm.isToastShow = false
                            }
                        }
                    }
                }
            }
        }
    }
    
    //MARK: 공통 메시지 리턴
    private func getMessage(_ obj:Any) -> MessageData {
        return obj as! MessageData
    }
    
}

#Preview {
    AppView()
}
