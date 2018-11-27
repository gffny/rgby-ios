//
//  RGBYInMatchTeamListView.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/24/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

@IBDesignable
class RGBYPlayerSelectView: UIControl {
    
    let nibName = "RGBYPlayerSelectView"

    var selectedPlayer: RGBYMatchDaySquadMember?

    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var unknownPlayer: UIButton!

    // forwards
    @IBOutlet weak var number1: RGBYPlayerButton!
    @IBOutlet weak var number2: RGBYPlayerButton!
    @IBOutlet weak var number3: RGBYPlayerButton!
    @IBOutlet weak var number4: RGBYPlayerButton!
    @IBOutlet weak var number5: RGBYPlayerButton!
    @IBOutlet weak var number6: RGBYPlayerButton!
    @IBOutlet weak var number7: RGBYPlayerButton!
    @IBOutlet weak var number8: RGBYPlayerButton!
    
    // backs
    @IBOutlet weak var number9: RGBYPlayerButton!
    @IBOutlet weak var number10: RGBYPlayerButton!
    @IBOutlet weak var number11: RGBYPlayerButton!
    @IBOutlet weak var number12: RGBYPlayerButton!
    @IBOutlet weak var number13: RGBYPlayerButton!
    @IBOutlet weak var number14: RGBYPlayerButton!
    @IBOutlet weak var number15: RGBYPlayerButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("RGBYTeamListView::init(coder)")
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("RGBYTeamListView::init(frame)")
        setupView()
    }
    
    func setupView() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        number1.addTarget(self, action: #selector(playerSelected(button:)), for: .touchUpInside)
        number2.addTarget(self, action: #selector(playerSelected(button:)), for: .touchUpInside)
        number3.addTarget(self, action: #selector(playerSelected(button:)), for: .touchUpInside)
        number4.addTarget(self, action: #selector(playerSelected(button:)), for: .touchUpInside)
        number5.addTarget(self, action: #selector(playerSelected(button:)), for: .touchUpInside)
        number6.addTarget(self, action: #selector(playerSelected(button:)), for: .touchUpInside)
        number7.addTarget(self, action: #selector(playerSelected(button:)), for: .touchUpInside)
        number8.addTarget(self, action: #selector(playerSelected(button:)), for: .touchUpInside)
        number9.addTarget(self, action: #selector(playerSelected(button:)), for: .touchUpInside)
        number10.addTarget(self, action: #selector(playerSelected(button:)), for: .touchUpInside)
        number11.addTarget(self, action: #selector(playerSelected(button:)), for: .touchUpInside)
        number12.addTarget(self, action: #selector(playerSelected(button:)), for: .touchUpInside)
        number13.addTarget(self, action: #selector(playerSelected(button:)), for: .touchUpInside)
        number14.addTarget(self, action: #selector(playerSelected(button:)), for: .touchUpInside)
        number15.addTarget(self, action: #selector(playerSelected(button:)), for: .touchUpInside)
    }

    func setTeam(squad: RGBYMatchDaySquad) {
        // set the team players
        number1.player = squad._looseHeadProp
        number2.player = squad._hooker
        number3.player = squad._tightHeadProp
        number4.player = squad._looseHeadSecondRow
        number5.player = squad._tightHeadSecondRow
        number6.player = squad._blindSideFlanker
        number7.player = squad._opensideFlanker
        number8.player = squad._number8
        number9.player = squad._scrumHalf
        number10.player = squad._outHalf
        number11.player = squad._leftWing
        number12.player = squad._insideCenter
        number13.player = squad._outsideCenter
        number14.player = squad._rightWing
        number15.player = squad._fullback
    }
}

extension RGBYPlayerSelectView {

    //MARK: MAIN ACTION: .valueChanged
    fileprivate func performAction() {
        sendActions(for: .valueChanged)
    }
    
    //MARK: CHANGING APPEREANCE OF BUTTON ON TAP
    @objc fileprivate func playerSelected(button: RGBYPlayerButton) {
        // maybe handle some styling here if need be for the button tapping
        selectedPlayer = button.player
        self.performAction()
    }
}