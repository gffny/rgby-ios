//
//  RGBYInMatchTeamListView.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/24/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

@IBDesignable
class RGBYTeamListView: UIView {
    
    let nibName = "RGBYTeamListView"
    
    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var teamTitleLabel: UILabel!
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
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }

    func setTeam(squad: RGBYMatchDaySquad) {
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
        teamTitleLabel.text = squad._teamTitle
    }
}

