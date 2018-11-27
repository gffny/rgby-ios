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
    
    var _team: RGBYMatchDaySquad?
    var _subject: RGBYPlayer?
    var _subjectPosition: RGBYPlayerPosition?
    var _object: RGBYPlayer?
    var _objectPosition: RGBYPlayerPosition?
    var _eventType: RGBYEventType?
    var _parentEvent: RGBYMatchEvent?
    var _eventTime: Int
    var _fieldLocation: CGPoint?

    init(eventTime: Int, fieldLocation: CGPoint) {
        _eventTime = eventTime
        _fieldLocation = fieldLocation
    }

    init(eventTime: Int, eventType: RGBYEventType, fieldLocation: CGPoint, subject: RGBYPlayer?, subjectPosition: RGBYPlayerPosition?, parentEvent: RGBYMatchEvent?) {
        _subject = subject
        _subjectPosition = subjectPosition
        _object = nil
        _objectPosition = nil
        _eventType = eventType
        _parentEvent = parentEvent
        _eventTime = eventTime
        _fieldLocation = fieldLocation
    }

    init(eventTime: Int, eventType: RGBYEventType, fieldLocation: CGPoint, subject: RGBYPlayer?, subjectPosition: RGBYPlayerPosition?) {
        _subject = subject
        _subjectPosition = subjectPosition
        _object = nil
        _objectPosition = nil
        _eventType = eventType
        _parentEvent = nil
        _eventTime = eventTime
        _fieldLocation = fieldLocation
    }

    init(eventTime: Int, eventType: RGBYEventType, fieldLocation: CGPoint, subject: RGBYPlayer, subjectPosition: RGBYPlayerPosition, object: RGBYPlayer?, objectPosition: RGBYPlayerPosition?, parentEvent: RGBYMatchEvent?) {
        _subject = subject
        _subjectPosition = subjectPosition
        _object = object
        _objectPosition = objectPosition
        _eventType = eventType
        _parentEvent = parentEvent
        _eventTime = eventTime
        _fieldLocation = fieldLocation
    }
}
