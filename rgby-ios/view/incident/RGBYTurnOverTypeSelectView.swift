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
            let button = RGBYUtils.formatIncidentButton(yPos: yPos, width: Int(self.frame.width), height: y, text: turnOverType.displayTitle, buttonColor: (onOff ? .gray : .white))
            button.addTarget(self, action: #selector(handleOptionSelect), for: .touchUpInside)
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
