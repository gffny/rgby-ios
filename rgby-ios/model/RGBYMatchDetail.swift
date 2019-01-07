//
//  RGBYMatchDetail.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/14/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation
import CoreGraphics
import RealmSwift

class RGBYMatchDetail: NSObject {

    var match: RGBYMatch

    // delegates
    var matchDetailDelegate: RGBYMatchDetailDelegate?
    var matchDetailEventDelegate: RGBYMatchDetailEventDelegate?

    // timing function variables
    private var _currentPeriod: Int = 0 // 1 = 1st half, 2 = 2nd half, 3 = 1st half extra time...
    private var _periodTimer: Timer? // reset to zero at the start of each period
    private var _currentPeriodTimeInSec: Int = 0
    private var _periodStarted: Bool = false
    private var _periodPaused: Bool = false
    var hasMatchEnded: Bool = false

    // scoring function variables
    private var _teamScore: Int = 0
    private var _oppositionScore: Int = 0

    // match event function variables
    private var _matchEventArray = [RGBYMatchEvent]()

    override init() {
        // not really useful
        self.match = RGBYMatch()
    }

    convenience init(match: RGBYMatch) {
        self.init()
        self.match = match
    }
    
    convenience init(do: RGBYMatchDetailDO) {
        self.init()
    }

    func initDatabaseObject() -> RGBYMatchDetailDO {
        let matchEventList = List<RGBYMatchEvent>()
        matchEventList.append(objectsIn: self.matchEventArray)
        let matchDetailDO = RGBYMatchDetailDO(self.match, self.currentPeriod, self.currentPeriodTimeInSec, self.hasMatchEnded, self.teamScore, self.oppositionScore, matchEventList)
        return matchDetailDO
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
        RGBYMatchDetailDO.create(matchDetailDO: self.initDatabaseObject())
        NotificationCenter.default.post(name: .matchDetailDataUpdateNotification, object: nil)
        self.matchDetailDelegate?.matchScoreUpdated()
        self.matchDetailEventDelegate?.matchEventAdded()
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

    var isAddedTime: Bool {
        get {
            return self._currentPeriodTimeInSec > (self.currentPeriod < 3 ? self.match.regularPeriodLength : self.match.extraTimePeriodLength)
        }
    }

    var isExtraTimeRequired: Bool {
        get {
            return self._currentPeriod == 2 && self._teamScore == self._oppositionScore && self.match.extraTimePeriods > 0
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

@objcMembers class RGBYMatchDetailDO: Object {
    enum Property: String {
        case id, match, currentPeriod, currentPeriodTimeInSec, hasMatchEnded, teamScore, oppositionScore, matchEventArray
    }

    dynamic var id = UUID().uuidString
    dynamic var match: RGBYMatch? = RGBYMatch()
    
    // timing function variables
    dynamic var currentPeriod: Int = 0
    dynamic var currentPeriodTimeInSec: Int = 0
    dynamic var hasMatchEnded: Bool = false
    
    // scoring function variables
    dynamic var teamScore: Int = 0
    dynamic var oppositionScore: Int = 0
    
    // match event function variables
    dynamic var matchEventArray = List<RGBYMatchEvent>()
    
    override static func primaryKey() -> String? {
        return RGBYMatchDetailDO.Property.id.rawValue
    }

    convenience init(_ match: RGBYMatch, _ currentPeriod: Int, _ currentPeriodTimeInSec: Int, _ hasMatchEnded: Bool, _ teamScore: Int, _ oppositionScore: Int, _ matchEventArray: List<RGBYMatchEvent>) {
        self.init()
        self.match = match
        self.currentPeriod = currentPeriod
        self.currentPeriodTimeInSec = currentPeriodTimeInSec
        self.hasMatchEnded = hasMatchEnded
        self.teamScore = teamScore
        self.oppositionScore = oppositionScore
        self.matchEventArray = matchEventArray
    }

    convenience init(_ id: String, _ match: RGBYMatch, _ currentPeriod: Int, _ currentPeriodTimeInSec: Int, _ hasMatchEnded: Bool, _ teamScore: Int, _ oppositionScore: Int, _ matchEventArray: List<RGBYMatchEvent>) {
        self.init()
        self.id = id
        self.match = match
        self.currentPeriod = currentPeriod
        self.currentPeriodTimeInSec = currentPeriodTimeInSec
        self.hasMatchEnded = hasMatchEnded
        self.teamScore = teamScore
        self.oppositionScore = oppositionScore
        self.matchEventArray = matchEventArray
    }
}

extension RGBYMatchDetailDO {
    
    static func get(id: String, in realm: Realm = try! Realm()) -> RGBYMatchDetailDO? {
        return realm.object(ofType: RGBYMatchDetailDO.self, forPrimaryKey: id)
    }
    
    static func getActiveDetail(in realm: Realm = try! Realm()) -> RGBYMatchDetailDO? {
        return realm.objects(RGBYMatchDetailDO.self).filter("hasMatchEnded = false").first
    }
    
    @discardableResult
    static func create(matchDetailDO: RGBYMatchDetailDO, in realm: Realm = try! Realm())
        -> RGBYMatchDetailDO {
            try! realm.write {
                realm.add(matchDetailDO, update: true)
            }
            return matchDetailDO
    }
    
    func delete() {
        guard let realm = realm else { return }
        try! realm.write {
            realm.delete(self)
        }
    }
}

public protocol RGBYMatchDetailDelegate : NSObjectProtocol {
    func periodUpdated() -> Void
    func periodTimeUpdated() -> Void
    func matchScoreUpdated() -> Void
}

public protocol RGBYMatchDetailEventDelegate: NSObjectProtocol {
    func matchEventAdded() -> Void
}

extension Notification.Name {
    static let matchDetailDataUpdateNotification = Notification.Name(rawValue: "RGBYMatchDetailDataUpdate")
}

