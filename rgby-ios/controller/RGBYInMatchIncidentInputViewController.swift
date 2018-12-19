//
//  RGBYInMatchIncidentViewController.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/14/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYInMatchIncidentInputViewController: UIViewController  {

    @IBOutlet weak var incidentInputLabel: UILabel!
    @IBOutlet weak var containerView: UIView!

    var matchEvent: RGBYMatchEvent
    var match: RGBYMatch?
    var matchDetail: RGBYMatchDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        print("RGBYInMatchIncidentViewController:: viewDidLoad");
        // show the initial view - incident type input view
        showIncidentTypeSelectView()
    }

    required init?(coder aDecoder: NSCoder) {
        self.matchEvent = RGBYMatchEvent(eventPeriod: 0, periodTimeInSec: 0, fieldLocation: CGPoint(x:100, y:100))
        super.init(coder: aDecoder)
    }

    func setData(matchDetail: RGBYMatchDetail, incidentFieldLocation: CGPoint) {
        self.matchDetail = matchDetail
        self.match = matchDetail.match
        self.matchEvent = RGBYMatchEvent(eventPeriod: matchDetail.currentPeriod, periodTimeInSec: matchDetail.currentPeriodTimeInSec, fieldLocation: incidentFieldLocation)
    }

    func showIncidentTypeSelectView() {
        // set the view label
        self.incidentInputLabel.text = "Select Incident Type..."
        // add the incident type screen
        let incidentTypeSelectView = RGBYIncidentTypeSelectView(frame: containerView.frame)
        // configure incidentTypeSelectView
        incidentTypeSelectView.frame = containerView.bounds
        incidentTypeSelectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        incidentTypeSelectView.addTarget(self, action: #selector(handleIncidentTypeSelect), for: .valueChanged)
        containerView.addSubview(incidentTypeSelectView)
    }
    
    func showPenaltyTypeSelectView() {
        // set the view label
        self.incidentInputLabel.text = "Select Penalty Type..."
        // add the penalty view
        let penaltyTypeSelectView = RGBYPenaltyTypeSelectView(frame: containerView.frame)
        penaltyTypeSelectView.frame = containerView.bounds
        penaltyTypeSelectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        penaltyTypeSelectView.addTarget(self, action: #selector(handlePenaltyTypeSelect), for: .valueChanged)
        containerView.addSubview(penaltyTypeSelectView)
    }

    func showFoulTypeSelectView() {
        // set the view label
        self.incidentInputLabel.text = "Select Foul Type..."
        // add the foul view
        let foulTypeSelectView = RGBYFoulTypeSelectView(frame: containerView.frame)
        foulTypeSelectView.frame = containerView.bounds
        foulTypeSelectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        foulTypeSelectView.addTarget(self, action: #selector(handleFoulTypeSelect), for: .valueChanged)
        containerView.addSubview(foulTypeSelectView)
    }

    func showScoreTypeSelectView() {
        // set the view label
        self.incidentInputLabel.text = "Select Score Type..."
        // add the score view
        let scoreTypeSelectView = RGBYScoreTypeSelectView(frame: containerView.frame)
        // configure incidentTypeSelectView
        scoreTypeSelectView.frame = containerView.bounds
        scoreTypeSelectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scoreTypeSelectView.addTarget(self, action: #selector(handleScoreTypeSelect), for: .valueChanged)
        containerView.addSubview(scoreTypeSelectView)
    }
    
    func showTurnOverTypeSelectView() {
        // set the view label
        self.incidentInputLabel.text = "Select Turn Over Type..."
        // add the turn over view
        let turnOverTypeSelectView = RGBYTurnOverTypeSelectView(frame: containerView.frame)
        turnOverTypeSelectView.frame = containerView.bounds
        turnOverTypeSelectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        turnOverTypeSelectView.addTarget(self, action: #selector(handleTurnOverTypeSelect), for: .valueChanged)
        containerView.addSubview(turnOverTypeSelectView)
    }

    func showTeamSelectView() {
        // set the view label
        self.incidentInputLabel.text = "Select Responsible Team..."
        // add the team select view
        let teamSelectView = RGBYTeamSelectView(frame: containerView.frame)
        teamSelectView.setTeamValues(team: match!.team!, oppositionTeam: match!.opposition)
        // configure incidentTypeSelectView
        teamSelectView.frame = containerView.bounds
        teamSelectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        teamSelectView.addTarget(self, action: #selector(handleTeamSelect), for: .valueChanged)
        containerView.addSubview(teamSelectView)
    }

    func showPlayerSelectView() {
        // set the view label
        self.incidentInputLabel.text = "Select Responsible Player..."
        // add the player select view
        let playerSelectView = RGBYPlayerSelectView(frame: containerView.frame)
        if matchEvent.isMyTeam! {
            playerSelectView.setTeam(squad: matchEvent.team!)
        }
        playerSelectView.frame = containerView.bounds
        playerSelectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        playerSelectView.addTarget(self, action: #selector(handlePlayerSelect), for: .valueChanged)
        containerView.addSubview(playerSelectView)
    }

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
            self.matchEvent.team = self.match!.matchDaySquad
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
        self.matchDetail?.appendMatchEvent(newEvent: matchEvent)
        self.dismiss(animated: true)
    }

    @IBAction func handleCloseButton(_ sender: Any) {
        print("RGBYInMatchIncidentViewController:: handleCloseButton")
        self.dismiss(animated: true)
    }
}
