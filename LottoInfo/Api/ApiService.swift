//
//  ApiService.swift
//  uuugl
//
//  Created by 장승호 on 4/30/24.
//

import Foundation
import Alamofire
import Combine

struct ApiService {
    
    
    static var baseURL: URL {
        return URL(string: "https://uuu.gl")!
    }
    
    static func getUrl(_ endPoint: String) -> String {
        return "\(baseURL)\(endPoint)"
    }
    
    
    
    
    // 로또 test
    static var lottoBaseURL: URL {
        return URL(string: "https://www.dhlottery.co.kr")!
    }
    
    static func getLottoUrl(_ endPoint: String) -> String {
        return "\(lottoBaseURL)\(endPoint)"
    }
    
    static func getLottoRequest(_ endPoint: String, _ method:HTTPMethod) -> URLRequest {
        let url =  URL(string: self.getLottoUrl(endPoint))!
        var request = URLRequest(url: url)
        request.method = method
        return request
    }
    
    
    
    
    static func keywordList() -> AnyPublisher<ApiResponse<[KeywordData]>, AFError> {
        return AF.request(self.getUrl("/keyword/list"),
                          method: .get, // HTTP메서드 설정
                          parameters: nil, // 파라미터 설정
                          encoding: URLEncoding.default, // 인코딩 타입 설정
                          headers: ["Content-Type":"application/json", "Accept":"application/json"]) // 헤더 설정
        .validate(statusCode: 200..<300) // 유효성 검사
        //            .responseJSON { response in
        //                print("Received JSON response: \(ressponse)")
        //            }
        .publishDecodable(type: ApiResponse<[KeywordData]>.self) // 디코딩 타입 지정
        .value()
        .map { result in
            return result
        }.eraseToAnyPublisher()
    }
    
    static func searchKeyword(keyword01: String, keyword02: String) -> AnyPublisher<ApiResponse<KeywordData>, AFError> {
        return AF.request(self.getUrl("/keyword/\(keyword01)/\(keyword02)"),
                          method: .get, // HTTP메서드 설정
                          parameters: nil, // 파라미터 설정
                          encoding: URLEncoding.default, // 인코딩 타입 설정
                          headers: ["Content-Type":"application/json", "Accept":"application/json"]) // 헤더 설정
        .validate(statusCode: 200..<300) // 유효성 검사
        .responseDecodable(of: ApiResponse<KeywordData>.self) { response in
            print("2: \(response)")
            
            
//            switch response.result {
//            case .success(let value):
//                if let json = value as? [String: Any],
//                   let errorMessage = json["errorMessage"] as? String {
//                    // errorMessage를 처리할 수 있습니다.
//                    print("1.success - error message: \(errorMessage)")
//                } else {
//                    // JSON에서 errorMessage를 찾을 수 없는 경우,
//                    // 성공적인 응답이므로 데이터를 처리할 수 있습니다.
//                    print("1-1.success response")
//                }
//            case .failure(let error):
//                print("2.failure Error: \(error.localizedDescription)")
//            }
        }
        .publishDecodable(type: ApiResponse<KeywordData>.self) // 디코딩 타입 지정
        .value()
        .map { result in
            return result
        }.eraseToAnyPublisher()
    }
    
    
    
    

    
    static func getLotto645(getLottoNumber: String, round: Int64) -> AnyPublisher<LottoData, AFError> {
        
        let params:[String:Any] = [
            "method": getLottoNumber,
            "drwNo": round
        ]
        
        return AF.request(self.getLottoUrl("/common.do"),
                          method: .get, // HTTP메서드 설정
                          parameters: params, // 파라미터 설정
                          encoding: URLEncoding.default, // 인코딩 타입 설정
                          headers: ["Content-Type":"application/json", "Accept":"application/json"]) // 헤더 설정
        .validate(statusCode: 200..<300) // 유효성 검사
        //            .responseJSON { response in
        //                print("Received JSON response: \(ressponse)")
        //            }
        .publishDecodable(type: LottoData.self) // 디코딩 타입 지정
        .value()
        .map { result in
            return result
        }.eraseToAnyPublisher()
    }
    
    
    static func postLotto720(round: Int) -> AnyPublisher<LottoData2, AFError> {
        
        var request = self.getLottoRequest("/gameResult.do?method=win720", .post)
        
        request.setHttpBody(round)
        
        return AF.request(request) // 헤더 설정
        .validate(statusCode: 200..<300) // 유효성 검사
        .responseJSON { response in
            print("Received JSON response: \(response)")
        }
        .publishDecodable(type: LottoData2.self) // 디코딩 타입 지정
        .value()
        .map { result in
            return result
        }.eraseToAnyPublisher()
    }
    
    
    
    
    
}


extension URLRequest {
    mutating func setHttpBody<T>(_ value: T) where T : Encodable {
        do {
            self.httpBody = try JSONEncoder().encode(value)
        } catch {}
    }
}
