//
//  RGBYStatsView.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/26/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYTeamView: UIControl, UITableViewDataSource {

    private var nibName = "RGBYTeamView"
    private var PROFILE_REUSE_ID = "PROFILE_REUSE_ID"

    // squad profiles
    @IBOutlet weak var number1: RGBYProfileView!
    @IBOutlet weak var number2: RGBYProfileView!
    @IBOutlet weak var number3: RGBYProfileView!
    @IBOutlet weak var number4: RGBYProfileView!
    @IBOutlet weak var number5: RGBYProfileView!
    @IBOutlet weak var number6: RGBYProfileView!
    @IBOutlet weak var number7: RGBYProfileView!
    @IBOutlet weak var number8: RGBYProfileView!
    @IBOutlet weak var number9: RGBYProfileView!
    @IBOutlet weak var number10: RGBYProfileView!
    @IBOutlet weak var number11: RGBYProfileView!
    @IBOutlet weak var number12: RGBYProfileView!
    @IBOutlet weak var number13: RGBYProfileView!
    @IBOutlet weak var number14: RGBYProfileView!
    @IBOutlet weak var number15: RGBYProfileView!
    @IBOutlet weak var teamView: UIView!
    
    // move related variables
    var selectedView: RGBYProfileViewCell?
    var movePointer: RGBYProfileView?
    var profileArray: [RGBYProfileView] = []

    // substitute lists
    @IBOutlet weak var unused: UITableView!
    @IBOutlet weak var used: UITableView!

    @IBOutlet var contentView: UIView!

    var teamViewDelegate: RGBYTeamViewlDelegate?

    var matchDaySquad: RGBYMatchDaySquad? {
        didSet {
            self.used.reloadData()
            self.unused.reloadData()
            self.updateOnfieldView()
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder) {
        print("RGBYTeamView:: init(coder)")
        super.init(coder: aDecoder)
        setupView()
    }

    override init(frame: CGRect) {
        print("RGBYTeamView:: init(frame)")
        super.init(frame: frame)
        setupView()
    }

    func setupView() {
        print("RGBYTeamView::setupView")
        // load the view from the nib
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        // set the view bounds
        self.contentView.frame = bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(self.contentView)
        self.profileArray = [self.number1, self.number2, self.number3, self.number4, self.number5, self.number6, self.number7, self.number8, self.number9, self.number10, self.number11, self.number12, self.number13, self.number14, self.number15]
        self.unused.dataSource = self
        self.unused.register(UINib.init(nibName: RGBYProfileViewCell.nibName, bundle: nil), forCellReuseIdentifier: PROFILE_REUSE_ID)
        self.used.dataSource = self
        self.used.register(UINib.init(nibName: RGBYProfileViewCell.nibName, bundle: nil), forCellReuseIdentifier: PROFILE_REUSE_ID)
    }

    @objc func handleDrag(_ sender: UIPanGestureRecognizer) {
        self.selectedView = sender.view! as? RGBYProfileViewCell
        if sender.state == .began {
            self.movePointer = RGBYProfileView(frame: (self.selectedView!.frame), isMovePointer: true)
            self.movePointer!.setPlayerData(player: self.selectedView!.player!)
            self.addSubview(self.movePointer!)
        } else if sender.state == .changed {
            let center = sender.location(in: self.contentView)
            self.movePointer!.center = CGPoint(x: center.x, y: center.y)
        } else if sender.state == .ended {
            // find the destination position
            for (_, profile) in self.profileArray.enumerated() {
                // is the destination position in a profile frame
                if self.teamView.convert(profile.frame, from:self.teamView).contains(sender.location(in: self.teamView)) {
                    // call the delegate to sub the player
                    self.teamViewDelegate?.substitutePlayer(position: profile.positionNumber.text!, with: selectedView!.player!)
                    // set the new profile view
                    profile.setPlayerData(player: selectedView!.player!)
                    // disable and style the selected player
                    self.selectedView?.disable()
                }
            }
            // if the view is enabled then enable it
            if (self.selectedView?.isUserInteractionEnabled)! {
                self.selectedView?.enable()
            }
            // remove the move pointer
            self.movePointer?.removeFromSuperview()
            self.movePointer = nil
            self.selectedView = nil
        }
    }

    func updateOnfieldView() {
        self.number1.setPlayerData(player: self.matchDaySquad?.looseHeadProp ?? RGBYPlayer(), position: .LOOSE_HEAD_PROP)
        self.number2.setPlayerData(player: self.matchDaySquad?.hooker ?? RGBYPlayer(), position: .HOOKER)
        self.number3.setPlayerData(player: self.matchDaySquad?.tightHeadProp ?? RGBYPlayer(), position: .TIGHT_HEAD_PROP)
        self.number4.setPlayerData(player: self.matchDaySquad?.looseHeadSecondRow ?? RGBYPlayer(), position: .SECOND_ROW, positionNumber: 4)
        self.number5.setPlayerData(player: self.matchDaySquad?.tightHeadSecondRow ?? RGBYPlayer(), position: .SECOND_ROW, positionNumber: 5)
        self.number6.setPlayerData(player: self.matchDaySquad?.blindSideFlanker ?? RGBYPlayer(), position: .BLINDSIDE_FLANKER)
        self.number7.setPlayerData(player: self.matchDaySquad?.opensideFlanker ?? RGBYPlayer(), position: .OPENSIDE_FLANKER)
        self.number8.setPlayerData(player: self.matchDaySquad?.number8 ?? RGBYPlayer(), position: .NUMBER_8)
        self.number9.setPlayerData(player: self.matchDaySquad?.scrumHalf ?? RGBYPlayer(), position: .SCRUM_HALF)
        self.number10.setPlayerData(player: self.matchDaySquad?.outHalf ?? RGBYPlayer(), position: .OUT_HALF)
        self.number11.setPlayerData(player: self.matchDaySquad?.leftWing ?? RGBYPlayer(), position: .LEFT_WING)
        self.number12.setPlayerData(player: self.matchDaySquad?.insideCenter ?? RGBYPlayer(), position: .INSIDE_CENTER)
        self.number13.setPlayerData(player: self.matchDaySquad?.outsideCenter ?? RGBYPlayer(), position: .OUTSIDE_CENTER)
        self.number14.setPlayerData(player: self.matchDaySquad?.rightWing ?? RGBYPlayer(), position: .RIGHT_WING)
        self.number15.setPlayerData(player: self.matchDaySquad?.fullback ?? RGBYPlayer(), position: .FULLBACK)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.unused {
            return (self.matchDaySquad?.subsituteList.count)!
        } else if tableView == self.used {
            return (self.matchDaySquad?.subbedPlayerList.count)!
        }
        return 0;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.unused {
            let cell = self.unused.dequeueReusableCell(withIdentifier: PROFILE_REUSE_ID) as! RGBYProfileViewCell
            cell.player = self.matchDaySquad?.subsituteList[indexPath.row]
            cell.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDrag)))
            return cell
        } else {
            let cell = self.used.dequeueReusableCell(withIdentifier: PROFILE_REUSE_ID) as! RGBYProfileViewCell
            cell.player = self.matchDaySquad?.subbedPlayerList[indexPath.row]
            return cell
        }
    }
}

protocol RGBYTeamViewlDelegate : NSObjectProtocol {
    func substitutePlayer(position: String, with: RGBYPlayer) -> Void
}
