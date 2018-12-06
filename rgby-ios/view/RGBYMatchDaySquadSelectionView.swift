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
    @IBOutlet weak var squadView: UIView!
    
    @IBOutlet weak var thpProfile: RGBYProfileView!
    @IBOutlet weak var hkrProfile: RGBYProfileView!
    @IBOutlet weak var lhpProfile: RGBYProfileView!
    @IBOutlet weak var thsrProfile: RGBYProfileView!
    @IBOutlet weak var lhsrrofile: RGBYProfileView!
    @IBOutlet weak var bsfProfile: RGBYProfileView!
    @IBOutlet weak var osfProfile: RGBYProfileView!
    @IBOutlet weak var no8Profile: RGBYProfileView!
    @IBOutlet weak var shProfile: RGBYProfileView!
    @IBOutlet weak var ohProfile: RGBYProfileView!
    @IBOutlet weak var lwProfile: RGBYProfileView!
    @IBOutlet weak var icProfile: RGBYProfileView!
    @IBOutlet weak var ocProfile: RGBYProfileView!
    @IBOutlet weak var rwProfile: RGBYProfileView!
    @IBOutlet weak var fbProfile: RGBYProfileView!

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
        self.setData(playerList: [RGBYDemoData.gffny, RGBYDemoData.demoJSe])
        self.profileArray = [self.thpProfile, self.hkrProfile, self.lhpProfile]

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
    
        // handle the dragging
        
        // TODO CHANGE THIS TO POPULATE ALL AVAILABLE PLAYERS THIS IS JUST A STUB
        
        //jlb.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDrag)))
        //self.availablePlayerList.addSubview(jvdf)
        // add it to this view
    }

    @objc func handleDrag(_ sender: UIPanGestureRecognizer) {
        self.selectedView = sender.view! as! RGBYProfileView
        if sender.state == .began {
            print("began")
            // self.selectedView!.bringSubviewToFront(self.selectedView!)
        } else if sender.state == .ended {
            // move additional views down
            // filter the list of views to the required type
//            let availablePlayerArray = self.availablePlayerList.subviews.filter { (view: UIView) -> Bool in
//                return view is RGBYProfileView
//            }
//            if var selectedIndex = availablePlayerArray.firstIndex(of: sender.view!) {
//                selectedIndex += 1
//                while selectedIndex < availablePlayerArray.count {
//                    print(selectedIndex)
//                    // move label up
//                    let buttonFrame = availablePlayerArray[selectedIndex].frame
//                    availablePlayerArray[selectedIndex].frame = CGRect(x: buttonFrame.origin.x, y: buttonFrame.origin.y-100, width: buttonFrame.width, height: buttonFrame.height)
//                    selectedIndex += 1
//                }
//            }
            for (_, profile) in self.profileArray.enumerated() {
                if profile.frame.contains(sender.location(in: self.squadView)) {
                    profile.setPlayerData(player: selectedView!.player!)
                    profile.removeButton.isHidden = false
                    self.selectedView?.isEnabled = false
                    self.selectedView?.alpha = CGFloat(0.7)

                }
            }
            //self.squadView.addSubview(sender.view!)
            self.selectedView = nil
        }

    }
}

extension RGBYMatchDaySquadSelectionView {
    
}
