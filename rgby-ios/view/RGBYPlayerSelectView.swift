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

    var selectedPlayer: RGBYPlayer?
    var selectedPlayerPosition: RGBYPlayerPosition?

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
        number1.player = squad.looseHeadProp!
        number2.player = squad.hooker!
        number3.player = squad.tightHeadProp!
        number4.player = squad.looseHeadSecondRow!
        number5.player = squad.tightHeadSecondRow!
        number6.player = squad.blindSideFlanker!
        number7.player = squad.opensideFlanker!
        number8.player = squad.number8!
        number9.player = squad.scrumHalf!
        number10.player = squad.outHalf!
        number11.player = squad.leftWing!
        number12.player = squad.insideCenter!
        number13.player = squad.outsideCenter!
        number14.player = squad.rightWing!
        number15.player = squad.fullback!
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
        if button.player != nil {
            self.selectedPlayer = button.player
        }
        if (button == self.number1) {
            self.selectedPlayerPosition = .TIGHT_HEAD_PROP
        } else if (button == self.number2) {
            self.selectedPlayerPosition = .HOOKER
        } else if (button == self.number3) {
            self.selectedPlayerPosition = .TIGHT_HEAD_PROP
        } else if (button == self.number4 || button == self.number5) {
            self.selectedPlayerPosition = .SECOND_ROW
        } else if (button == self.number6) {
            self.selectedPlayerPosition = .BLINDSIDE_FLANKER
        } else if (button == self.number7) {
            self.selectedPlayerPosition = .OPENSIDE_FLANKER
        } else if (button == self.number8) {
            self.selectedPlayerPosition = .NUMBER_8
        } else if (button == self.number9) {
            self.selectedPlayerPosition = .SCRUM_HALF
        } else if (button == self.number10) {
            self.selectedPlayerPosition = .OUT_HALF
        } else if (button == self.number11) {
            self.selectedPlayerPosition = .LEFT_WING
        } else if (button == self.number12) {
            self.selectedPlayerPosition = .INSIDE_CENTER
        } else if (button == self.number13) {
            self.selectedPlayerPosition = .OUTSIDE_CENTER
        } else if (button == self.number14) {
            self.selectedPlayerPosition = .RIGHT_WING
        } else if (button == self.number15) {
            self.selectedPlayerPosition = .FULLBACK
        }

        self.performAction()
    }
}
