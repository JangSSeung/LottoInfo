//
//  Lotto720.swift
//  uuugl
//
//  Created by 장승호 on 5/13/24.
//

import SwiftUI
import SwiftSoup

struct Lotto720: View {
    
    @StateObject var vm: Lotto720ViewModel = Lotto720ViewModel()
    
    @State var round: String = ""
    @State var date: String = ""
    @State var winPrice: String = ""
    @State var winYear: String = ""
    @State var winGroup: String = ""
    
    // string으로 할 시 배열 내에 같은 번호 있으면 id 지정 경고문구가 떠서 데이터객체로 변환
    @State var winNums: [Lotto720Data] = []
    @State var bonusNums: [Lotto720Data] = []
    
    @State var firstCount: String = ""
    @State var secondCount: String = ""
    @State var thirdCount: String = ""
    @State var fourthCount: String = ""
    @State var fifthCount: String = ""
    @State var sixthCount: String = ""
    
    @State var secondPrice: String = ""
    @State var thirdPrice: String = ""
    @State var fourthPrice: String = ""
    @State var fifthPrice: String = ""
    @State var sixthPrice: String = ""
    
    @State var secondYear: String = ""
    @State var thirdYear: String = ""
    @State var fourthYear: String = ""
    @State var fifthYear: String = ""
    @State var sixthYear: String = ""
    
