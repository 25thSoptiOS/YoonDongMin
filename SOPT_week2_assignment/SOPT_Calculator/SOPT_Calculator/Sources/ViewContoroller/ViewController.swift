//
//  ViewController.swift
//  SOPT_Calculator
//
//  Created by 윤동민 on 2019/10/17.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var inputSceen: InputView!
    private var resultNumber: ResultNumber = ResultNumber()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

