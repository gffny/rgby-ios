//
//  RGBYTeamSelectionView.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/26/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

@IBDesignable
class RGBYTeamSelectView: UIControl {
    
    let nibName = "RGBYTeamSelectView"

    var goBackSelected:Bool = false
    var selectedTeam: RGBYMatchDaySquad?
    var _myTeam: RGBYMatchDaySquad?
    var _oppositionTeam: RGBYMatchDaySquad?

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var myTeamButton: UIButton!
    @IBOutlet weak var oppositionTeamButton: UIButton!
    @IBOutlet weak var goBackButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("RGBYTeamListView::init(coder)")
        setupView()
    }
    
    override init(frame: CGRect) {
        print("RGBYTeamListView::init(frame)")
        super.init(frame: frame)
        setupView()
    }

    func setupView() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        myTeamButton.addTarget(self, action: #selector(handleTeamSelected(button:)), for: .touchUpInside)
        oppositionTeamButton.addTarget(self, action: #selector(handleTeamSelected(button:)), for: .touchUpInside)
        goBackButton.addTarget(self, action: #selector(handleGoBackSelected), for: .touchUpInside)
    }

    func setTeamValues(myTeam: RGBYMatchDaySquad, oppositionTeam: RGBYMatchDaySquad) {
        _myTeam = myTeam
        myTeamButton.setTitle(_myTeam?._teamTitle, for: .normal)
        _oppositionTeam = oppositionTeam
        oppositionTeamButton.setTitle(_oppositionTeam?._teamTitle, for: .normal)
    }
}

extension RGBYTeamSelectView {
    
    //MARK: MAIN ACTION: .valueChanged
    fileprivate func performAction() {
        sendActions(for: .valueChanged)
    }
    
    @objc fileprivate func handleGoBackSelected() {
        goBackSelected = true
        self.performAction()
    }
    
    //MARK: CHANGING APPEREANCE OF BUTTON ON TAP
    @objc fileprivate func handleTeamSelected(button: UIButton) {
        if button == myTeamButton {
            selectedTeam = _myTeam
        } else if button == oppositionTeamButton {
            selectedTeam = _oppositionTeam
        }
        // maybe handle some styling here if need be for the button tapping
        self.performAction()
    }
}
