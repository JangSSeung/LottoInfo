//
//  Lotto645.swift
//  uuugl
//
//  Created by 장승호 on 5/8/24.
//

import SwiftUI
import SwiftSoup

struct Lotto645: View {
    
    @EnvironmentObject var common: CommonUse
    
    @StateObject var vm: Lotto645ViewModel = Lotto645ViewModel()
    @ObservedObject var mainVm: LottoMainViewModel
    
    @FocusState var searchFocus: Bool
    @State var text: String = ""
    @State var textNum: Int64 = 0
    
    @State var showAccumWinNum: Bool = false
    
    @State var test: String = "test"
    
    @State var extractedNums: [String] = []
    @State var crollBonus: String = ""
    @State var numberFrequency: [String: Int] = [:]
    
    @State var sellButtonAngle = 0.0
    
    let columns = [
        GridItem(.flexible(), spacing: 100, alignment: .center),
        GridItem(.flexible(), spacing: 100, alignment: .center),
    ]
    
    var body: some View {
        BaseView {
            
            VStack (spacing: 0) {
                HStack {
                    Text("회차 검색")
                        .bold15()
                    
                    Spacer()
                }
                .padding(.bottom, 10)
                .padding(.horizontal, 20)
                
                HStack (spacing: 10) {
                    TextField("",
                              text: $text,
                              prompt: Text("검색할 회차를 적어주세요")
                        .font(Font.defaultBold(12)))
                    .focused($searchFocus)
                    .keyboardType(.numberPad)
                    .bold12()
                    .multilineTextAlignment(.center)
                    .padding(15)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .overlay(RoundedRectangle(cornerRadius: 5).strokeBorder(Color.inputGray(), lineWidth: 1))
                    .onSubmit {
                        self.searchFocus = false
                        UIApplication.shared.endEditing()
                    }
                    
                    ButtonCustom(text: "검색", width: 70, doAction: {
                        if searchFocus {
                            self.searchFocus = false
                            UIApplication.shared.endEditing()
                        }
                        
                        if !text.isEmpty {
                            self.textNum = Int64(text) ?? 0
                            if self.textNum != 0 {
                                self.vm.getLotto645(round: textNum)
                                
                            } else {
                                Common.toast("0 이상의 숫자를 적어주세요")
                            }
                        }
                        
                        if self.showAccumWinNum {
                            self.showAccumWinNum = false
                        }
                        
                    })
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
           
                ScrollView(.vertical, showsIndicators: false) {
                    VStack (spacing: 0) {
                        if let data = self.vm.data {
                            VStack (alignment: .leading, spacing: 0) {
                                HStack (spacing: 0) {
                                    Text("회차 정보: ")
                                        .regular15()
                                    
                                    Text("\(data.drwNo)회차")
                                        .bold15()
                                    
                                    Spacer()
                                }
                                .padding(.top, 30)
                                .padding(.bottom, 20)
                                
                                HStack (spacing: 0) {
                                    Text("추첨 일자: ")
                                        .regular15()
                                    
                                    Text(data.drwNoDate)
                                        .bold15()
                                    
                                    Spacer()
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 40)
                            
                            VStack (spacing: 0) {
                                HStack {
                                    Text("당첨 번호")
                                        .bold15()
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 20)
                                .padding(.bottom, 20)
                                
                                // 당첨 번호 공
                                HStack (spacing: 10) {
                                    VStack (spacing: 3) {
                                        Text("1번")
                                            .regular12()
                                        
                                        self.ballNumber(color: self.vm.numColor(num: data.drwtNo1), num: data.drwtNo1)
                                    }
                                    
                                    
                                    VStack (spacing: 3) {
                                        Text("2번")
                                            .regular12()
                                        
                                        self.ballNumber(color: self.vm.numColor(num: data.drwtNo2), num: data.drwtNo2)
                                    }
                                    
                                    
                                    VStack (spacing: 3) {
                                        Text("3번")
                                            .regular12()
                                        
                                        self.ballNumber(color: self.vm.numColor(num: data.drwtNo3), num: data.drwtNo3)
                                    }
                                    
                                    
                                    VStack (spacing: 3) {
                                        Text("4번")
                                            .regular12()
                                        
                                        self.ballNumber(color: self.vm.numColor(num: data.drwtNo4), num: data.drwtNo4)
                                    }
                                    
                                    
                                    VStack (spacing: 3) {
                                        Text("5번")
                                            .regular12()
                                        
                                        self.ballNumber(color: self.vm.numColor(num: data.drwtNo5), num: data.drwtNo5)
                                    }
                                    
                                    
                                    VStack (spacing: 3) {
                                        Text("6번")
                                            .regular12()
                                        
                                        self.ballNumber(color: self.vm.numColor(num: data.drwtNo6), num: data.drwtNo6)
                                    }
                                    
                                    VStack (spacing: 3) {
                                        Text("plus")
                                            .regular12()
                                            .opacity(0)
                                        
                                        Image(systemName: "plus")
                                    }
                                    
                                    VStack (spacing: 3) {
                                        Text("Bonus")
                                            .regular12()
                                        
                                        self.ballNumber(color: self.vm.numColor(num: data.bnusNo), num: data.bnusNo)
                                    }
                                    
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.bottom, 30)
                                
                                
                                VStack (spacing: 10) {
                                    HStack (alignment: .top, spacing: 0) {
                                        HStack (spacing: 0) {
                                            Text("누적 상금액 : ")
                                                .regular15()
                                            
                                            Spacer()
                                        }
                                        .frame(width: 150)
                                        
                                        if data.totSellamnt > 0 {
                                            VStack (alignment: .leading, spacing: 5) {
                                                Text(data.totSellamnt.commaUnit())
                                                    .bold15()
                                                Text("(\(Common.convertToKoreanNumber(data.totSellamnt))원)")
                                                    .bold13()
                                            }
                                            
                                        } else {
                                            Text("데이터 없음")
                                                .bold15()
                                        }
                                        
                                        Spacer()
                                    }
                                    
                                    BaseDivider()
                                        .padding(.vertical, 5)
                                    
                                    HStack (alignment: .top, spacing: 0) {
                                        HStack (spacing: 0) {
                                            Text("1등 당첨금 총액 : ")
                                                .regular15()
                                            
                                            Spacer()
                                        }
                                        .frame(width: 150)
                                        
                                        if data.firstAccumamnt > 0 {
                                            VStack (alignment: .leading, spacing: 5) {
                                                Text(data.firstAccumamnt.commaUnit())
                                                    .bold15()
                                                
                                                Text("(\(Common.convertToKoreanNumber(data.firstAccumamnt))원)")
                                                    .bold13()
                                            }
                                            
                                        } else {
                                            VStack (alignment: .leading, spacing: 5) {
                                                Text((data.firstWinamnt * data.firstPrzwnerCo).commaUnit())
                                                    .bold15()
                                                
                                                Text("(\(Common.convertToKoreanNumber((data.firstWinamnt * data.firstPrzwnerCo)))원)")
                                                    .bold13()
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    
                                    BaseDivider()
                                        .padding(.vertical, 5)
                                    
                                    HStack (alignment: .top, spacing: 0) {
                                        HStack (spacing: 0) {
                                            Text("1등 상금액(당첨 인원) : ")
                                                .regular15()
                                            Spacer()
                                        }
                                        .frame(width: 150)
                                        
                                        if data.firstWinamnt > 0 {
                                            VStack (alignment: .leading, spacing: 5) {
                                                Text("\(data.firstWinamnt.commaUnit()) (\(data.firstPrzwnerCo)명)")
                                                    .bold15()
                                                Text("(\(Common.convertToKoreanNumber(data.firstWinamnt))원)")
                                                    .bold13()
                                            }
                                            
                                        } else {
                                            Text("데이터 없음")
                                                .bold15()
                                        }
                                        
                                        Spacer()
                                    }
                                }
                                .padding(.horizontal, 20)
                            }
                            .padding(.bottom, 40)

                            VStack (alignment: .leading, spacing: 0) {
                                HStack {
                                    Text("누적 당첨 번호 보기")
                                        .bold15()
                                    
                                    Button(action: {
                                        self.showAccumWinNum.toggle()
                                        
                                        if self.showAccumWinNum {
                                            if !self.vm.noData {
                                                self.numberFrequency.removeAll()
                                                
                                                if self.numberFrequency.isEmpty {
                                                    loadAllDrawsData(maxDraw: Int(data.drwNo))
                                                }
                                            }
                                        }
                                        
                                        withAnimation {
                                            self.sellButtonAngle = self.sellButtonAngle == 0 ? 90 : 0
                                        }
                                        
                                    }) {
                                        Image("ic_arrow_right_18")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                            .foregroundColor(Color.black100())
                                            .rotationEffect(.degrees(self.sellButtonAngle)).animation(.linear(duration: 0.15))
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 20)
                                .padding(.bottom, 20)
                                
                                if self.showAccumWinNum {
                                    LazyVGrid(columns: columns, spacing: 15) {
                                        self.accumNum01()
                                        
                                        self.accumNum02()
                                    }
                                    .padding(.horizontal, 40)
                                }
                            }
                            
                            
                        } // end data
                        
                    } // end VStack
                    
                    
                } // end ScrollView
                
            } // end VStack
            
            
        } // end BaseView
        .onAppear() {
            self.vm.getLotto645(round: 1118)
        }
        
        .onChange(of: self.vm.noData) { _ in
            if self.vm.noData {
                Common.toast("없는 회차입니다. 다시 한번 검색해 주세요")
                self.vm.noData = false
                self.text = ""
            }
        }
        
        .onTapGesture {
            if self.searchFocus {
                self.searchFocus = false
                UIApplication.shared.endEditing()
            }
        }
    } // end body
    
    
    func loadWebData() {
        guard let url = URL(string: "https://dhlottery.co.kr/gameResult.do?method=byWin") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                do {
                    let html = String(decoding: data, as: UTF8.self)
                    let doc: Document = try SwiftSoup.parse(html)
                    
                    let nums = try doc.select("div.num.win p span[class^=ball_645]")
                    let bonus = try doc.select("div.num.bonus p span[class^=ball_645]")
                    
//                    for num in nums {
//                        print(try num.text()) // 각 공의 번호 출력
//                    }

                    let extractedNums = try nums.text()
                    let extractedBonus = try bonus.text()
                    
                } catch {
                    print("Error parsing HTML: \(error)")
                }
            } else {
                print("Network request failed: \(error?.localizedDescription ?? "unknown error")")
            }
        }
        
        task.resume()
    }
    
    
    
    
    func loadAllDrawsData(maxDraw: Int) {

        for draw in 1...maxDraw {
                        
            let urlString = "https://dhlottery.co.kr/gameResult.do?method=byWin&drwNo=\(draw)"
            
            guard let url = URL(string: urlString) else {
                print("Invalid URL for draw number \(draw)")
                continue
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                guard let data = data, error == nil else {
                    print("Network request failed for draw number \(draw): \(error?.localizedDescription ?? "unknown error")")
                    return
                }
                
                do {
                    let html = String(decoding: data, as: UTF8.self)
                    let doc: Document = try SwiftSoup.parse(html)
                    let nums = try doc.select("div.num.win p span[class^=ball_645]")
                    let bonus = try doc.select("div.num.bonus p span[class^=ball_645]")
                    
                    let allNumbers = nums.array() + bonus.array()
                    
                    for num in allNumbers {
                        let numberText = try num.text()
                        DispatchQueue.main.async {
                            numberFrequency[numberText, default: 0] += 1
                        }
                    }

                    
                } catch {
                    print("Error parsing HTML for draw number \(draw): \(error)")
                }
            }
            
            task.resume()
        }
        
    }
    
    func ballNumber(color: Color, num: Int64) -> some View {
        ZStack {
            Circle()
                .fill(
                    RadialGradient(
                        gradient: Gradient(colors: [Color.white100(0.3), color]),
                        center: .center,
                        startRadius: 5,
                        endRadius: 20
                    )
                )
                .frame(width: 35, height: 35)
                .shadow(color: Color.gray.opacity(0.6), radius: 8, x: 5, y: 5)
                .overlay(
                    Circle()
                        .stroke(Color.white100(0.5), lineWidth: 3)
                        .blur(radius: 3)
                        .offset(x: -5, y: -5)
                )
                .overlay(
                    Circle()
                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                        .blur(radius: 2)
                        .offset(x: 1, y: 3)
                )
                .overlay(
                    Circle()
                        .fill(Color.white.opacity(0.1))
                        .frame(width: 35, height: 35)
                        .blur(radius: 10)
                )
            
            Text("\(num)")
                .bold12(Color.black100())
        }
    }
    
    func accumNum01() -> some View {
        VStack (alignment: .leading, spacing: 15) {
            ForEach(1..<11, id:\.self) { i in
                LazyVStack (alignment: .leading, spacing: 15) {
                    HStack (spacing: 10) {
                        ZStack {
                            Circle()
                                .fill(
                                    RadialGradient(
                                        gradient: Gradient(colors: [Color.white100(0.3), Color.lotto645Yellow()]),
                                        center: .center,
                                        startRadius: 5,
                                        endRadius: 20
                                    )
                                )
                                .frame(width: 35, height: 35)
                                .shadow(color: Color.gray.opacity(0.6), radius: 8, x: 5, y: 5)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white100(0.5), lineWidth: 3)
                                        .blur(radius: 3)
                                        .offset(x: -5, y: -5)
                                )
                                .overlay(
                                    Circle()
                                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                                        .blur(radius: 2)
                                        .offset(x: 1, y: 3)
                                )
                                .overlay(
                                    Circle()
                                        .fill(Color.white.opacity(0.1))
                                        .frame(width: 35, height: 35)
                                        .blur(radius: 10)
                                )
                            
                            Text("\(i)")
                                .bold12(Color.black100())
                        }
                        
                        Text("\(numberFrequency[String(i), default: 0]) 회")
                            .bold12(Color.black100())
                        
                        Spacer()
                    }
                    .frame(minWidth: 120)
                }
            }
            
            ForEach(11..<21, id:\.self) { i in
                LazyVStack (alignment: .leading, spacing: 15) {
                    HStack (spacing: 10) {
                        ZStack {
                            Circle()
                                .fill(
                                    RadialGradient(
                                        gradient: Gradient(colors: [Color.white100(0.3), Color.lotto645Blue()]),
                                        center: .center,
                                        startRadius: 5,
                                        endRadius: 20
                                    )
                                )
                                .frame(width: 35, height: 35)
                                .shadow(color: Color.gray.opacity(0.6), radius: 8, x: 5, y: 5)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white100(0.5), lineWidth: 3)
                                        .blur(radius: 3)
                                        .offset(x: -5, y: -5)
                                )
                                .overlay(
                                    Circle()
                                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                                        .blur(radius: 2)
                                        .offset(x: 1, y: 3)
                                )
                                .overlay(
                                    Circle()
                                        .fill(Color.white.opacity(0.1))
                                        .frame(width: 35, height: 35)
                                        .blur(radius: 10)
                                )
                            
                            Text("\(i)")
                                .bold12(Color.black100())
                        }
                        
                        Text("\(numberFrequency[String(i), default: 0]) 회")
                            .bold12(Color.black100())
                        
                        Spacer()
                    }
                    .frame(minWidth: 120)
                }
            }
            
            ForEach(21..<31, id:\.self) { i in
                LazyVStack (alignment: .leading, spacing: 15) {
                    HStack (spacing: 10) {
                        ZStack {
                            Circle()
                                .fill(
                                    RadialGradient(
                                        gradient: Gradient(colors: [Color.white100(0.3), Color.lotto645Red()]),
                                        center: .center,
                                        startRadius: 5,
                                        endRadius: 20
                                    )
                                )
                                .frame(width: 35, height: 35)
                                .shadow(color: Color.gray.opacity(0.6), radius: 8, x: 5, y: 5)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white100(0.5), lineWidth: 3)
                                        .blur(radius: 3)
                                        .offset(x: -5, y: -5)
                                )
                                .overlay(
                                    Circle()
                                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                                        .blur(radius: 2)
                                        .offset(x: 1, y: 3)
                                )
                                .overlay(
                                    Circle()
                                        .fill(Color.white.opacity(0.1))
                                        .frame(width: 35, height: 35)
                                        .blur(radius: 10)
                                )
                            
                            Text("\(i)")
                                .bold12(Color.black100())
                        }
                        
                        Text("\(numberFrequency[String(i), default: 0]) 회")
                            .bold12(Color.black100())
                        
                        Spacer()
                    }
                    .frame(minWidth: 120)
                }
            }
            
