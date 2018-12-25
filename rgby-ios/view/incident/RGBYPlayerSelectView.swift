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

    
    private var _squad: RGBYMatchDaySquad?
    var selectedPlayer: RGBYPlayer?
    var selectedPlayerPosition: RGBYPlayerPosition?

    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var unknownPlayer: UIButton!

    // forwards
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    
    // backs
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var number10: UIButton!
    @IBOutlet weak var number11: UIButton!
    @IBOutlet weak var number12: UIButton!
    @IBOutlet weak var number13: UIButton!
    @IBOutlet weak var number14: UIButton!
    @IBOutlet weak var number15: UIButton!

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
        number1.addTarget(self, action: #selector(playerSelected), for: .touchUpInside)
        number2.addTarget(self, action: #selector(playerSelected), for: .touchUpInside)
        number3.addTarget(self, action: #selector(playerSelected), for: .touchUpInside)
        number4.addTarget(self, action: #selector(playerSelected), for: .touchUpInside)
        number5.addTarget(self, action: #selector(playerSelected), for: .touchUpInside)
        number6.addTarget(self, action: #selector(playerSelected), for: .touchUpInside)
        number7.addTarget(self, action: #selector(playerSelected), for: .touchUpInside)
        number8.addTarget(self, action: #selector(playerSelected), for: .touchUpInside)
        number9.addTarget(self, action: #selector(playerSelected), for: .touchUpInside)
        number10.addTarget(self, action: #selector(playerSelected), for: .touchUpInside)
        number11.addTarget(self, action: #selector(playerSelected), for: .touchUpInside)
        number12.addTarget(self, action: #selector(playerSelected), for: .touchUpInside)
        number13.addTarget(self, action: #selector(playerSelected), for: .touchUpInside)
        number14.addTarget(self, action: #selector(playerSelected), for: .touchUpInside)
        number15.addTarget(self, action: #selector(playerSelected), for: .touchUpInside)
    }

    func setTeam(squad: RGBYMatchDaySquad) {
        // set the team players
        self._squad = squad
        self.number1.setTitle("\(RGBYUtils.formatPlayerName(player: squad.looseHeadProp))", for: .normal)
        self.number2.setTitle("\(RGBYUtils.formatPlayerName(player: squad.hooker))", for: .normal)
        self.number3.setTitle("\(RGBYUtils.formatPlayerName(player: squad.tightHeadProp))", for: .normal)
        self.number4.setTitle("\(RGBYUtils.formatPlayerName(player: squad.looseHeadSecondRow))", for: .normal)
        self.number5.setTitle("\(RGBYUtils.formatPlayerName(player: squad.tightHeadSecondRow))", for: .normal)
        self.number6.setTitle("\(RGBYUtils.formatPlayerName(player: squad.blindSideFlanker))", for: .normal)
        self.number7.setTitle("\(RGBYUtils.formatPlayerName(player: squad.opensideFlanker))", for: .normal)
        self.number8.setTitle("\(RGBYUtils.formatPlayerName(player: squad.number8))", for: .normal)
        self.number9.setTitle("\(RGBYUtils.formatPlayerName(player: squad.scrumHalf))", for: .normal)
        self.number10.setTitle("\(RGBYUtils.formatPlayerName(player: squad.outHalf))", for: .normal)
        self.number11.setTitle("\(RGBYUtils.formatPlayerName(player: squad.leftWing))", for: .normal)
        self.number12.setTitle("\(RGBYUtils.formatPlayerName(player: squad.insideCenter))", for: .normal)
        self.number13.setTitle("\(RGBYUtils.formatPlayerName(player: squad.outsideCenter))", for: .normal)
        self.number14.setTitle("\(RGBYUtils.formatPlayerName(player: squad.rightWing))", for: .normal)
        self.number15.setTitle("\(RGBYUtils.formatPlayerName(player: squad.fullback))", for: .normal)

    }
}

extension RGBYPlayerSelectView {

    //MARK: MAIN ACTION: .valueChanged
    fileprivate func performAction() {
        sendActions(for: .valueChanged)
    }

    //MARK: CHANGING APPEREANCE OF BUTTON ON TAP
    @objc fileprivate func playerSelected(button: UIButton) {
        // maybe handle some styling here if need be for the button tapping
        if (button == self.number1) {
            self.selectedPlayerPosition = .TIGHT_HEAD_PROP
            self.selectedPlayer = _squad?.looseHeadSecondRow
        } else if button == self.number2 {
            self.selectedPlayerPosition = .HOOKER
            self.selectedPlayer = _squad?.hooker
        } else if button == self.number3 {
            self.selectedPlayerPosition = .TIGHT_HEAD_PROP
            self.selectedPlayer = _squad?.tightHeadProp
        } else if button == self.number4 {
            self.selectedPlayerPosition = .SECOND_ROW
            self.selectedPlayer = _squad?.looseHeadSecondRow
        } else if button == self.number5 {
            self.selectedPlayerPosition = .SECOND_ROW
            self.selectedPlayer = _squad?.tightHeadSecondRow
        } else if button == self.number6 {
            self.selectedPlayerPosition = .BLINDSIDE_FLANKER
            self.selectedPlayer = _squad?.blindSideFlanker
        } else if button == self.number7 {
            self.selectedPlayerPosition = .OPENSIDE_FLANKER
            self.selectedPlayer = _squad?.opensideFlanker
        } else if button == self.number8 {
            self.selectedPlayerPosition = .NUMBER_8
            self.selectedPlayer = _squad?.number8
        } else if button == self.number9 {
            self.selectedPlayerPosition = .SCRUM_HALF
            self.selectedPlayer = _squad?.scrumHalf
        } else if button == self.number10 {
            self.selectedPlayerPosition = .OUT_HALF
            self.selectedPlayer = _squad?.outHalf
        } else if button == self.number11 {
            self.selectedPlayerPosition = .LEFT_WING
            self.selectedPlayer = _squad?.leftWing
        } else if button == self.number12 {
            self.selectedPlayerPosition = .INSIDE_CENTER
            self.selectedPlayer = _squad?.insideCenter
        } else if button == self.number13 {
            self.selectedPlayerPosition = .OUTSIDE_CENTER
            self.selectedPlayer = _squad?.outsideCenter
        } else if button == self.number14 {
            self.selectedPlayerPosition = .RIGHT_WING
            self.selectedPlayer = _squad?.rightWing
        } else if button == self.number15 {
            self.selectedPlayerPosition = .FULLBACK
            self.selectedPlayer = _squad?.fullback
        }
        self.performAction()
    }
}
