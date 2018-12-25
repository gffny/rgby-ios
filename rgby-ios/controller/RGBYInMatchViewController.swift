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

class RGBYInMatchViewController: UIViewController, RGBYMatchDetailDelegate {

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
        self.matchDetail = RGBYMatchDetail(match: match)
        self.matchDetail.matchDetailDelegate = self
        // set the initial clock value
        self.periodLabel.text = String("1H")
        self.clockLabel.text = String("Not Started")
        // set the initial scoreboard values
        self.teamScore.text = String("0")
        self.oppositionScore.text = String("0")
        // set the clock button handlers
        self.clockFunctionButton.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleMenuClick)))
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleMenuClick))
        tapGR.numberOfTapsRequired = 2
        self.clockFunctionButton.addGestureRecognizer(tapGR)
        self.clockFunctionButton.setTitle("Start Match", for: .normal)
        //TODO maybe have a reset half time function
        // swipe left to reset half
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    func periodUpdated() {
        self.periodLabel.text = RGBYUtils.formatMatchPeriod(period: self.matchDetail.currentPeriod)
    }

    func periodTimeUpdated() {
        if self.matchDetail.isAddedTime {
            // the period is in overtime, change the clock colour
            self.clockLabel.textColor = UIColor.red
        }
        self.clockLabel.text = String("\(RGBYUtils.formatMatchClock(time: self.matchDetail.currentPeriodTimeInSec))")
    }

    func matchScoreUpdated() {
        self.teamScore.text = "\(self.matchDetail.teamScore)"
        self.oppositionScore.text = "\(self.matchDetail.oppositionScore)"
    }
    
    func handleEndOfMatch() {
        print("match has ended!")
    }

    @IBAction func handleMenuClick(_ sender: UIButton) {
        if sender == self.clockFunctionButton && !self.matchDetail.hasPeriodStarted && !self.matchDetail.hasMatchEnded {
            // handle start
            self.matchDetail.startPeriod()
            // reset clock colour to black
            self.clockLabel.textColor = UIColor.black
            self.clockFunctionButton.setTitle("Tap: Pause\nDTap: End Half", for: .normal)
        } else if sender == self.clockFunctionButton && self.matchDetail.hasMatchEnded {
            // handle end of match - post data to REST service and return to main screen
            self.handleEndOfMatch()
        } else if sender == self.clockFunctionButton {
            // handle pause
            self.matchDetail.pauseResumePeriod()
            if self.matchDetail.isPeriodPaused {
                // onky append "paused" if the match isn't paused
                self.clockLabel.text = String("\(RGBYUtils.formatMatchClock(time: self.matchDetail.currentPeriodTimeInSec)) PAUSED")
            }
        } else if sender == self.teamViewButton {
            
        } else if sender == self.statsViewButton {
            
        } else if sender == self.fieldViewButton {
            
        } else {// long touch recogniser && double tap
            self.clockLabel.text = String("\(RGBYUtils.formatMatchClock(time: self.matchDetail.currentPeriodTimeInSec)) ENDED")
            self.matchDetail.stopPeriod()
            // handle button and clock label changes
            if self.matchDetail.hasMatchEnded {
                // 0. post data to REST service and return to main screen
                self.handleEndOfMatch()
            } else if self.matchDetail.currentPeriod == 1 {
                // 1. current period is 1 - display "start second half"
                self.clockFunctionButton.setTitle("Start 2nd Half", for: .normal)
            } else if (self.matchDetail.currentPeriod == 2 && !self.matchDetail.isExtraTimeRequired) || (self.matchDetail.currentPeriod > 2 && self.matchDetail.currentPeriod == (self.matchDetail.match.extraTimePeriods + 2)) {
                // 2. current period is 2 && no extra time - display "end match"
                //  5. current period is == number of extra time periods required - display "end match"
                self.clockFunctionButton.setTitle("End Match", for: .normal)
                self.matchDetail.hasMatchEnded = true
            } else if self.matchDetail.currentPeriod == 2 && self.matchDetail.isExtraTimeRequired {
                // 3. current period is 2 && extra time is needed - display "start extra time"
                self.clockFunctionButton.setTitle("Start Extra Time", for: .normal)
            } else if self.matchDetail.currentPeriod > 2 && self.matchDetail.currentPeriod < (self.matchDetail.match.extraTimePeriods + 2) {
                // 4. current period is > 2 && < # extra time periods required - display "start .. period of extra time
                let nextPeriod = self.matchDetail.currentPeriod - 1 // current period 3 is 1st extra time
                if [1, 11].contains(nextPeriod) {
                    self.clockFunctionButton.setTitle("Start \(nextPeriod)st Extra Time", for: .normal)
                } else if [2, 12].contains(nextPeriod) {
                    self.clockFunctionButton.setTitle("Start \(nextPeriod)nd Extra Time", for: .normal)
                } else if 3 == nextPeriod {
                    self.clockFunctionButton.setTitle("Start \(nextPeriod)rd Extra Time", for: .normal)
                } else {
                    self.clockFunctionButton.setTitle("Start \(nextPeriod)th Extra Time", for: .normal)
                }
            }
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
