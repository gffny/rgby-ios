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

    // CONTENT VIEW SPACE
    @IBOutlet weak var contentView: UIView!
    
    // FIELD VIEW HANDLES INPUT
    var fieldView: RGBYFieldView!
    var fieldTapLocation: CGPoint = CGPoint(x: 100, y: 100)

    private var matchDetail: RGBYMatchDetail = RGBYMatchDetail()
    // this will get overridden with handle touch
    var matchEvent: RGBYMatchEvent = RGBYMatchEvent(eventPeriod: 0, periodTimeInSec: 0, fieldLocation: CGPoint(x: 100, y: 100))

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
        self.loadFieldView()
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    // VIEW LOADING METHODS

    func loadFieldView() {
        self.fieldView = RGBYFieldView(frame: self.contentView.frame)
        // configure incidentTypeSelectView
        self.fieldView.frame = self.contentView.bounds
        self.fieldView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleFieldTap))
        tap.numberOfTapsRequired = 1
        self.fieldView.addGestureRecognizer(tap)
        self.fieldView.isUserInteractionEnabled = false
        self.contentView.addSubview(fieldView)
    }

    // BUSINESS LOGIC METHODS
    
    func handleEndOfMatch() {
        print("match has ended!")
    }

    @objc func handleFieldTap(sender: UITapGestureRecognizer) {
        print("RGBYInMatchViewController:: handleFieldTap")
        self.fieldTapLocation = sender.location(in: self.fieldView)
        // record or pass the tap location to the next VC
        // convert that to % x and % y
        let x = self.fieldTapLocation.x / self.fieldView.frame.width
        let y = self.fieldTapLocation.y / self.fieldView.frame.height
        self.fieldTapLocation = CGPoint(x: x, y: y)
        performSegue(withIdentifier: "presentMatchIncidentInput", sender: self)
    }

    
    // LOAD INCIDENT RECODING SUBVIEWS
    
    func showIncidentTypeSelectView() {
        // set the view label
        //self.incidentInputLabel.text = "Select Incident Type..."
        // add the incident type screen
        let incidentTypeSelectView = RGBYIncidentTypeSelectView(frame: self.contentView.frame)
        // configure incidentTypeSelectView
        incidentTypeSelectView.frame = self.contentView.bounds
        incidentTypeSelectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        incidentTypeSelectView.addTarget(self, action: #selector(handleIncidentTypeSelect), for: .valueChanged)
        self.contentView.addSubview(incidentTypeSelectView)
    }
    
    func showPenaltyTypeSelectView() {
        // set the view label
        //self.incidentInputLabel.text = "Select Penalty Type..."
        // add the penalty view
        let penaltyTypeSelectView = RGBYPenaltyTypeSelectView(frame: self.contentView.frame)
        penaltyTypeSelectView.frame = self.contentView.bounds
        penaltyTypeSelectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        penaltyTypeSelectView.addTarget(self, action: #selector(handlePenaltyTypeSelect), for: .valueChanged)
        self.contentView.addSubview(penaltyTypeSelectView)
    }
    
    func showFoulTypeSelectView() {
        // set the view label
        //self.incidentInputLabel.text = "Select Foul Type..."
        // add the foul view
        let foulTypeSelectView = RGBYFoulTypeSelectView(frame: self.contentView.frame)
        foulTypeSelectView.frame = self.contentView.bounds
        foulTypeSelectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        foulTypeSelectView.addTarget(self, action: #selector(handleFoulTypeSelect), for: .valueChanged)
        self.contentView.addSubview(foulTypeSelectView)
    }
    
    func showScoreTypeSelectView() {
        // set the view label
        //self.incidentInputLabel.text = "Select Score Type..."
        // add the score view
        let scoreTypeSelectView = RGBYScoreTypeSelectView(frame: self.contentView.frame)
        // configure incidentTypeSelectView
        scoreTypeSelectView.frame = self.contentView.bounds
        scoreTypeSelectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scoreTypeSelectView.addTarget(self, action: #selector(handleScoreTypeSelect), for: .valueChanged)
        self.contentView.addSubview(scoreTypeSelectView)
    }
    
    func showTurnOverTypeSelectView() {
        // set the view label
        //self.incidentInputLabel.text = "Select Turn Over Type..."
        // add the turn over view
        let turnOverTypeSelectView = RGBYTurnOverTypeSelectView(frame: self.contentView.frame)
        turnOverTypeSelectView.frame = self.contentView.bounds
        turnOverTypeSelectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        turnOverTypeSelectView.addTarget(self, action: #selector(handleTurnOverTypeSelect), for: .valueChanged)
        self.contentView.addSubview(turnOverTypeSelectView)
    }
    
    func showTeamSelectView() {
        // set the view label
        //self.incidentInputLabel.text = "Select Responsible Team..."
        // add the team select view
        let teamSelectView = RGBYTeamSelectView(frame: self.contentView.frame)
        teamSelectView.setTeamValues(team: self.matchDetail.match.team!, oppositionTeam: self.matchDetail.match.opposition)
        // configure incidentTypeSelectView
        teamSelectView.frame = self.contentView.bounds
        teamSelectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        teamSelectView.addTarget(self, action: #selector(handleTeamSelect), for: .valueChanged)
        self.contentView.addSubview(teamSelectView)
    }
    
    func showPlayerSelectView() {
        // set the view label
        //self.incidentInputLabel.text = "Select Responsible Player..."
        // add the player select view
        let playerSelectView = RGBYPlayerSelectView(frame: self.contentView.frame)
        if matchEvent.isMyTeam! {
            playerSelectView.setTeam(squad: matchEvent.team!)
        }
        playerSelectView.frame = self.contentView.bounds
        playerSelectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        playerSelectView.addTarget(self, action: #selector(handlePlayerSelect), for: .valueChanged)
        self.contentView.addSubview(playerSelectView)
    }
    
    // HANDLE INCIDENT TYPE RECORDING
    
    @objc func handleIncidentTypeSelect(_ sender: RGBYIncidentTypeSelectView) {
        print("RGBYInMatchIncidentViewController:: handleIncidentTypeSelect")
        sender.removeFromSuperview()
        if sender.selectedIncident == RGBYIncidentTypeSelectView.PENALTY {
            print("RGBYInMatchIncidentViewController - show penalty window")
            showPenaltyTypeSelectView()
        } else if sender.selectedIncident == RGBYIncidentTypeSelectView.FOUL {
            print("RGBYInMatchIncidentViewController - show foul window")
            showFoulTypeSelectView()
        } else if sender.selectedIncident == RGBYIncidentTypeSelectView.SCORE {
            print("RGBYInMatchIncidentViewController - show score window")
            showScoreTypeSelectView()
        } else if sender.selectedIncident == RGBYIncidentTypeSelectView.TURN_OVER {
            print("RGBYInMatchIncidentViewController - show turn over window")
            showTurnOverTypeSelectView()
        } else if sender.selectedIncident == RGBYIncidentTypeSelectView.TACKLE {
            print("RGBYInMatchIncidentViewController - show tackle window")
            self.matchEvent.eventType = RGBYEventType.MISSED_TACKLE
            showTeamSelectView()
        }
    }
    
    @objc func handlePenaltyTypeSelect(_ sender: RGBYPenaltyTypeSelectView) {
        print("RGBYInMatchIncidentViewController:: handlePenaltyTypeSelect")
        sender.removeFromSuperview()
        self.matchEvent.eventType = RGBYEventType.PENALTY
        self.matchEvent.additionalIncidentType = sender.selectedButton?.titleLabel?.text
        showTeamSelectView()
    }
    
    @objc func handleFoulTypeSelect(_ sender: RGBYFoulTypeSelectView) {
        print("RGBYInMatchIncidentViewController:: handleFoulTypeSelect")
        sender.removeFromSuperview()
        self.matchEvent.eventType = RGBYEventType.FOUL
        self.matchEvent.additionalIncidentType = sender.selectedButton?.titleLabel?.text
        showTeamSelectView()
    }
    
    @objc func handleTurnOverTypeSelect(_ sender: RGBYTurnOverTypeSelectView) {
        print("RGBYInMatchIncidentViewController:: handleTurnOverTypeSelect")
        sender.removeFromSuperview()
        switch sender.selectedButton?.titleLabel?.text {
        case RGBYTurnOverType.KICK_AWAY.displayTitle:
            self.matchEvent.eventType = RGBYEventType.KICK_FROM_PLAY
        case RGBYTurnOverType.TACKLE_HELD_UP.displayTitle:
            self.matchEvent.eventType = RGBYEventType.HELD_UP
        case RGBYTurnOverType.POACH.displayTitle:
            self.matchEvent.eventType = RGBYEventType.POACH
        case RGBYTurnOverType.TACKLE_TO_TOUCH.displayTitle:
            self.matchEvent.eventType = RGBYEventType.PLAYER_IN_TOUCH
        case .none:
            print("Turn over type is not valid")
        case .some(_):
            print("Turn over type is not valid")
        }
        showTeamSelectView()
    }
    
    @objc func handleTeamSelect(_ sender: RGBYTeamSelectView) {
        print("RGBYInMatchIncidentViewController:: handleTeamSelect")
        if (sender.isMyTeam) {
            self.matchEvent.team = self.matchDetail.match.matchDaySquad!
        }
        self.matchEvent.isMyTeam = sender.isMyTeam
        sender.removeFromSuperview()
        showPlayerSelectView()
    }
    
    @objc func handleScoreTypeSelect(_ sender: RGBYScoreTypeSelectView) {
        print("RGBYInMatchIncidentViewController:: handleScoreTypeSelect")
        // TODO handle the type correctly
        if (sender.selectedScoreType == RGBYScoreTypeSelectView.TRY) {
            self.matchEvent.eventType = .TRY
        } else if (sender.selectedScoreType == RGBYScoreTypeSelectView.CONVERSION) {
            self.matchEvent.eventType = .CONVERSION
        } else if (sender.selectedScoreType == RGBYScoreTypeSelectView.PENALTY) {
            self.matchEvent.eventType = .KICK_AT_GOAL
        } else if (sender.selectedScoreType == RGBYScoreTypeSelectView.DROP_GOAL) {
            self.matchEvent.eventType = .DROP_GOAL
        }
        sender.removeFromSuperview()
        showTeamSelectView()
    }
    
    @objc func handlePlayerSelect(_ sender: RGBYPlayerSelectView) {
        print("RGBYInMatchIncidentViewController:: handlePlayerSelect")
        self.matchEvent.subject = sender.selectedPlayer
        self.matchEvent.subjectPosition = sender.selectedPlayerPosition
        self.matchDetail.appendMatchEvent(newEvent: matchEvent)
        sender.removeFromSuperview()
    }
    
    @IBAction func handleCloseButton(_ sender: UIView) {
        print("RGBYInMatchIncidentViewController:: handleCloseButton")
        sender.removeFromSuperview()
    }

    // DELEGATE METHODS
    
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


    // TOUCH INTERACTIONS
    
    @IBAction func handleMenuClick(_ sender: UIButton) {
        if sender == self.clockFunctionButton && !self.matchDetail.hasPeriodStarted && !self.matchDetail.hasMatchEnded {
            // handle start
            self.matchDetail.startPeriod()
            self.fieldView.isUserInteractionEnabled = true
            // reset clock colour to black
            self.clockLabel.textColor = UIColor.black
            self.clockFunctionButton.setTitle("Tap: Pause\nDTap: End Half", for: .normal)
        } else if sender == self.clockFunctionButton && self.matchDetail.hasMatchEnded {
            // handle end of match - post data to REST service and return to main screen
            self.fieldView.isUserInteractionEnabled = false
            self.handleEndOfMatch()
        } else if sender == self.clockFunctionButton {
            // handle pause
            self.matchDetail.pauseResumePeriod()
            self.fieldView.isUserInteractionEnabled = true
            if self.matchDetail.isPeriodPaused {
                // onky append "paused" if the match isn't paused
                self.fieldView.isUserInteractionEnabled = false
                self.clockLabel.text = String("\(RGBYUtils.formatMatchClock(time: self.matchDetail.currentPeriodTimeInSec)) PAUSED")
            }
        } else if sender == self.teamViewButton {
            
        } else if sender == self.statsViewButton {
            
        } else if sender == self.fieldViewButton {
            
        } else {// long touch recogniser && double tap
            self.clockLabel.text = String("\(RGBYUtils.formatMatchClock(time: self.matchDetail.currentPeriodTimeInSec)) ENDED")
            self.matchDetail.stopPeriod()
            // handle button and clock label changes
            self.fieldView.isUserInteractionEnabled = false
            if self.matchDetail.hasMatchEnded {
                // 0. post data to REST service and return to main screen
                self.handleEndOfMatch()
            } else if self.matchDetail.currentPeriod == 1 {
                // 1. current period is 1 - display "start second half"
                self.clockFunctionButton.setTitle("Start 2nd Half", for: .normal)
            } else if (self.matchDetail.currentPeriod == 2 && !self.matchDetail.isExtraTimeRequired) || (self.matchDetail.currentPeriod > 2 && self.matchDetail.currentPeriod == (self.matchDetail.match.extraTimePeriods + 2)) {
                // 2. current period is 2 && no extra time - display "end match"
                // 5. current period is == number of extra time periods required - display "end match"
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is RGBYInMatchIncidentInputViewController {
            let destVC = segue.destination as! RGBYInMatchIncidentInputViewController
            destVC.setData(matchDetail: self.matchDetail, incidentFieldLocation: self.fieldTapLocation)
        }  else if segue.destination is RGBYInMatchFieldViewController {
            let destVC = segue.destination as! RGBYInMatchFieldViewController
            destVC.matchDetail = self.matchDetail
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
