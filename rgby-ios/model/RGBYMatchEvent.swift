//
//  RGBYMatchEvent.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/15/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation
import CoreGraphics
import RealmSwift

@objcMembers class RGBYMatchEvent: Object {
    enum Property: String {
        case id, team, subject, subjectPosition, eventTypeRaw, parentEvent, eventPeriod, periodTimeInSec, fieldLocation, isMyTeam, additionalIncidentType, eventType
    }

    dynamic var id = UUID().uuidString
    dynamic var team: RGBYMatchDaySquad?
    dynamic var subject: RGBYPlayer?
    dynamic var subjectPosition: RGBYPlayerPosition?
    dynamic var eventTypeRaw = RGBYEventType.LINE_OUT.rawValue
    dynamic var parentEvent: RGBYMatchEvent?
    dynamic var eventPeriod: Int = 0
    dynamic var periodTimeInSec: Int = 0
    dynamic var fieldLocation: CGPoint? = CGPoint(x: 0, y: 0)
    dynamic var isMyTeam: Bool? = false
    dynamic var additionalIncidentType: String? = ""

    var eventType: RGBYEventType? {
        get {
            return RGBYEventType(rawValue: eventTypeRaw)!
        } set {
            self.eventTypeRaw = newValue!.rawValue
        }
    }

    override static func primaryKey() -> String? {
        return RGBYMatchEvent.Property.id.rawValue
    }

    convenience init (_ team: RGBYMatchDaySquad, _ subject: RGBYPlayer, _ subjectPosition: RGBYPlayerPosition, _ eventType: RGBYEventType, _ parentEvent: RGBYMatchEvent, _ eventPeriod: Int, _ periodTimeInSec: Int, _ fieldLocation: CGPoint, _ isMyTeam: Bool, _ additionalIncidentType: String) {
        self.init()
        self.team = team
        self.subject = subject
        self.subjectPosition = subjectPosition
        self.eventType = eventType
        self.parentEvent = parentEvent
        self.eventPeriod = eventPeriod
        self.periodTimeInSec = periodTimeInSec
        self.fieldLocation = fieldLocation
        self.isMyTeam = isMyTeam
        self.additionalIncidentType = additionalIncidentType
    }

    convenience init(eventPeriod: Int, periodTimeInSec: Int, eventType: RGBYEventType, fieldLocation: CGPoint, subject: RGBYPlayer?, subjectPosition: RGBYPlayerPosition?, parentEvent: RGBYMatchEvent?, isMyTeam:Bool?, additionalIncidentType: String?) {
        self.init()
        self.subject = subject
        self.subjectPosition = subjectPosition
        self.eventType = eventType
        if parentEvent != nil {
            self.parentEvent = parentEvent!
        }
        self.eventPeriod = eventPeriod
        self.periodTimeInSec = periodTimeInSec
        self.fieldLocation = fieldLocation
        if additionalIncidentType != nil {
            self.additionalIncidentType = additionalIncidentType!
        }
    }

    convenience init(eventPeriod: Int, periodTimeInSec: Int, fieldLocation: CGPoint) {
        self.init()
        self.eventPeriod = eventPeriod
        self.periodTimeInSec = periodTimeInSec
        self.fieldLocation = fieldLocation
    }

    func eventTableSummary() -> String {
        var label = ""
        if let player = self.subject {
            if isMyTeam != nil && isMyTeam! {
                label = "\(player.fName) \(player.lName) \(self.eventTime)"
            } else {
                label = " \(self.eventTime) \(player.fName) \(player.lName)"
            }
        } else if let position = self.subjectPosition {
            if isMyTeam != nil && isMyTeam! {
                label = "\(position.displayName) \(self.eventTime)"
            } else {
                label = " \(self.eventTime) \(position.displayName)"
            }
        }
        return label
    }

    var eventTime: String {
        get {
            // 1st half past 40m will show 40+%'
            // 2nd half past 40m will show 80+%'
            let periodTime: Int = Int(round(Double(periodTimeInSec/60)))
            if eventPeriod < 3 {
                if periodTime > 40 {
                    return String("\(eventPeriod*40)+\(periodTime-40)'")
                }
                return String("\(((eventPeriod-1)*40)+periodTime)'")
            }
            // extra time??? assume 15 minutes + %'
            if periodTime > 15 {
                return String("\(80+((eventPeriod-2)*15))+\(periodTime-15)'")
            }
            return String("\(80+((eventPeriod-2)*15)+periodTime)'")
        }
    }
}

extension RGBYMatchEvent {
    
    static func get(id: String, in realm: Realm = try! Realm()) -> RGBYMatchEvent? {
        return realm.object(ofType: RGBYMatchEvent.self, forPrimaryKey: id)
    }
    
    static func all(in realm: Realm = try! Realm()) -> Results<RGBYMatchEvent> {
        return realm.objects(RGBYMatchEvent.self)
            .sorted(byKeyPath: RGBYMatchEvent.Property.id.rawValue)
    }
    
    @discardableResult
    static func create(event: RGBYMatchEvent, in realm: Realm = try! Realm())
        -> RGBYMatchEvent {
            try! realm.write {
                realm.add(event, update: true)
            }
            return event
    }
    
    func delete() {
        guard let realm = realm else { return }
        try! realm.write {
            realm.delete(self)
        }
    }
}
