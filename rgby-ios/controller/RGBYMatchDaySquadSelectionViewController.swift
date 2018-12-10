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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        print("RGBYInMatchIncidentViewController:: viewDidLoad");
        // show the initial view - incident type input view
        self.selectionView.setMatchDayData(team: RGBYDemoData.demoTeam, match: RGBYDemoData.demoMatch)
        self.selectionView.doneButton.addTarget(self, action: #selector(handleSelectionCompletion), for: .touchUpInside)
    }

    @objc func handleSelectionCompletion() {
        
        let alertController = UIAlertController(title: "Team Selected!", message: "User please check out this method", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
