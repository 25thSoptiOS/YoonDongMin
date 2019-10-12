//
//  GreenViewController.swift
//  SOPT_2week_exercise1
//
//  Created by 윤동민 on 2019/10/12.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = data
    }
}
