//
//  RGBYNewInMatchViewController.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/20/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class RGBYNewInMatchViewController: UIViewController, RGBYMatchDetailDelegate {

    /*
     * Interaction plan
     * Top level button interaction on the left will be handled here!
     * Top bar with clock, match score, team names will be handled here!
     * Subviews will be loaded as seperate view files from here
     */
    
    // TOP BAR OUTLETS
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var teamScore: UILabel!
    @IBOutlet weak var oppositionScore: UILabel!
    @IBOutlet weak var oppositionLabel: UILabel!
    
    // MENU BUTTONS
    @IBOutlet weak var clockFunctionButton: UIButton!
    @IBOutlet weak var teamViewButton: UIButton!
    @IBOutlet weak var statsViewButton: UIButton!
    @IBOutlet weak var fieldViewButton: UIButton!

    private var matchDetail: RGBYMatchDetail = RGBYMatchDetail()

    override func viewDidLoad() {
        super.viewDidLoad()
        // load the team names
        let match = RGBYDemoData.demoMatch
        self.teamLabel.text = match.team?.shortTitle
        self.oppositionLabel.text = match.opposition?.shortTitle
        // set the data source for the clock
        matchDetail = RGBYMatchDetail(match: match)
        matchDetail.matchDetailDelegate = self
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    func periodUpdated() {
        self.periodLabel.text = RGBYUtils.formatMatchPeriod(period: self.matchDetail.currentPeriod)
    }

    func periodTimeUpdated() {
        self.clockLabel.text = String("\(RGBYUtils.formatMatchClock(time: self.matchDetail.currentPeriodTimeInSec))")
    }

    func matchScoreUpdated() {
        self.teamScore.text = "\(self.matchDetail.teamScore)"
        self.oppositionScore.text = "\(self.matchDetail.oppositionScore)"
    }

    @IBAction func handleMenuClick(_ sender: UIButton) {
        if sender == self.clockFunctionButton {
            
        } else if sender == self.teamViewButton {
            
        } else if sender == self.statsViewButton {
            
        } else if sender == self.fieldViewButton {
            
        }
    }

//    /*
//     return self.matchDetail!.matchEventArray.filter({ (event: RGBYMatchEvent) -> Bool in
//        return RGBYEventType.scoreEvents.contains(event.eventType!)
//     }).count
//    */
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return RGBYDemoData.demoMatchEventList().count
//    }
//
//    /*
//
//    */
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: RGBYMatchEventCell.REUSE_IDENTIFIER)! as! RGBYMatchEventCell
//        let matchEvent = RGBYDemoData.demoMatchEventList()[indexPath.row]
//        if matchEvent.isMyTeam != nil && matchEvent.isMyTeam! {
//            cell.teamLabel.text = matchEvent.eventTableSummary()
//            cell.oppositionLabel.text = ""
//        } else {
//            cell.oppositionLabel.text = matchEvent.eventTableSummary()
//            cell.teamLabel.text = ""
//        }
//        if let type = matchEvent.eventType {
//            if type == .DROP_GOAL {
//                cell.eventIcon.image = UIImage(named: "DropGoalIcon")
//            } else if type == .KICK_AT_GOAL {
//                cell.eventIcon.image = UIImage(named: "KickAtGoalIcon")
//            } else if type == .TRY {
//                cell.eventIcon.image = UIImage(named: "TryIcon")
//            } else if type == .CONVERSION {
//                cell.eventIcon.image = UIImage(named: "KickAtGoalIcon")
//            } else if type == .PENALTY {
//                cell.eventIcon.image = UIImage(named: "PenaltyIcon")
//            }
//        }
//        return cell
//    }
}

//class RGBYMatchEventCell: UITableViewCell {
//
//    static var REUSE_IDENTIFIER = "rgbyMatchEventCell"
//
//    @IBOutlet weak var teamLabel: UILabel!
//    @IBOutlet weak var eventIcon: UIImageView!
//    @IBOutlet weak var oppositionLabel: UILabel!
//
//}
