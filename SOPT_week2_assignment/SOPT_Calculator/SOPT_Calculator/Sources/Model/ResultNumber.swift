//
//  ResultNumber.swift
//  SOPT_Calculator
//
//  Created by 윤동민 on 2019/10/18.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class ResultNumber {
    private var totalNumber: String
    
    init() {
        totalNumber = ""
    }
    
    func setTotal(number: String) {
        totalNumber += number
    }
    
    func access(form: (String) -> Void) {
        form(totalNumber)
    }
}
