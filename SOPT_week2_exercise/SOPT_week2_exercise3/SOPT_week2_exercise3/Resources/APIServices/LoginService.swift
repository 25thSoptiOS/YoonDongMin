//
//  LoginService.swift
//  SOPT_week2_exercise3
//
//  Created by 윤동민 on 2019/11/02.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation
import Alamofire

class LoginService {
    static let shared = LoginService() // 싱글톤 패턴
    
    private func makeParameter(_ id: String, _ pwd: String) -> Parameters {
        return ["id": id, "pwd": pwd]
    }
    
    func logintemp(id: String, pwd: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let dataRequest = Alamofire.request(APIContstans.loginURL, method: .post, parameters: makeParameter(id, pwd), encoding: JSONEncoding.default, headers: DataHeader.json.getHeader())
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                self.judge(by: statusCode)
            case .failure: print("")
            }
        }
    }
    
    private func judge(by statusCode: Int) {
        switch statusCode {
        case 200: print("")
        case 400: print("")
        case 500: print("")
        default: break
        }
    }

    func login(_ id: String, _ pwd: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        let body: Parameters = [
            "id": id,
            "pwd": pwd
        ]
    
        Alamofire.request(APIContstans.loginURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
                switch response.result {
                case .success:
                    if let value = response.result.value {
                        if let status = response.response?.statusCode {
                            switch status {
                            case 200:
                                do {
                                    let decoder = JSONDecoder()
                                    print("value", value)
                                    let result = try decoder.decode(ResponseString.self, from: value)
                                    // response.result.value ==> Data 타입
                                    switch result.success {
                                    case true:
                                        print("success")
                                        completion(.success(result.data))
                                    case false:
                                        completion(.requestErr(result.message))
                                    }
                                }
                                catch {
                                    completion(.pathErr)
                                    print(error.localizedDescription)
                                    print(APIContstans.loginURL)
                                }
                            case 400:
                                completion(.pathErr)
                            case 500:
                                completion(.serverErr)
                            default:
                                break
                            }// switch
                        }// iflet
                    }
                    break
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(.networkFail)
                    // .networkFail이라는 반환 값이 넘어감
                    break
                } // response.result switch
        } // alamofire.request
    } // func login
} // struct
