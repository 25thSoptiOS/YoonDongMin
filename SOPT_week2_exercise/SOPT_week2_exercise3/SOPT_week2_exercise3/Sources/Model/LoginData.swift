//
//  ResponseString.swift
//  SOPT_week2_exercise3
//
//  Created by 윤동민 on 2019/11/02.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

struct LoginData: Codable {
    let success: Bool
    let message: String
    let data: DataClass?
}

struct DataClass: Codable {
    let userIdx: Int
    let id: String
    let password: String
    let name: String
    let phone: String
}
