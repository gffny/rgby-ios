//
//  RGBYMatchDaySquadSelectionView.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/4/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYMatchDaySquadSelectionView: UIControl, UIScrollViewDelegate {

    let nibName = "RGBYMatchDaySquadSelectionView"

    @IBOutlet weak var matchDayTitleLabel: UILabel!
    @IBOutlet weak var availablePlayerList: UIScrollView!
    @IBOutlet weak var squadView: UIScrollView!
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var n1Profile: RGBYProfileView!
    @IBOutlet weak var n2Profile: RGBYProfileView!
    @IBOutlet weak var n3Profile: RGBYProfileView!
    @IBOutlet weak var n4Profile: RGBYProfileView!
    @IBOutlet weak var n5Profile: RGBYProfileView!
    @IBOutlet weak var n6Profile: RGBYProfileView!
    @IBOutlet weak var n7Profile: RGBYProfileView!
    @IBOutlet weak var n8Profile: RGBYProfileView!
    @IBOutlet weak var n9Profile: RGBYProfileView!
    @IBOutlet weak var n10Profile: RGBYProfileView!
    @IBOutlet weak var n11Profile: RGBYProfileView!
    @IBOutlet weak var n12Profile: RGBYProfileView!
    @IBOutlet weak var n13Profile: RGBYProfileView!
    @IBOutlet weak var n14Profile: RGBYProfileView!
    @IBOutlet weak var n15Profile: RGBYProfileView!

    // 8 subs
    @IBOutlet weak var sub1Profile: RGBYProfileView!
    @IBOutlet weak var sub2Profile: RGBYProfileView!
    @IBOutlet weak var sub3Profile: RGBYProfileView!
    @IBOutlet weak var sub4Profile: RGBYProfileView!
    @IBOutlet weak var sub5Profile: RGBYProfileView!
    @IBOutlet weak var sub6Profile: RGBYProfileView!
    @IBOutlet weak var sub7Profile: RGBYProfileView!
    @IBOutlet weak var sub8Profile: RGBYProfileView!

    @IBOutlet var contentView: UIView!

    var selectedView: RGBYProfileView?
    var movePointer: RGBYProfileView?
    var profileArray: [RGBYProfileView] = []
    var team: RGBYTeam?
    var match: RGBYMatch?

    required init?(coder aDecoder: NSCoder) {
        print("RGBYMatchDaySquadSelectionView:: init(coder)")
        super.init(coder: aDecoder)
        setupView()
    }
    
    override init(frame: CGRect) {
        print("RGBYMatchDaySquadSelectionView:: init(coder)")
        super.init(frame: frame)
        setupView()
    }

    func setupView() {
        print("RGBYMatchDaySquadSelectionView::setupView")
        // load the view from the nib
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        // set the view bounds
        self.contentView.frame = bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(contentView)
        // set the profile array values
        self.profileArray = [self.n1Profile, self.n2Profile, self.n3Profile, self.n4Profile, self.n5Profile, self.n6Profile, self.n7Profile, self.n8Profile, self.n9Profile, self.n10Profile, self.n11Profile, self.n12Profile, self.n13Profile, self.n14Profile, self.n15Profile, self.sub1Profile, self.sub2Profile, self.sub3Profile, self.sub4Profile, self.sub5Profile, self.sub6Profile, self.sub7Profile, self.sub8Profile]
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handlePlayerUnselect))
        tapGR.numberOfTapsRequired = 2
        self.squadView.addGestureRecognizer(tapGR)
        self.squadView.contentSize = CGSize(width: self.squadView.frame.width, height: 1018)
        self.squadView.delegate = self
        for (index, profile) in self.profileArray.enumerated() {
            profile.positionNumber.text = "\(index+1)"
        }
        updateSelectionCompleteButton()
    }

    func setMatchDayData(team: RGBYTeam, match: RGBYMatch) {
        self.team = team
        self.match = match
        let playerCell = self.availablePlayerList.subviews[0] as! RGBYProfileView
        playerCell.removeFromSuperview()
        for (index, player) in self.team!.playerList.enumerated() {
            let playerView = RGBYProfileView(frame: playerCell.frame)
            playerView.setPlayerData(player: player)
            playerView.frame.origin.y += CGFloat(102*index)
            playerView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDrag)))
            self.availablePlayerList.addSubview(playerView)
        }
        self.availablePlayerList.contentSize = CGSize(width: self.availablePlayerList.frame.width, height: CGFloat(self.team!.playerList.count*102))
    }

    func reenablePlayerView(player: RGBYPlayer) {
        let profileList = self.availablePlayerList.subviews.filter({ (view) -> Bool in
            return view is RGBYProfileView
        }) as! [RGBYProfileView]
        for (_, profile) in profileList.enumerated() {
            if player.id == profile.player!.id {
                profile.isEnabled = true
                profile.alpha = 1
            }
        }
    }

    func updateSelectionCompleteButton() {
        // only show the complete selection button when the squad view is towards the bottom
        let scrollContentSizeHeight = self.squadView.contentSize.height
        let scrollOffset = self.squadView.contentOffset.y + self.squadView.frame.size.height
        // conditions
        // all positions selected = always show done button
        // not all positions selected
        // - not within x of bottom = don't show
        // - between x of bottom and bottom (increase the alpha)
        var allPositionsSelected = true
        for (_, profile) in self.profileArray.enumerated() {
            // check each profile for a player value
            if profile.player == nil {
                allPositionsSelected = false
            }
        }
        if allPositionsSelected {
            self.doneButton.alpha = 1
            self.doneButton.isEnabled = true
        } else {
            // reset button style
            self.doneButton.alpha = 0
            self.doneButton.isEnabled = false
            // then check other conditions
            if scrollOffset < scrollContentSizeHeight - 200 {
                // then we are not at bottom
                self.doneButton.alpha = 0
                self.doneButton.isEnabled = false
            } else {
                // then we are towards the end
                self.doneButton.isEnabled = allPositionsSelected
                self.doneButton.alpha = (200-(scrollContentSizeHeight-scrollOffset))/200
            }
        }
    }

    func matchDaySquad() -> RGBYMatchDaySquad {
        return RGBYMatchDaySquad(match: self.match!, team: self.team!, looseHeadProp: self.n1Profile.player!, hooker: self.n2Profile.player!, tightHeadProp: self.n3Profile.player!, looseHeadSecondRow: self.n4Profile.player!, tightHeadSecondRow: self.n5Profile.player!, blindSideFlanker: self.n6Profile.player!, opensideFlanker: self.n7Profile.player!, number8: self.n8Profile.player!, scrumHalf: self.n9Profile.player!, outHalf: self.n10Profile.player!, leftWing: self.n11Profile.player!, insideCenter: self.n12Profile.player!, outsideCenter: self.n13Profile.player!, rightWing: self.n14Profile.player!, fullback: self.n15Profile.player!, subsitutes: [self.sub1Profile.player!, self.sub2Profile.player!, self.sub3Profile.player!, self.sub4Profile.player!, self.sub5Profile.player!, self.sub6Profile.player!, self.sub7Profile.player!, self.sub8Profile.player!])
    }

    // UI EVENT HANDLERS

    @objc func handleDrag(_ sender: UIPanGestureRecognizer) {
        self.selectedView = sender.view! as? RGBYProfileView
        if sender.state == .began {
            // set the original transform
            self.selectedView?.alpha = 0.7
            // TODO make view methods to handle these changes
            self.movePointer = RGBYProfileView(frame: (self.selectedView!.frame))
            self.movePointer!.setPlayerData(player: self.selectedView!.player!)
            self.movePointer!.alpha = 0.7
            self.movePointer!.layer.borderWidth = 3
            self.movePointer!.layer.masksToBounds = false
            self.movePointer!.layer.borderColor = UIColor.black.cgColor
            self.movePointer!.layer.cornerRadius = self.movePointer!.frame.height/2
            self.addSubview(self.movePointer!)
        } else if sender.state == .changed {
            let center = sender.location(in: self.contentView)
            self.movePointer!.center = CGPoint(x: center.x, y: center.y)
        } else if sender.state == .ended {
            // find the destination position
            for (_, profile) in self.profileArray.enumerated() {
                let frame = self.squadView.convert(profile.frame, from:self.squadView)
                if frame.contains(sender.location(in: self.squadView)) {
                    if profile.player != nil {
                        // unset player profile if already set
                        reenablePlayerView(player: profile.player!)
                    }
                    // set the profile content
                    profile.setPlayerData(player: selectedView!.player!)
                    // disable and style the selected player
                    self.selectedView?.isEnabled = false
                    self.selectedView?.alpha = 0.7
                }
            }
            // if the view is enabled then set the alpha to 1
            if (self.selectedView?.isEnabled)! {
                self.selectedView?.alpha = 1
            }
            // remove the move pointer
            self.movePointer?.removeFromSuperview()
            self.movePointer = nil
            self.selectedView = nil
            updateSelectionCompleteButton()
        }
    }

    @objc func handlePlayerUnselect(_ sender: UITapGestureRecognizer) {
        for (_, profile) in self.profileArray.enumerated() {
            if profile.frame.contains(sender.location(in: self.squadView)) && profile.player != nil {
                reenablePlayerView(player: profile.player!)
                profile.resetProfileView()
                updateSelectionCompleteButton()
            }
        }
    }

    @objc func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateSelectionCompleteButton()
    }
}
