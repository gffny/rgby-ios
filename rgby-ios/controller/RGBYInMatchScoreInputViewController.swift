//
//  RGBYInMatchScoreInputViewController.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/21/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYInMatchScoreInputViewContoller: UIViewController {

    var loadingModalVC: UIViewController!
    var tapLocation: CGPoint?

    @IBOutlet weak var forToggleButton: UIButton!
    @IBOutlet weak var againstToggleButton: UIButton!

    @IBOutlet weak var tryToggleButton: UIButton!
    @IBOutlet weak var convToggleButton: UIButton!
    @IBOutlet weak var penaltyToggleButton: UIButton!
    @IBOutlet weak var dropGoalToggleButton: UIButton!
    
    @IBOutlet weak var playerButton1: UIButton!
    @IBOutlet weak var playerButton2: UIButton!
    @IBOutlet weak var playerButton3: UIButton!
    @IBOutlet weak var playerButton4: UIButton!
    @IBOutlet weak var playerButton5: UIButton!
    @IBOutlet weak var playerButton6: UIButton!
    @IBOutlet weak var playerButton7: UIButton!
    @IBOutlet weak var playerButton8: UIButton!
    @IBOutlet weak var playerButton9: UIButton!
    @IBOutlet weak var playerButton10: UIButton!
    @IBOutlet weak var playerButton11: UIButton!
    @IBOutlet weak var playerButton12: UIButton!
    @IBOutlet weak var playerButton13: UIButton!
    @IBOutlet weak var playerButton14: UIButton!
    @IBOutlet weak var playerButton15: UIButton!
    
    //TODO Turn this ^^ into a UIView with it's own action
    
    var playerButtonArray: [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        print("RGBYInMatchIncidentViewController:: viewDidLoad");
        playerButtonArray = [
            playerButton1, playerButton2, playerButton3, playerButton4, playerButton5, playerButton6, playerButton7, playerButton8, playerButton9, playerButton10, playerButton11, playerButton12, playerButton13, playerButton14, playerButton15
        ]
        displayHomeTeam()
    }
    
    func displayHomeTeam() {
        let currentTeam: [RGBYPlayer] = RGBYMatchDetail.sharedInstance.myTeamMatchDaySquad.listTeam
        for (index, player) in currentTeam.enumerated() {
            playerButtonArray[index].setTitle("\(index + 1). \(player._firstName) \(player._lastName)", for: .normal)
        }
    }

    func displayAwayTeam() {
        for (index, position) in RGBYPlayerPosition.listTeamPositions.enumerated() {
            playerButtonArray[index].setTitle("\(index + 1). \(position.displayName)", for: .normal)
        }
    }

    @IBAction func handleGoBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func handleScore(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        self.loadingModalVC.dismiss(animated: true, completion: nil)
        
        // TODO event time
    
        var player: RGBYPlayer? = nil
        var position: RGBYPlayerPosition? = nil
        var eventType: RGBYEventType = .TRY
        // check if the button is in the player button index and assume that it's the unknown player otherwise
        if let index = playerButtonArray.firstIndex(of: sender) {
            player = RGBYMatchDetail.sharedInstance.myTeamMatchDaySquad.listTeam[index]
            position = RGBYPlayerPosition.listTeamPositions[index]
        }
        if tryToggleButton.isSelected {
            eventType = .TRY
            //TODO handle this in the RGBYMatchDetail...append that's called below
            if forToggleButton.isSelected {
                RGBYMatchDetail.sharedInstance.myTeamScore += 5
            } else {
                RGBYMatchDetail.sharedInstance.oppositionTeamScore += 5
            }
        } else if convToggleButton.isSelected {
            eventType = .CONVERSION
            if forToggleButton.isSelected {
                RGBYMatchDetail.sharedInstance.myTeamScore += 2
            } else {
                RGBYMatchDetail.sharedInstance.oppositionTeamScore += 2
            }
        } else if penaltyToggleButton.isSelected {
            eventType = .KICK_AT_GOAL
            if forToggleButton.isSelected {
                RGBYMatchDetail.sharedInstance.myTeamScore += 3
            } else {
                RGBYMatchDetail.sharedInstance.oppositionTeamScore += 3
            }
        } else if dropGoalToggleButton.isSelected {
            eventType = .DROP_GOAL
            if forToggleButton.isSelected {
                RGBYMatchDetail.sharedInstance.myTeamScore += 3
            } else {
                RGBYMatchDetail.sharedInstance.oppositionTeamScore += 3
            }
        }
        RGBYMatchDetail.sharedInstance.matchEventArray.append(RGBYMatchEvent(eventTime: 110, eventType: eventType, fieldLocation: tapLocation!, subject: player, subjectPosition: position))
    }

    @IBAction func toggleForAgainst(_ sender: UIButton) {
        if sender == forToggleButton {
            forToggleButton.isSelected = true
            againstToggleButton.isSelected = false
            displayHomeTeam()
        } else {
            forToggleButton.isSelected = false
            againstToggleButton.isSelected = true
            displayAwayTeam()
        }
    }

    @IBAction func toggleScoreType(_ sender: UIButton) {
        if sender == tryToggleButton {
            tryToggleButton.isSelected = true
            convToggleButton.isSelected = false
            penaltyToggleButton.isSelected = false
            dropGoalToggleButton.isSelected = false
        } else if sender == convToggleButton {
            tryToggleButton.isSelected = false
            convToggleButton.isSelected = true
            penaltyToggleButton.isSelected = false
            dropGoalToggleButton.isSelected = false
        } else if sender == penaltyToggleButton {
            tryToggleButton.isSelected = false
            convToggleButton.isSelected = false
            penaltyToggleButton.isSelected = true
            dropGoalToggleButton.isSelected = false
        } else {
            tryToggleButton.isSelected = false
            convToggleButton.isSelected = false
            penaltyToggleButton.isSelected = false
            dropGoalToggleButton.isSelected = true
        }
    }
}
