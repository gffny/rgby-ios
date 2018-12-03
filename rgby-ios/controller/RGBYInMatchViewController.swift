//
//  RGBYInGameViewController.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/9/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYInMatchViewController: UIViewController, UITableViewDataSource, RGBYMatchDetailTimerDelegate {

    private static var CLOCK_START_MATCH = "Start Match"
    private static var CLOCK_SECOND_HALF = "Start 2nd Half"
    
    @IBOutlet weak var fieldView: UIImageView!
    @IBOutlet weak var scoreView: RGBYInMatchScoreView!
    @IBOutlet weak var matchClock: RGBYMatchClock!
    var matchDetail: RGBYMatchDetail = RGBYDemoData.demoMatchDetail
    var fieldTapLocation: CGPoint = CGPoint(x: 100, y: 100)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("RGBYInGameViewController:: viewDidLoad");
        let fieldTap = UITapGestureRecognizer(target: self, action:  #selector (self.handleFieldTap (_:)))
        self.fieldView.addGestureRecognizer(fieldTap)
        self.scoreView.eventTableView.dataSource = self
        self.matchDetail = RGBYDemoData.demoMatchDetail
        self.matchDetail.delegate = self
        setupMatchClock()
        NotificationCenter.default.addObserver(self, selector: #selector(updateScoreDetail), name: .matchDetailDataUpdateNotification, object: nil)
    }

    @objc func handleClockAction(_ sender:RGBYMatchClock) {
        // if clock is "start match"
        if sender.clockActionButton.titleLabel?.text == RGBYInMatchViewController.CLOCK_START_MATCH {
            self.matchDetail.startPeriod()
        } else if sender.clockActionButton.titleLabel?.text == RGBYInMatchViewController.CLOCK_SECOND_HALF {
            self.matchDetail.startPeriod()
        } else {
            self.matchDetail.stopPeriod()
            if self.matchDetail.currentPeriod == 1 {
                sender.setClockText(text: RGBYInMatchViewController.CLOCK_SECOND_HALF)
            }
        }
    }

    @objc func handleFieldTap(_ sender:UITapGestureRecognizer) {
        // do other task
        print("RGBYInGameViewController:: handleFieldTap")
        self.fieldTapLocation = sender.location(in: self.fieldView)
        // record or pass the tap location to the next VC
        // create a view controller class for the match incident input
        performSegue(withIdentifier: "presentMatchIncidentInput", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is RGBYInMatchIncidentInputViewController {
            let destVC = segue.destination as! RGBYInMatchIncidentInputViewController
            destVC.setData(matchDetail: self.matchDetail, incidentFieldLocation: self.fieldTapLocation)
        }
    }

    func setupMatchClock() {
        self.matchClock.addTarget(self, action: #selector(handleClockAction), for: .valueChanged)
        self.matchClock.setClockText(text: RGBYInMatchViewController.CLOCK_START_MATCH)
    }

    func periodTimerUpdated() {
        if matchDetail.currentPeriod < 3 {
            self.matchClock.setClockText(text: String("\(matchDetail.currentPeriod)H \(formatMatchClock(time: matchDetail.currentPeriodTimeInSec))"))
        } // TODO handle no 1st/2nd half times
    }
    
    private func formatMatchClock(time: Int) -> String {
        let minutes = Int(round(Double(time/60)))
        let seconds = time % 60
        if minutes < 10 && seconds < 10 {
            return String("0\(minutes):0\(seconds)")
        } else if minutes < 10 {
            return String("0\(minutes):\(seconds)")
        } else {
            return String("\(minutes):\(seconds)")
        }
    }

    @objc private func updateScoreDetail() {
        scoreView.myTeamScoreLabel.text = String(matchDetail.myTeamScore)
        scoreView.oppositionTeamScoreLabel.text = String(matchDetail.oppTeamScore)
        scoreView.eventTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchDetail.matchEventArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rgbyMatchEventCell")! as! RGBYMatchDetailTableViewCell
        cell.setData(matchEvent: matchDetail.matchEventArray[indexPath.row])
        return cell
    }
}
