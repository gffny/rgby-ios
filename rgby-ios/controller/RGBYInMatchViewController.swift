//
//  RGBYInGameViewController.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/9/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYInMatchViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var fieldView: UIImageView!
    @IBOutlet weak var scoreView: RGBYInMatchScoreView!
    var tapLocation: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("RGBYInGameViewController:: viewDidLoad");
        let fieldTap = UITapGestureRecognizer(target: self, action:  #selector (self.handleFieldTap (_:)))
        self.fieldView.addGestureRecognizer(fieldTap)
        self.scoreView.eventTableView.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(updateScoreDetail), name: .matchDetailDataUpdateNotification, object: nil)
        updateScoreDetail()
    }

    @objc func handleFieldTap(_ sender:UITapGestureRecognizer) {
        // do other task
        print("RGBYInGameViewController:: handleFieldTap")
        tapLocation = sender.location(in: self.fieldView)
        // record or pass the tap location to the next VC
        // create a view controller class for the match incident input
        performSegue(withIdentifier: "presentMatchIncidentInput", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is RGBYInMatchIncidentInputViewController {
            let vc = segue.destination as! RGBYInMatchIncidentInputViewController
            vc.tapLocation = self.tapLocation
        }
    }

    @objc private func updateScoreDetail() {
        scoreView.myTeamScoreLabel.text = String(RGBYMatchDetail.sharedInstance.myTeamScore)
        scoreView.oppositionTeamScoreLabel.text = String(RGBYMatchDetail.sharedInstance.oppositionTeamScore)
        scoreView.eventTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RGBYMatchDetail.sharedInstance.matchEventArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rgbyMatchEventCell")! as! RGBYMatchDetailTableViewCell
        cell.setData(matchEvent: RGBYMatchDetail.sharedInstance.matchEventArray[indexPath.row])
        return cell
    }
}
