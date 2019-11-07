//
//  SingupData.swift
//  SOPT_week2_exercise3
//
//  Created by 윤동민 on 2019/11/07.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

struct SignupData: Codable {
    let success: Bool
    let message: String
    let data: Int?
}
