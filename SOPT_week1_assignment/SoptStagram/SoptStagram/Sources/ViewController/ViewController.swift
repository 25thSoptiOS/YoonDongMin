//
//  ViewController.swift
//  SoptStagram
//
//  Created by 윤동민 on 02/10/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var postStackView: UIStackView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var idClicked: UILabel!
    @IBOutlet weak var markedText: UILabel!
    private var isFillHeart: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setInitialView()
        makeProfileRound()
    }
    
    private func setInitialView() {
        self.navigationItem.title = UtilString.appTitle
        postImage.image = UIImage(named: UtilString.postImageName)
        userIDLabel.text = UtilString.userID
        profileImage.image = UIImage(named: UtilString.profileImageName)
        idClicked.text = ""
        markedText.text = ""
    }
    
    private func makeProfileRound() {
        profileImage.layer.cornerRadius = profileImage.frame.width * 0.5
        profileImage.clipsToBounds = true
    }
    
    @IBAction func clickHeart(_ sender: Any) {
        var heartImage: UIImage?
        if !isFillHeart {
            heartImage = UIImage(systemName: UtilString.fillHeart)
            idClicked.text = UtilString.userID
            markedText.text = UtilString.markText
            isFillHeart = true
        } else {
            heartImage = UIImage(systemName: UtilString.emptyHeart)
            idClicked.text = ""
            markedText.text = ""
            isFillHeart = false
        }
        guard heartImage != nil else { return }
        heartButton.setBackgroundImage(heartImage, for: .normal)
    }
}

