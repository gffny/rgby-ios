//
//  RGBYTurnOverTypeSelectView.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/4/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYTurnOverTypeSelectView: UIControl {
    
    var selectedButton: UIButton?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("RGBYTurnOverTypeSelectView::init(coder)")
        setupView()
    }
    
    override init(frame: CGRect) {
        print("RGBYTurnOverTypeSelectView::init(CGRect)")
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        print("RGBYTurnOverTypeSelectView::setupView")
        let y = Int(self.frame.height)/RGBYTurnOverType.listCases.count
        var yPos: Int = 0
        var onOff: Bool = true
        for turnOverType:RGBYTurnOverType in RGBYTurnOverType.listCases {
            print(turnOverType.displayTitle)
            let button = UIButton(frame: CGRect(x: 0, y: yPos, width: Int(self.frame.width), height: y))
            button.titleLabel?.font = UIFont(name:"HelveticaNeue-CondensedBold", size: 30.0)
            button.titleLabel?.textColor = .black
            button.setTitle(turnOverType.displayTitle, for: .normal)
            button.addTarget(self, action: #selector(handleOptionSelect), for: .touchUpInside)
            if onOff {
                button.backgroundColor = .gray
            }
            self.addSubview(button)
            yPos += y
            onOff = !onOff
        }
    }
}

extension RGBYTurnOverTypeSelectView {
    
    //MARK: MAIN ACTION: .valueChanged
    fileprivate func performAction() {
        sendActions(for: .valueChanged)
    }
    
    @objc fileprivate func handleOptionSelect(sender: UIButton) {
        print("\(sender.titleLabel?.text ?? "UNKNOWN") foul type selected ")
        self.selectedButton = sender
        performAction()
    }
}
