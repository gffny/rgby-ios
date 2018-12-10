//
//  RGBYMatchDaySquadSelectionView.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/4/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYMatchDaySquadSelectionView: UIControl {

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
        self.setData(playerList: RGBYDemoData.demoTeam.playerList)
        // set the
        self.profileArray = [self.n1Profile, self.n2Profile, self.n3Profile, self.n4Profile, self.n5Profile, self.n6Profile, self.n7Profile, self.n8Profile, self.n9Profile, self.n10Profile, self.n11Profile, self.n12Profile, self.n13Profile, self.n14Profile, self.n15Profile, self.sub1Profile, self.sub2Profile, self.sub3Profile, self.sub4Profile, self.sub5Profile, self.sub6Profile, self.sub7Profile, self.sub8Profile]
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleCloseButton))
        tapGR.numberOfTapsRequired = 2
        self.squadView.addGestureRecognizer(tapGR)
        self.squadView.contentSize = CGSize(width: self.squadView.frame.width, height: 1100)
        for (index, profile) in self.profileArray.enumerated() {
            profile.positionNumber.text = "\(index+1)"
        }
    }
    
    func setData(playerList: [RGBYPlayer]) {
        let playerCell = self.availablePlayerList.subviews[0] as! RGBYProfileView
        playerCell.removeFromSuperview()
        for (index, player) in playerList.enumerated() {
            let playerView = RGBYProfileView(frame: playerCell.frame)
            playerView.setPlayerData(player: player)
            playerView.frame.origin.y += CGFloat(100*index)
            playerView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDrag)))
            self.availablePlayerList.addSubview(playerView)
        }
        self.availablePlayerList.contentSize = CGSize(width: self.availablePlayerList.frame.width, height: CGFloat(playerList.count*100))
    }

    @objc func handleDrag(_ sender: UIPanGestureRecognizer) {
        self.selectedView = sender.view! as? RGBYProfileView
        if sender.state == .began {
            // set the original transform
            self.selectedView?.alpha = 0.7
            //let center = sender.location(in: self.contentView)
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
                    profile.removeButton.isHidden = false
                    profile.removeButton.isEnabled = true
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
        }
    }

    @objc func handleCloseButton(_ sender: UITapGestureRecognizer) {
        for (_, profile) in self.profileArray.enumerated() {
            if profile.frame.contains(sender.location(in: self.squadView)) && profile.player != nil {
                print("re-enable \(profile.player?.firstName) \(profile.player?.lastName)")
                reenablePlayerView(player: profile.player!)
                profile.resetProfileView()
            }
        }
    }

    func reenablePlayerView(player: RGBYPlayer) {
        let profileList = self.availablePlayerList.subviews.filter({ (view) -> Bool in
            return view is RGBYProfileView
        }) as! [RGBYProfileView]
        for (_, profile) in profileList.enumerated() {
            if player.id == profile.player!.id {
                profile.isEnabled = true
                profile.alpha = CGFloat(1)
            }
        }
    }
}

extension RGBYMatchDaySquadSelectionView {
    
}
