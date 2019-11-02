//
//  Banner.swift
//  SOPT_week2_exercise3
//
//  Created by 윤동민 on 2019/10/26.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation
import UIKit

struct Banner {
    var bannerImage: UIImage?
    
    init(bannerName: String) {
        self.bannerImage = UIImage(named: bannerName)
    }
}
