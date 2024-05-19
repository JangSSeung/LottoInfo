//
//  LottoMainView.swift
//  uuugl
//
//  Created by 장승호 on 5/8/24.
//

import SwiftUI

struct LottoMainView: View {
    
    @EnvironmentObject var common: CommonUse
    
    @StateObject var vm: LottoMainViewModel = LottoMainViewModel()
    
    @State var index: Int = 0
    @State var labels: [String] = ["lotto", "year", "spito1000", "spito2000"]
    
    var body: some View {
        BaseView {

            // header start
            VStack (spacing: 0) {
                HStack (spacing: 0) {
                    ForEach(labels.indices, id:\.self) { idx in
                        let label = labels[idx]
                        
                        Button(action: {
                            self.index = idx
                            UIApplication.shared.endEditing()
                        }) {
                            Text(label)
                                .frame(width: (Common.getDeviceWidth()) / 4, height: 50)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                }
                .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                
                BaseDivider()
                
                Spacer()
            }
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            // header end
            
            TabView(selection: self.$index) {
                Lotto645(mainVm: vm)
                    .tag(0)
                    .zIndex(2)
                
                Lotto720()
                    .tag(1)
                
                LottoSpito1000()
                    .tag(2)
                
                LottoSpito2000()
                    .tag(3)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
            .padding(.top, 50 + 30) // tabview header 높이 + a

            
        } // end BaseView
        
    } // end body
    
}

#Preview {
    LottoMainView()
}
