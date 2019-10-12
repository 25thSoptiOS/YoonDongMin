//
//  RecieveViewController.swift
//  SOPT_2week_exercise2
//
//  Created by 윤동민 on 2019/10/12.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class RecieveViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var isOnOffLabel: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    
    var email: String?
    var onOff: Bool?
    var term: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailLabel.text = email
        
        guard let isOn = onOff else { return }
        if isOn { isOnOffLabel.text = "On" }
        else { isOnOffLabel.text = "Off" }
        
        guard let term = term else { return }
        termLabel.text = "\(term)"
    }
    
    @IBAction func backScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