            Spacer()
            
        }
    }
    
    func accumNum02() -> some View {
        VStack (alignment: .trailing, spacing: 15) {
            ForEach(31..<41, id:\.self) { i in
                LazyVStack (alignment: .trailing, spacing: 15) {
                    HStack (spacing: 10) {
                        ZStack {
                            Circle()
                                .fill(
                                    RadialGradient(
                                        gradient: Gradient(colors: [Color.white100(0.3), Color.lotto645Gray()]),
                                        center: .center,
                                        startRadius: 5,
                                        endRadius: 20
                                    )
                                )
                                .frame(width: 35, height: 35)
                                .shadow(color: Color.gray.opacity(0.6), radius: 8, x: 5, y: 5)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white100(0.5), lineWidth: 3)
                                        .blur(radius: 3)
                                        .offset(x: -5, y: -5)
                                )
                                .overlay(
                                    Circle()
                                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                                        .blur(radius: 2)
                                        .offset(x: 1, y: 3)
                                )
                                .overlay(
                                    Circle()
                                        .fill(Color.white.opacity(0.1))
                                        .frame(width: 35, height: 35)
                                        .blur(radius: 10)
                                )
                            
                            Text("\(i)")
                                .bold12(Color.black100())
                        }
                        
                        Text("\(numberFrequency[String(i), default: 0]) 회")
                            .bold12(Color.black100())
                        
                        Spacer()
                    }
                    .frame(minWidth: 120)
                }
            }
            
            ForEach(41..<46, id:\.self) { i in
                LazyVStack (alignment: .trailing, spacing: 15) {
                    HStack (spacing: 10) {
                        ZStack {
                            Circle()
                                .fill(
                                    RadialGradient(
                                        gradient: Gradient(colors: [Color.white100(0.3), Color.lotto645Green()]),
                                        center: .center,
                                        startRadius: 5,
                                        endRadius: 20
                                    )
                                )
                                .frame(width: 35, height: 35)
                                .shadow(color: Color.gray.opacity(0.6), radius: 8, x: 5, y: 5)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white100(0.5), lineWidth: 3)
                                        .blur(radius: 3)
                                        .offset(x: -5, y: -5)
                                )
                                .overlay(
                                    Circle()
                                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                                        .blur(radius: 2)
                                        .offset(x: 1, y: 3)
                                )
                                .overlay(
                                    Circle()
                                        .fill(Color.white.opacity(0.1))
                                        .frame(width: 35, height: 35)
                                        .blur(radius: 10)
                                )
                            
                            Text("\(i)")
                                .bold12(Color.black100())
                        }
                        
                        Text("\(numberFrequency[String(i), default: 0]) 회")
                            .bold12(Color.black100())
                        
                        Spacer()
                    }
                    .frame(minWidth: 120)
                }
            }
            
            Spacer()
            
        }
    }
}

#Preview {
    Lotto645(mainVm: LottoMainViewModel())
}
