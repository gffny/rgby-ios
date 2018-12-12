//
//  RGBYTeamSelectionViewController.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/4/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYMatchDaySquadSelectionViewController: UIViewController {
    
    @IBOutlet weak var selectionView: RGBYMatchDaySquadSelectionView!
    var team: RGBYTeam?
    var match: RGBYMatch?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        print("RGBYMatchDaySquadSelectionViewController:: viewDidLoad");
        // show the initial view - incident type input view
        self.selectionView.setMatchDayData(team: self.team!, match: self.match!)
        self.selectionView.doneButton.addTarget(self, action: #selector(handleSelectionCompletion), for: .touchUpInside)
    }

    func setMatchDayData(team: RGBYTeam, match: RGBYMatch) {
        self.team = team
        self.match = match
    }

    @objc func handleSelectionCompletion() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: RGBYInMatchViewController.IDENTIFIER) as! RGBYInMatchViewController
        vc.matchDetail = RGBYMatchDetail(match: self.match!, myMatchDaySquad: self.selectionView.matchDaySquad(), oppMatchDaySquad: RGBYMatchDaySquad(match: self.match!, team: self.match!.homeTeam!))
        present(vc, animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // save team selection
        
    }
}
