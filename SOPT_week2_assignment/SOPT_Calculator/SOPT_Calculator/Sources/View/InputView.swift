//
//  InputView.swift
//  SOPT_Calculator
//
//  Created by 윤동민 on 2019/10/18.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

extension UIView {
    func setCornerRadius() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}

extension NSNotification.Name {
    static let clickedZero = NSNotification.Name("clickedZero")
    static let clickedOne = NSNotification.Name("clickedOne")
    static let clickedTwo = NSNotification.Name("clickedTwo")
    static let clickedThree = NSNotification.Name("clickedThree")
    static let clickedFour = NSNotification.Name("clickedFour")
    static let clickedFive = NSNotification.Name("clickedFive")
    static let clickedSix = NSNotification.Name("clickedSix")
    static let clickedSeven = NSNotification.Name("clickedSeven")
    static let clickedEight = NSNotification.Name("clickedEight")
    static let clickedNine = NSNotification.Name("clickedNine")
}

class InputView: UIView {
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initailView()
        initialButtonSetting()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initailView()
        initialButtonSetting()
    }
    
    private func initailView() {
        guard let view = Bundle.main.loadNibNamed(NibNames.inputView, owner: self, options: nil)?.first as? UIView else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    private func initialButtonSetting() {
        for button in numberButtons { button.setCornerRadius() }
        clearButton.setCornerRadius()
        equalButton.setCornerRadius()
        plusButton.setCornerRadius()
        minusButton.setCornerRadius()
        multiplyButton.setCornerRadius()
        divideButton.setCornerRadius()
    }
    
    @IBAction func clickNumbers(_ sender: Any) {
        guard let anyButton = sender as? UIButton else { return }
        switch anyButton {
        case numberButtons[0]: NotificationCenter.default.post(name: .clickedZero, object: nil)
        case numberButtons[1]: NotificationCenter.default.post(name: .clickedOne, object: nil)
        case numberButtons[2]: NotificationCenter.default.post(name: .clickedTwo, object: nil)
        case numberButtons[3]: NotificationCenter.default.post(name: .clickedThree, object: nil)
        case numberButtons[4]: NotificationCenter.default.post(name: .clickedFour, object: nil)
        case numberButtons[5]: NotificationCenter.default.post(name: .clickedFive, object: nil)
        case numberButtons[6]: NotificationCenter.default.post(name: .clickedSix, object: nil)
        case numberButtons[7]: NotificationCenter.default.post(name: .clickedSeven, object: nil)
        case numberButtons[8]: NotificationCenter.default.post(name: .clickedEight, object: nil)
        case numberButtons[9]: NotificationCenter.default.post(name: .clickedNine, object: nil)
        default: return
        }
    }
}
