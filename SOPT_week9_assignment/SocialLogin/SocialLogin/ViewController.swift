//
//  ViewController.swift
//  SocialLogin
//
//  Created by 윤동민 on 2019/12/07.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let loginButton = FBLoginButton()
        
        loginButton.permissions = ["email"]
        loginButton.center = view.center
        view.addSubview(loginButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAccessToken()
    }
    
    func getAccessToken() {
        guard let token = AccessToken.current else { return }
        print("### AccessToken ####")
        print(token)
        print("### AccessToken ####")
    }
}

