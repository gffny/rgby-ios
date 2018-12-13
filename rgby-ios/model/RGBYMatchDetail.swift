//
//  RGBYMatchDetail.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/14/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation
import CoreGraphics

class RGBYMatchDetail: NSObject {

    var match: RGBYMatch

    var delegate: RGBYMatchDetailTimerDelegate?
    private var _currentPeriod: Int = 0 // 1 = 1st half, 2 = 2nd half, 3 = 1st half extra time...
    private var _periodTimer: Timer? // reset to zero at the start of each period
    private var _currentPeriodTimeInSec: Int = 0
    private var _myTeamScore: Int = 0
    private var _oppTeamScore: Int = 0
    private var _matchEventArray = [RGBYMatchEvent]()

    init(match: RGBYMatch) {
        self.match = match
    }

    var myTeamScore: Int {
        get {
            return self._myTeamScore
        }
    }

    var oppTeamScore: Int {
        get {
            return self._oppTeamScore
        }
    }

    var matchEventArray: [RGBYMatchEvent] {
        get {
            return self._matchEventArray
        }
    }

    func appendMatchEvent(newEvent: RGBYMatchEvent) {
        _matchEventArray.append(newEvent)
        if newEvent.eventType == nil {
            // this is in error
            print("event should not have an empty event type")
        } else if RGBYEventType.scoreEvents.contains(newEvent.eventType!) {
            // add score to the correct team
            if newEvent.isMyTeam! {
                self._myTeamScore += (newEvent.eventType?.eventScoreValue)!
            } else {
                self._oppTeamScore += (newEvent.eventType?.eventScoreValue)!
            }
        }
        NotificationCenter.default.post(name: .matchDetailDataUpdateNotification, object: nil)
        delegate?.matchScoreUpdated()
    }

    func startPeriod() {
        self._currentPeriod += 1
        self._periodTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updatePeriodTimer), userInfo: nil, repeats: true)
    }

    func stopPeriod() {
        self._periodTimer?.invalidate()
    }

    @objc func updatePeriodTimer() {
        self._currentPeriodTimeInSec += 1
        delegate?.periodTimerUpdated()
    }

    var currentPeriod:Int {
        get {
            return self._currentPeriod
        }
    }

    var currentPeriodTimeInSec:Int {
        get {
            return self._currentPeriodTimeInSec
        }
        set {
            self._currentPeriodTimeInSec = newValue
        }
    }
}

public protocol RGBYMatchDetailTimerDelegate : NSObjectProtocol {
    func periodTimerUpdated() -> Void
    func matchScoreUpdated() -> Void
}

extension Notification.Name {
    static let matchDetailDataUpdateNotification = Notification.Name(rawValue: "RGBYMatchDetailDataUpdate")
}

