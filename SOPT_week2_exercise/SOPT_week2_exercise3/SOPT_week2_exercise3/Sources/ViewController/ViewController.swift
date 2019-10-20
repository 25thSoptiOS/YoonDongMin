//
//  ViewController.swift
//  SOPT_week3_exercise3
//
//  Created by 윤동민 on 2019/10/12.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

extension UIView {
    func setCornerRadius() {
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
    
    func setBorderWidth() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var idTopContraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addKeyboardObserver()
        idTextField.delegate = self
        pwTextField.delegate = self
        loginButton.setCornerRadius()
        loginButton.setBorderWidth()
    }
}

extension ViewController: UITextFieldDelegate {
    private func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(upKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(downKeyboard), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc func upKeyboard() {
        idTopContraint.constant -= 110
    }
    
    @objc func downKeyboard() {
        idTopContraint.constant += 110
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
