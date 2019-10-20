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
        addButtonObserver()
    }
    
    private func addButtonObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(addZero), name: .clickedZero, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addOne), name: .clickedOne, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addTwo), name: .clickedTwo, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addThree), name: .clickedThree, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addFour), name: .clickedFour, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addFive), name: .clickedFive, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addSix), name: .clickedSix, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addSeven), name: .clickedSeven, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addEight), name: .clickedEight, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(addNine), name: .clickedNine, object: nil)
    }
}

extension ViewController {
    @objc func addZero() {
        print("0")
    }
    
    @objc func addOne() {
        print("1")
    }
    
    @objc func addTwo() {
        print("2")
    }
    
    @objc func addThree() {
        print("3")
    }
    
    @objc func addFour() {
        print("4")
    }
    
    @objc func addFive() {
        print("5")
    }
    
    @objc func addSix() {
        print("6")
    }
    
    @objc func addSeven() {
        
    }
    
    @objc func addEight() {
        
    }
    
    @objc func addNine() {
        
    }
}

