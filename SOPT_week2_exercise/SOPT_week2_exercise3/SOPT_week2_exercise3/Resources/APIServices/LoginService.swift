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
    
    func login(_ id: String, _ pwd: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let dataRequest = Alamofire.request(APIContstans.loginURL, method: .post, parameters: makeParameter(id, pwd), encoding: JSONEncoding.default, headers: DataHeader.json.getHeader())
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.result.value else { return }
                let networkResult = self.judge(by: statusCode, value: value)
                completion(networkResult)
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
            }
        }
    }
    
    private func judge(by statusCode: Int, value: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isUser(value)
        case 400: return .pathErr
        case 500: return .networkFail
        default: return .networkFail
        }
    }
    
    private func isUser(_ value: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let getData = try? decoder.decode(LoginData.self, from: value) else { return .pathErr }
        guard let userInfo = getData.data else { return .requestErr(getData.message) }
        if getData.success { return .success(userInfo) }
        else { return .requestErr(getData.message) }
    }
}
