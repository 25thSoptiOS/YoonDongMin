//
//  SignupService.swift
//  SOPT_week2_exercise3
//
//  Created by 윤동민 on 2019/11/02.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation
import Alamofire

struct SignupService {
    static let shared = SignupService()
    
    func signup(id: String, pwd: String, name: String, phone: String) {
//        let header: HTTPHeaders = [
//            "Content-Type" : "application/json"
//        ]
//
//        let body: Parameters = [
//            "id": id,
//            "pwd": pwd,
//            "name": name,
//            "phone": phone
//        ]
        
//        Alamofire.request(APIContstans.signupURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseData { response in
//            switch response.result {
//            case .success:
//                guard let value = response.result.value else { return }
//                guard let status = response.response?.statusCode else { return }
//                switch status {
//                case 200:
//                    let encoder = JSONEncoder()
//                    let result = try? encoder.encode()
//                case 400:
//                case 500:
//                default:
//                    break
//                }
//            case .failure(_):
//
//            @unknown default:
//
//            }
//        }
    }
}