    @State var text: String = ""
    @State var textNum: Int64 = 0
    @FocusState var searchFocus: Bool
    
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
                        
                        
                        
                    })
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
           
                ScrollView(.vertical, showsIndicators: false) {
                    VStack (spacing: 0) {
                        VStack (alignment: .leading, spacing: 0) {
                            HStack (spacing: 0) {
                                Text("회차 정보: ")
                                    .regular15()
                                
                                Text("\(self.round)회차")
                                    .bold15()
                                
                                Spacer()
                            }
                            .padding(.top, 30)
                            .padding(.bottom, 20)
                            
                            HStack (spacing: 0) {
                                Text("추첨 일자: ")
                                    .regular15()
                                
                                Text(self.date)
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
                            .padding(.bottom, 20)
                            
                            // 당첨 번호 공
                            self.winningNum()
                            
                        }
                        .padding(.horizontal, 20)
                        
                    }
                }
                
                
                Text(round + "회차")
                Text(date)
                
                ForEach(winNums, id:\.self) { winNum in
                    Text(winNum.number)
                }
                
                ForEach(bonusNums, id:\.self) { bonusNum in
                    Text(bonusNum.number)
                }
            } // end VStack
            
        } // end BaseView
        
        .onAppear() {
            self.sendPostRequestAndParseResponse(round: 210)
        }
        
        .onTapGesture {
//            UIApplication.shared.endEditing()
        }
        
    } // end body
    
    func winningNum() -> some View {
        VStack (spacing: 0) {
            ZStack {
                VStack (spacing: 0) {
                    Spacer()
                    
                    HStack (spacing: 0) {
                        Text("1등")
                            .extraBold12()
                            .padding(.bottom, 10)
                        
                        Spacer()
                    }
                }
                
                HStack (spacing: 10) {
                    ForEach(winNums.indices, id:\.self) { idx in
                        let winNum = winNums[idx]
                        
                        VStack (spacing: 3) {
                            Text(self.numPosition(pos: idx))
                                .regular12()
                            
                            self.lotto720BallNumber(color: self.vm.numColor(num: idx), num: idx == 0 ? self.winGroup : winNum.number)
                        }
                    }
                }
            }
            .padding(.bottom, 20)
            
            ZStack {
                VStack (spacing: 0) {
                    Spacer()
                    
                    HStack (spacing: 0) {
                        Text("2등")
                            .extraBold12()
                            .padding(.bottom, 10)
                        
                        Spacer()
                    }
                }
                
                HStack (spacing: 10) {
                    ForEach(winNums.indices, id:\.self) { idx in
                        let winNum = winNums[idx]
                        
                        VStack (spacing: 3) {
                            Text(self.numPosition(pos: idx))
                                .regular12()
                            
                            self.lotto720BallNumber(color: self.vm.numColor(num: idx), num: idx == 0 ? self.winGroup : winNum.number)
                        }
                        .opacity(idx >= 1 ? 1 : 0)
                    }
                }
            }
            .padding(.bottom, 20)
            
            ZStack {
                VStack (spacing: 0) {
                    Spacer()
                    
                    HStack (spacing: 0) {
                        Text("2등")
                            .extraBold12()
                            .padding(.bottom, 10)
                        
                        Spacer()
                    }
                }
                
                HStack (spacing: 10) {
                    ForEach(winNums.indices, id:\.self) { idx in
                        let winNum = winNums[idx]
                        
                        VStack (spacing: 3) {
                            Text(self.numPosition(pos: idx))
                                .regular12()
                            
                            self.lotto720BallNumber(color: self.vm.numColor(num: idx), num: idx == 0 ? self.winGroup : winNum.number)
                        }
                        .opacity(idx >= 1 ? 1 : 0)
                    }
                }
            }
            .padding(.bottom, 20)
            
            ZStack {
                VStack (spacing: 0) {
                    Spacer()
                    
                    HStack (spacing: 0) {
                        Text("2등")
                            .extraBold12()
                            .padding(.bottom, 10)
                        
                        Spacer()
                    }
                }
                
                HStack (spacing: 10) {
                    ForEach(winNums.indices, id:\.self) { idx in
                        let winNum = winNums[idx]
                        
                        VStack (spacing: 3) {
                            Text(self.numPosition(pos: idx))
                                .regular12()
                            
                            self.lotto720BallNumber(color: self.vm.numColor(num: idx), num: idx == 0 ? self.winGroup : winNum.number)
                        }
                        .opacity(idx >= 1 ? 1 : 0)
                    }
                }
            }
            .padding(.bottom, 20)
            
            ZStack {
                VStack (spacing: 0) {
                    Spacer()
                    
                    HStack (spacing: 0) {
                        Text("2등")
                            .extraBold12()
                            .padding(.bottom, 10)
                        
                        Spacer()
                    }
                }
                
                HStack (spacing: 10) {
                    ForEach(winNums.indices, id:\.self) { idx in
                        let winNum = winNums[idx]
                        
                        VStack (spacing: 3) {
                            Text(self.numPosition(pos: idx))
                                .regular12()
                            
                            self.lotto720BallNumber(color: self.vm.numColor(num: idx), num: idx == 0 ? self.winGroup : winNum.number)
                        }
                        .opacity(idx >= 1 ? 1 : 0)
                    }
                }
            }
            .padding(.bottom, 20)
            
            ZStack {
                VStack (spacing: 0) {
                    Spacer()
                    
                    HStack (spacing: 0) {
                        Text("2등")
                            .extraBold12()
                            .padding(.bottom, 10)
                        
                        Spacer()
                    }
                }
                
                HStack (spacing: 10) {
                    ForEach(winNums.indices, id:\.self) { idx in
                        let winNum = winNums[idx]
                        
                        VStack (spacing: 3) {
                            Text(self.numPosition(pos: idx))
                                .regular12()
                            
                            self.lotto720BallNumber(color: self.vm.numColor(num: idx), num: idx == 0 ? self.winGroup : winNum.number)
                        }
                        .opacity(idx >= 1 ? 1 : 0)
                    }
                }
            }
            .padding(.bottom, 20)
            
            ZStack {
                VStack (spacing: 0) {
                    Spacer()
                    
                    HStack (spacing: 0) {
                        Text("2등")
                            .extraBold12()
                            .padding(.bottom, 10)
                        
                        Spacer()
                    }
                }
                
                HStack (spacing: 10) {
                    ForEach(winNums.indices, id:\.self) { idx in
                        let winNum = winNums[idx]
                        
                        VStack (spacing: 3) {
                            Text(self.numPosition(pos: idx))
                                .regular12()
                            
                            self.lotto720BallNumber(color: self.vm.numColor(num: idx), num: idx == 0 ? self.winGroup : winNum.number)
                        }
                        .opacity(idx >= 1 ? 1 : 0)
                    }
                }
            }
            .padding(.bottom, 20)
        }
    }
    
    func lotto720BallNumber(color: Color, num: String) -> some View {
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
                .extraBold12(Color.black100())
        }
    }

    func numPosition(pos: Int) -> String {
        if pos == 1 {
            return "십만"
        }
        
        if pos == 2 {
            return "만"
        }
        
        if pos == 3 {
            return "천"
        }
        
        if pos == 4 {
            return "백"
        }
        
        if pos == 5 {
            return "십"
        }
        
        if pos == 6 {
            return "일"
        }
        
        return "조"
    }
    
    
    func sendPostRequestAndParseResponse(round: Int) {
        guard let url = URL(string: "https://dhlottery.co.kr/gameResult.do?method=win720") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        
        let postString = "Round=\(round)"
        request.httpBody = postString.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Error with fetching data: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(response!)")
                return
            }

            if let data = data {
                if let htmlContentWithISO = String(data: data, encoding: .isoLatin1) {
                    // 파싱 작업 시작
                    do {
                        let doc: Document = try SwiftSoup.parse(htmlContentWithISO)
                        
                        // 회차 코드
                        let roundCode = try doc.select("div.win_result h4 strong")
                        // 회차
                        let round = try roundCode.text()
                        // 회차 숫자만 추출
                        let roundNum = Common.extractNumbers(from: round)
                        self.round = roundNum
                        
                        
                        // 추첨 날짜 코드
                        let roundDate = try doc.select("div.win_result p.desc")
                        // 추첨 날짜
                        let date = try roundDate.text()
                        // 날짜 변환
                        let dateComponents = date.components(separatedBy: CharacterSet.decimalDigits.inverted).filter { !$0.isEmpty }
                        if dateComponents.count >= 3 {
                            let formattedDate = "\(dateComponents[0])년 \(dateComponents[1])월 \(dateComponents[2])일"
                            self.date = formattedDate
                        }
                        
                        
                        // 1등 상금
                        let winMoney = try doc.select("div.win_num_wrap dl.win_money span[class^=num]")
                        // map함수 이용해서 배열로 변환
                        let winMoneyMap = try winMoney.array().map { try $0.text() }
                        // 앞에 2개꺼가 1등꺼
                        if winMoneyMap.count >= 2 {
                            let winPrice = winMoneyMap[0]
                            let winYear = winMoneyMap[1]
                            
                            self.winPrice = winPrice
                            self.winYear = winYear
                        }
                        
                        
                        // 조
                        let winGroup = try doc.select("div.win_num_wrap div.win720_num div.group span.num.large span")
                        self.winGroup = try winGroup.text()
                        
                        // 1등 당첨번호
                        let winNums = try doc.select("div.win_num_wrap div.win720_num span[class*=al720_color] > span")
                        
                        var winningNumbers = [Lotto720Data]()
                        var bonusNumbers = [Lotto720Data]()

                        for i in 0..<winNums.count {
                            let winNum = winNums[i]
                            let winNumText = try winNum.text()
                            // 이 예제에서는 당첨 번호가 6개, 보너스 번호가 1개라고 가정
                            if i < 6 {  // 첫 6개는 당첨번호
                                let winNum = Lotto720Data(number: winNumText)
                                winningNumbers.append(winNum)
                            } else {  // 그 이외의 번호는 보너스 번호
                                let bonusNum = Lotto720Data(number: winNumText)
                                bonusNumbers.append(bonusNum)
                            }
                        }
                        
                        if winningNumbers.count == 6 {
                            self.winNums = winningNumbers
                        }
                        
                        if bonusNumbers.count == 6 {
                            self.bonusNums = bonusNumbers
                        }
                        
                        
                        
                        
                        
                        
                    } catch {
                        print("Error parsing HTML: \(error)")
                    }
                } else {
                    print("Failed to decode data with ISO-8859-1 encoding.")
                }
            }
            
            
        }
        
        task.resume()
    }
    
}

#Preview {
    Lotto720()
}
