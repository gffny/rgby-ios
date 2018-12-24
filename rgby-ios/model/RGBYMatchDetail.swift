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

    var matchDetailDelegate: RGBYMatchDetailDelegate?
    private var _currentPeriod: Int = 0 // 1 = 1st half, 2 = 2nd half, 3 = 1st half extra time...
    private var _periodTimer: Timer? // reset to zero at the start of each period
    private var _currentPeriodTimeInSec: Int = 0
    private var _teamScore: Int = 0
    private var _oppositionScore: Int = 0
    private var _matchEventArray = [RGBYMatchEvent]()
    
    // match clock function related variables
    private var _periodStarted: Bool = false
    private var _periodPaused: Bool = false

    override init() {
        // not really useful
        self.match = RGBYMatch()
    }

    init(match: RGBYMatch) {
        self.match = match
    }

    var teamScore: Int {
        get {
            return self._teamScore
        }
    }

    var oppositionScore: Int {
        get {
            return self._oppositionScore
        }
    }

    var matchEventArray: [RGBYMatchEvent] {
        get {
            return self._matchEventArray
        }
    }

    func appendMatchEvent(newEvent: RGBYMatchEvent) {
        self._matchEventArray.append(newEvent)
        if newEvent.eventType == nil {
            // this is in error
            print("event should not have an empty event type")
        } else if RGBYEventType.scoreEvents.contains(newEvent.eventType!) {
            // add score to the correct team
            if newEvent.isMyTeam! {
                self._teamScore += (newEvent.eventType?.eventScoreValue)!
            } else {
                self._oppositionScore += (newEvent.eventType?.eventScoreValue)!
            }
        }
        NotificationCenter.default.post(name: .matchDetailDataUpdateNotification, object: nil)
        self.matchDetailDelegate?.matchScoreUpdated()
    }

    func startPeriod() {
        self._currentPeriod += 1
        self._currentPeriodTimeInSec = 0
        self.matchDetailDelegate?.periodUpdated()
        self._periodTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updatePeriodTimer), userInfo: nil, repeats: true)
        self._periodStarted = true
        self._periodPaused = false
    }

    func pauseResumePeriod() {
        if self._periodPaused {
            self._periodTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updatePeriodTimer), userInfo: nil, repeats: true)
        } else {
            self._periodTimer?.invalidate()
        }
        self._periodPaused = !self._periodPaused
    }

    func stopPeriod() {
        self._periodTimer?.invalidate()
        self._periodStarted = false
    }

    @objc func updatePeriodTimer() {
        self._currentPeriodTimeInSec += 1
        self.matchDetailDelegate?.periodTimeUpdated()
    }

    var hasPeriodStarted: Bool {
        get {
            return self._periodStarted
        }
    }

    var isPeriodPaused: Bool {
        get {
            return self._periodPaused
        }
    }

    var currentPeriod: Int {
        get {
            return self._currentPeriod
        }
    }

    var currentPeriodTimeInSec: Int {
        get {
            return self._currentPeriodTimeInSec
        }
        set {
            self._currentPeriodTimeInSec = newValue
        }
    }
}

public protocol RGBYMatchDetailDelegate : NSObjectProtocol {
    func periodUpdated() -> Void
    func periodTimeUpdated() -> Void
    func matchScoreUpdated() -> Void
}

extension Notification.Name {
    static let matchDetailDataUpdateNotification = Notification.Name(rawValue: "RGBYMatchDetailDataUpdate")
}

