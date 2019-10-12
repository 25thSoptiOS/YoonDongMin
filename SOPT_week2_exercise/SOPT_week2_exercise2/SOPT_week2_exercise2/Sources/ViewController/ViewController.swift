//
//  ViewController.swift
//  SOPT_2week_exercise2
//
//  Created by 윤동민 on 2019/10/12.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var renewSwitch: UISwitch!
    @IBOutlet weak var turmSwitch: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sendData(_ sender: Any) {
        guard let controller = self.storyboard?.instantiateViewController(identifier: "Recieve") as? RecieveViewController else { return }
        controller.modalPresentationStyle = .fullScreen
        controller.email = textField.text
        controller.onOff = renewSwitch.isOn
        controller.term = turmSwitch.value
        
        self.present(controller, animated: true, completion: nil)
    }
    
}

