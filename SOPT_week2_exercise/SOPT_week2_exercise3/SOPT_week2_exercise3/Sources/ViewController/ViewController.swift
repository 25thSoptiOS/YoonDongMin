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
        
        loginButton.titleLabel?.textColor = UIColor.mainColor
    }
    
    
    @IBAction func doLogin(_ sender: Any) {
        guard let id = idTextField.text else { return }
        guard let pwd = pwTextField.text else { return }
        
        LoginService.shared.login(id, pwd) { data in
            switch data {
            case .success(let data):
                // DataClass 에서 받은 유저 정보 반환
                let user_data = data as! DataClass
                // 사용자의 토큰, 이름, 이메일, 전화번호 받아오기
                // 비밀번호는 안 받아와도 됨
                UserDefaults.standard.set(user_data.userIdx, forKey: "token")
                UserDefaults.standard.set(user_data.name, forKey: "name")
                UserDefaults.standard.set(user_data.phone, forKey: "phone")
                guard let main = self.storyboard?.instantiateViewController(withIdentifier: "main1") else { return }
                main.modalPresentationStyle = .fullScreen
                self.present(main, animated: true)
                
            case .requestErr(let message):
                print("requestErr")
                let alertView = UIAlertController(title: "로그인 실패", message: "\(message)", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertView.addAction(alertAction)
                self.present(alertView, animated: true, completion: nil)
            case .pathErr:
                print(".pathErr")
            case .serverErr:
                print(".serverErr")
            case .networkFail:
                let alertView = UIAlertController(title: "로그인 실패", message: "네트워크 상태를 확인해주세요.", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertView.addAction(alertAction)
                self.present(alertView, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func doSignup(_ sender: Any) {
        SignupService.shared.signup(id: "dongmin", pwd: "1111", name: "윤동민", phone: "1111") { networkResult in
            switch networkResult {
            case .success(let userData): print(userData)
            case .requestErr(let message): print(message)
            case .pathErr: print("pathErr")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkErr")
            }
        }
    }
}

extension ViewController: UITextFieldDelegate {
    private func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(upKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(downKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func upKeyboard() {
        self.view.frame.origin.y = CGFloat(-UtilValue.keyboardHeight)
        
    }
    
    @objc func downKeyboard() {
        self.view.frame.origin.y = 0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
