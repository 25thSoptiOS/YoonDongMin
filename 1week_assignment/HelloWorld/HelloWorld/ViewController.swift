//
//  ViewController.swift
//  HelloWorld
//
//  Created by 윤동민 on 28/09/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var text: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
    }
    
    @IBAction func touchButton(_ sender: Any) {
        text.text = "Say Hello"
    }
}

