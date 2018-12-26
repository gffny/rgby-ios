//
//  RGBYStatsView.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/26/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYTeamView: UIView, UITableViewDataSource {

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

    // substitute lists
    @IBOutlet weak var unused: UITableView!
    @IBOutlet weak var used: UITableView!

    @IBOutlet var contentView: UIView!
    
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
        self.unused.dataSource = self
        self.unused.register(UINib.init(nibName: RGBYProfileViewCell.nibName, bundle: nil), forCellReuseIdentifier: PROFILE_REUSE_ID)
        self.used.dataSource = self
        self.used.register(UINib.init(nibName: RGBYProfileViewCell.nibName, bundle: nil), forCellReuseIdentifier: PROFILE_REUSE_ID)
    }

    func updateOnfieldView() {
        self.number1.setPlayerData(player: self.matchDaySquad?.looseHeadProp ?? RGBYPlayer())
        self.number2.setPlayerData(player: self.matchDaySquad?.hooker ?? RGBYPlayer())
        self.number3.setPlayerData(player: self.matchDaySquad?.tightHeadProp ?? RGBYPlayer())
        self.number4.setPlayerData(player: self.matchDaySquad?.looseHeadSecondRow ?? RGBYPlayer())
        self.number5.setPlayerData(player: self.matchDaySquad?.tightHeadSecondRow ?? RGBYPlayer())
        self.number6.setPlayerData(player: self.matchDaySquad?.blindSideFlanker ?? RGBYPlayer())
        self.number7.setPlayerData(player: self.matchDaySquad?.opensideFlanker ?? RGBYPlayer())
        self.number8.setPlayerData(player: self.matchDaySquad?.number8 ?? RGBYPlayer())
        self.number9.setPlayerData(player: self.matchDaySquad?.scrumHalf ?? RGBYPlayer())
        self.number10.setPlayerData(player: self.matchDaySquad?.outHalf ?? RGBYPlayer())
        self.number11.setPlayerData(player: self.matchDaySquad?.leftWing ?? RGBYPlayer())
        self.number12.setPlayerData(player: self.matchDaySquad?.insideCenter ?? RGBYPlayer())
        self.number13.setPlayerData(player: self.matchDaySquad?.outsideCenter ?? RGBYPlayer())
        self.number14.setPlayerData(player: self.matchDaySquad?.rightWing ?? RGBYPlayer())
        self.number15.setPlayerData(player: self.matchDaySquad?.fullback ?? RGBYPlayer())
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
            return cell
        } else {
            let cell = self.used.dequeueReusableCell(withIdentifier: PROFILE_REUSE_ID) as! RGBYProfileViewCell
            cell.player = self.matchDaySquad?.subbedPlayerList[indexPath.row]
            return cell
        }
    }
}
