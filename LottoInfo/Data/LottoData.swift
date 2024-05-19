//
//  LottoData.swift
//  uuugl
//
//  Created by 장승호 on 5/8/24.
//

import Foundation

struct LottoData: Codable, Hashable {
    // 수신 결과
    var returnValue: String
    // 날짜
    var drwNoDate: String
    // 누적 당첨금
    var totSellamnt: Int64
    // 1등 당첨금
    var firstWinamnt: Int64
    // 1등 당첨 인원
    var firstPrzwnerCo: Int64
    // 1등 당첨금 총액
    var firstAccumamnt: Int64
    // 로또번호 1
    var drwtNo1: Int64
    // 로또번호 2
    var drwtNo2: Int64
    // 로또번호 3
    var drwtNo3: Int64
    // 로또번호 4
    var drwtNo4: Int64
    // 로또번호 5
    var drwtNo5: Int64
    // 로또번호 6
    var drwtNo6: Int64
    // 로또 보너스 번호
    var bnusNo: Int64
    // 로또 회차
    var drwNo: Int64
}

struct LottoData2: Codable, Hashable {
    // 수신 결과
    var returnValue: String?
    // 날짜
    var drwNoDate: String?
    // 누적 당첨금
    var totSellamnt: Int64?
    // 1등 당첨금
    var firstWinamnt: Int64?
    // 1등 당첨 인원
    var firstPrzwnerCo: Int64?
    // 1등 당첨금 총액
    var firstAccumamnt: Int64?
    // 로또번호 1
    var drwtNo1: Int64?
    // 로또번호 2
    var drwtNo2: Int64?
    // 로또번호 3
    var drwtNo3: Int64?
    // 로또번호 4
    var drwtNo4: Int64?
    // 로또번호 5
    var drwtNo5: Int64?
    // 로또번호 6
    var drwtNo6: Int64?
    // 로또 보너스 번호
    var bnusNo: Int64?
    // 로또 회차
    var drwNo: Int64?
}
