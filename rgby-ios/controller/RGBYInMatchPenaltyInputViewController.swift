//
//  RGBYInMatchPenaltyInputViewController.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/14/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYInMatchPenaltyInputViewController: UIViewController {

    var loadingModalVC: UIViewController!
    var tapLocation: CGPoint?

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
    var playerButtonArray: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        print("RGBYInMatchIncidentViewController:: viewDidLoad");
        playerButtonArray = [
            playerButton1, playerButton2, playerButton3, playerButton4, playerButton5, playerButton6, playerButton7, playerButton8, playerButton9, playerButton10, playerButton11, playerButton12, playerButton13, playerButton14, playerButton15
        ]
        let currentTeam: [RGBYPlayer] = RGBYMatchDetail.sharedInstance.myTeamMatchDaySquad.listTeam
        for (index, player) in currentTeam.enumerated() {
            print("\(index + 1). \(player._firstName) \(player._lastName)")
            playerButtonArray[index].setTitle("\(index + 1). \(player._firstName) \(player._lastName)", for: .normal)
        }
    }

    @IBAction func handlePenalty(_ sender: UIButton) {
        // do other task
        print("RGBYInMatchPenaltyInputViewController:: penalty clicked")
        self.dismiss(animated: true, completion: nil)
        self.loadingModalVC.dismiss(animated: true, completion: nil)
        // check if the button is in the player button index and assume that it's the unknown player otherwise
        if let index = playerButtonArray.firstIndex(of: sender) {
            let player = RGBYMatchDetail.sharedInstance.myTeamMatchDaySquad.listTeam[index]
            let position = RGBYPlayerPosition.listTeamPositions[index]
            RGBYMatchDetail.sharedInstance.matchEventArray.append(RGBYMatchEvent(eventTime: 110, eventType: .PENALTY, fieldLocation: tapLocation!, subject: player, subjectPosition: position))
        } else {
            // handle NO PLAYER
            // TODO event time
            RGBYMatchDetail.sharedInstance.matchEventArray.append(RGBYMatchEvent(eventTime: 110, eventType: .PENALTY, fieldLocation: tapLocation!, subject: nil, subjectPosition: nil))
        }
    }

    @IBAction func handleGoBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


/*
 RGBYMatchDetail.sharedInstance.myTeamScore += 3
 RGBYMatchDetail.sharedInstance.matchEventArray.append(
 RGBYMatchEvent(
 eventTime: 114,
 eventType: .KICK_AT_GOAL,
 fieldLocation: CGPoint(x: 100, y: 100),
 subject: RGBYMatchDetail.sharedInstance.myTeamMatchDaySquad.looseHeadProp,
 subjectPosition: .LOOSE_HEAD_PROP))
 */
