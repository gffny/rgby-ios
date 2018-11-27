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
    var matchEvent: RGBYMatchEvent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        print("RGBYInMatchIncidentViewController:: viewDidLoad");
        // show the initial view - incident type input view
        showIncidentTypeSelectView()
    }

    func showIncidentTypeSelectView() {
        // add the incident type screen
        let incidentTypeSelectView = RGBYIncidentTypeSelectView(frame: containerView.frame)
        // configure incidentTypeSelectView
        incidentTypeSelectView.frame = containerView.bounds
        incidentTypeSelectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        incidentTypeSelectView.addTarget(self, action: #selector(handleIncidentTypeSelect), for: .valueChanged)
        containerView.addSubview(incidentTypeSelectView)
    }

    func showTeamSelectView() {
        let teamSelectView = RGBYTeamSelectView(frame: containerView.frame)
        teamSelectView.setTeamValues(myTeam: RGBYMatchDetail.sharedInstance.myTeamMatchDaySquad, oppositionTeam: RGBYMatchDetail.sharedInstance.oppositionTeamMatchDaySquad)
        // configure incidentTypeSelectView
        teamSelectView.frame = containerView.bounds
        teamSelectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        teamSelectView.addTarget(self, action: #selector(handleTeamSelect), for: .valueChanged)
        containerView.addSubview(teamSelectView)
    }

    func showScoreTypeSelectView() {
        let scoreTypeSelectView = RGBYScoreTypeSelectView(frame: containerView.frame)
        // configure incidentTypeSelectView
        scoreTypeSelectView.frame = containerView.bounds
        scoreTypeSelectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scoreTypeSelectView.addTarget(self, action: #selector(handleScoreTypeSelect), for: .valueChanged)
        containerView.addSubview(scoreTypeSelectView)
    }

    func showPlayerSelectView() {
        let playerSelectView = RGBYPlayerSelectView(frame: containerView.frame)
        playerSelectView.setTeam(squad: (matchEvent?._team)!)
        playerSelectView.frame = containerView.bounds
        playerSelectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        playerSelectView.addTarget(self, action: #selector(handlePlayerSelect), for: .valueChanged)
        containerView.addSubview(playerSelectView)
    }

    @objc func handleIncidentTypeSelect(_ sender: RGBYIncidentTypeSelectView) {
        print("RGBYInMatchIncidentViewController:: handleInputTypeSelect")
        sender.removeFromSuperview()
        if sender.selectedIncident == RGBYIncidentTypeSelectView.PENALTY {
            print("RGBYInMatchIncidentViewController - show penalty window")
            //showTeamSelectView()
        } else if sender.selectedIncident == RGBYIncidentTypeSelectView.FOUL {
            print("RGBYInMatchIncidentViewController - show foul window")
        } else if sender.selectedIncident == RGBYIncidentTypeSelectView.SCORE {
            print("RGBYInMatchIncidentViewController - show score window")
            showScoreTypeSelectView()
        } else if sender.selectedIncident == RGBYIncidentTypeSelectView.TURN_OVER {
            print("RGBYInMatchIncidentViewController - show turn over window")
        } else if sender.selectedIncident == RGBYIncidentTypeSelectView.TACKLE {
            print("RGBYInMatchIncidentViewController - show tackle window")
        } else if sender.selectedIncident == RGBYIncidentTypeSelectView.GO_BACK {
            print("RGBYInMatchIncidentViewController - show go back window")
            self.dismiss(animated: true)
        }
    }

    @objc func handleTeamSelect(_ sender: RGBYTeamSelectView) {
        print("RGBYInMatchIncidentViewController:: handleTeamSelect")
        if sender.goBackSelected {
            self.dismiss(animated: true)
        } else {
            matchEvent?._team = sender.selectedTeam
            sender.removeFromSuperview()
            showPlayerSelectView()
        }
    }

    @objc func handleScoreTypeSelect(_sender: RGBYScoreTypeSelectView) {
        print("RGBYInMatchIncidentViewController:: handleScoreTypeSelect")
        // TODO handle the type correctly
        matchEvent?._eventType = .KICK_AT_GOAL
        showTeamSelectView()
    }

    @objc func handlePlayerSelect(_ sender: RGBYPlayerSelectView) {
        print("RGBYInMatchIncidentViewController:: handlePlayerSelect")
        matchEvent?._subject = sender.selectedPlayer
        RGBYMatchDetail.sharedInstance.matchEventArray.append(matchEvent!)
        self.dismiss(animated: true)
    }
}
