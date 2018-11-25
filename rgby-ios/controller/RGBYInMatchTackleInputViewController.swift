//
//  RGBYInMatchTackleInputViewController.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/24/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYInMatchTackleInputViewController:  UIViewController {

    @IBOutlet weak var teamListView: RGBYTeamListView!

    override func viewDidLoad() {
        super.viewDidLoad()
        teamListView.setTeam(squad: RGBYMatchDetail.sharedInstance.myTeamMatchDaySquad)
    }

    @IBAction func handlePlayerSelected(_ sender: RGBYTeamListView) {
        if let playerValue = sender.selectedPlayer {
            print(playerValue._squadNumber)
        }
    }
}
