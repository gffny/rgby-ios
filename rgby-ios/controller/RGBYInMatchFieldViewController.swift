//
//  RGBYInMatchFieldViewController.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/2/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYInMatchFieldViewController: UIViewController, RGBYMatchDetailTimerDelegate {

    private static var CLOCK_START_MATCH = "Start Match"
    private static var CLOCK_SECOND_HALF = "Start 2nd Half"

    @IBOutlet weak var fieldView: RGBYFieldView!
    @IBOutlet weak var teamAName: UILabel!
    @IBOutlet weak var teamAScore: UILabel!
    @IBOutlet weak var matchClock: RGBYMatchClock!
    @IBOutlet weak var teamBScore: UILabel!
    @IBOutlet weak var teamBName: UILabel!

    var matchDetail: RGBYMatchDetail?
    var fieldTapLocation: CGPoint = CGPoint(x: 100, y: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("RGBYInGameViewController:: viewDidLoad");
        let fieldTap = UITapGestureRecognizer(target: self, action: #selector(handleFieldTap))
        self.fieldView.addGestureRecognizer(fieldTap)
        self.fieldView.modeSwitch.addTarget(self, action: #selector(handleModeSwitch), for: .touchUpInside)
        self.matchDetail!.delegate = self
        self.teamAName.text = self.matchDetail!.match.team!.shortTitle
        self.teamBName.text = self.matchDetail!.match.opposition!.shortTitle
        matchScoreUpdated()
        setupMatchClock()
    }

    func setupMatchClock() {
        self.matchClock.addTarget(self, action: #selector(handleClockAction), for: .valueChanged)
        self.matchClock.setClockText(text: RGBYInMatchFieldViewController.CLOCK_START_MATCH)
    }

    @objc func handleClockAction(_ sender:RGBYMatchClock) {
        // if clock is "start match"
        if sender.clockActionButton.titleLabel?.text == RGBYInMatchFieldViewController.CLOCK_START_MATCH {
            self.matchDetail!.startPeriod()
        } else if sender.clockActionButton.titleLabel?.text == RGBYInMatchFieldViewController.CLOCK_SECOND_HALF {
            self.matchDetail!.startPeriod()
        } else {
            self.matchDetail!.stopPeriod()
            if self.matchDetail!.currentPeriod == 1 {
                sender.setClockText(text: RGBYInMatchFieldViewController.CLOCK_SECOND_HALF)
            }
        }
    }

    func matchScoreUpdated() {
        self.teamAScore.text = String(self.matchDetail!.myTeamScore)
        self.teamBScore.text = String(self.matchDetail!.oppTeamScore)
        self.fieldView.updateEventArray(matchEventArray: self.matchDetail!.matchEventArray)
    }

    @objc func handleFieldTap(_ sender:UITapGestureRecognizer) {
        // do other task
        print("RGBYInGameViewController:: handleFieldTap")
        self.fieldTapLocation = sender.location(in: self.fieldView)
        // convert that to % x and % y
        let x = self.fieldTapLocation.x / self.fieldView.frame.width
        let y = self.fieldTapLocation.y / self.fieldView.frame.height
        self.fieldTapLocation = CGPoint(x: x, y: y)
        performSegue(withIdentifier: "presentMatchIncidentInput", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is RGBYInMatchIncidentInputViewController {
            let destVC = segue.destination as! RGBYInMatchIncidentInputViewController
            destVC.setData(matchDetail: self.matchDetail!, incidentFieldLocation: self.fieldTapLocation)
        } else if segue.destination is RGBYInMatchViewController {
            let destVC = segue.destination as! RGBYInMatchViewController
            destVC.matchDetail = self.matchDetail
        }
    }

    @IBAction func handleModeSwitch(_ sender: Any) {
        print("RGBYInMatchFieldViewController:: present mode switch")
        performSegue(withIdentifier: "presentModeSwitch", sender: self)
    }

    func periodTimerUpdated() {
        if self.matchDetail!.currentPeriod < 3 {
            self.matchClock.setClockText(text: String("\(RGBYUtils.formatMatchClock(time: matchDetail!.currentPeriodTimeInSec))"))
        }
    }
}
