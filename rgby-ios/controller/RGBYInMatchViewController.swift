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

    @IBOutlet weak var teamAName: UILabel!
    @IBOutlet weak var teamAScore: UILabel!
    @IBOutlet weak var teamBName: UILabel!
    @IBOutlet weak var teamBScore: UILabel!
    @IBOutlet weak var fieldView: RGBYFieldView!
    @IBOutlet weak var scoreView: RGBYInMatchScoreView!
    @IBOutlet weak var matchClock: RGBYMatchClock!

    var matchDetail: RGBYMatchDetail = RGBYDemoData.demoMatchDetail
    var fieldTapLocation: CGPoint = CGPoint(x: 100, y: 100)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("RGBYInGameViewController:: viewDidLoad");
        let fieldTap = UITapGestureRecognizer(target: self, action: #selector(handleFieldTap))
        self.fieldView.addGestureRecognizer(fieldTap)
        self.fieldView.modeSwitch.addTarget(self, action: #selector(handleModeSwitch), for: .touchUpInside)
        self.scoreView.eventTableView.dataSource = self
        self.matchDetail = RGBYDemoData.demoMatchDetail
        self.matchDetail.delegate = self
        self.teamAName.text = self.matchDetail.myMatchDaySquad.team.shortTitle
        self.teamBName.text = self.matchDetail.oppMatchDaySquad.team.shortTitle
        matchScoreUpdated()
        setupMatchClock()
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
        // convert that to % x and % y
        let x = self.fieldTapLocation.x / self.fieldView.frame.width
        let y = self.fieldTapLocation.y / self.fieldView.frame.height
        self.fieldTapLocation = CGPoint(x: x, y: y)
        performSegue(withIdentifier: "presentMatchIncidentInput", sender: self)
    }

    @IBAction func handleModeSwitch(_ sender: Any) {
        print("RGBYInMatchFieldViewController:: present mode switch")
        performSegue(withIdentifier: "presentModeSwitch", sender: self)
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
        if self.matchDetail.currentPeriod < 3 {
            self.matchClock.setClockText(text: String("\(RGBYUtils.formatMatchClock(time: self.matchDetail.currentPeriodTimeInSec))"))
        }
    }

    func matchScoreUpdated() {
        self.teamAScore.text = String(self.matchDetail.myTeamScore)
        self.teamBScore.text = String(self.matchDetail.oppTeamScore)
        self.fieldView.updateEventArray(matchEventArray: self.matchDetail.matchEventArray)
        self.scoreView.eventTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.matchDetail.matchEventArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rgbyMatchEventCell")! as! RGBYMatchDetailTableViewCell
        cell.setData(matchEvent: self.matchDetail.matchEventArray[indexPath.row])
        return cell
    }
}
