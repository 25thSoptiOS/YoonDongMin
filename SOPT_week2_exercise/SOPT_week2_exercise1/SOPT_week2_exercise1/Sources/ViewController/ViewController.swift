//
//  ViewController.swift
//  SOPT_2week_exercise1
//
//  Created by 윤동민 on 2019/10/12.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        if identifier == "purple" {
            guard let purple = segue.destination as? PurpleViewController else { return }
            purple.data = "보라색"
        } else {
            guard let green = segue.destination as? GreenViewController else { return }
            green.data = "녹색"
        }
    }
}

