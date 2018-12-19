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

    var selectedTeam: RGBYMatchDaySquad?
    var isMyTeam: Bool = true

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var teamButton: UIButton!
    @IBOutlet weak var oppositionTeamButton: UIButton!
    
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
        teamButton.addTarget(self, action: #selector(handleTeamSelected(button:)), for: .touchUpInside)
        oppositionTeamButton.addTarget(self, action: #selector(handleTeamSelected(button:)), for: .touchUpInside)
    }

    func setTeamValues(team: RGBYTeam, oppositionTeam: RGBYTeam?) {
        teamButton.setTitle(team.title, for: .normal)
        if let opposition = oppositionTeam {
            oppositionTeamButton.setTitle(opposition.title, for: .normal)
        } else {
            oppositionTeamButton.setTitle("Opposition", for: .normal)
        }
    }
}

extension RGBYTeamSelectView {
    
    //MARK: MAIN ACTION: .valueChanged
    fileprivate func performAction() {
        sendActions(for: .valueChanged)
    }
    
    //MARK: CHANGING APPEREANCE OF BUTTON ON TAP
    @objc fileprivate func handleTeamSelected(button: UIButton) {
        if button == teamButton {
            isMyTeam = true
        } else if button == oppositionTeamButton {
            isMyTeam = false
        }
        // maybe handle some styling here if need be for the button tapping
        self.performAction()
    }
}
