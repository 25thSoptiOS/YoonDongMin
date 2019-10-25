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
    static let pressNumber = NSNotification.Name("pressNumber")
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
        var pressedValue: Int = 0
        for index in 0..<numberButtons.count {
            if anyButton == numberButtons[index] {
                pressedValue = index
                break
            }
        }
        NotificationCenter.default.post(name: .pressNumber, object: nil, userInfo: ["pressedValue": pressedValue])
    }
}
