//
//  RGBYMatchEvent.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/15/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation
import CoreGraphics

class RGBYMatchEvent {

    var team: RGBYMatchDaySquad?
    var subject: RGBYPlayer?
    var subjectPosition: RGBYPlayerPosition?
    var eventType: RGBYEventType?
    var parentEvent: RGBYMatchEvent?
    var eventPeriod: Int
    var periodTimeInSec: Int
    var fieldLocation: CGPoint?
    var isMyTeam: Bool?
    var additionalIncidentType: String?

    init(eventPeriod: Int, periodTimeInSec: Int, fieldLocation: CGPoint) {
        self.eventPeriod = eventPeriod
        self.periodTimeInSec = periodTimeInSec
        self.fieldLocation = fieldLocation
    }

    init(eventPeriod: Int, periodTimeInSec: Int, eventType: RGBYEventType, fieldLocation: CGPoint, subject: RGBYPlayer?, subjectPosition: RGBYPlayerPosition?, parentEvent: RGBYMatchEvent?) {
        self.subject = subject
        self.subjectPosition = subjectPosition
        self.eventType = eventType
        self.eventPeriod = eventPeriod
        self.periodTimeInSec = periodTimeInSec
        self.fieldLocation = fieldLocation
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
