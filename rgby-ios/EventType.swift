//
//  EventType.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/11/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

enum EventType {
    
    case MISSED_TACKLE, LINE_BREAK, FOWL, PENALTY, TRY, CONVERSION, KICK_FROM_PLAY, DROP_GOAL, KICK_AT_GOAL, KICK_TO_TOUCH, SCRUM, TAP, POACH
    
    var resultingEvents: [EventType] {
        switch self {
        case .PENALTY: return [.SCRUM, .KICK_AT_GOAL, .KICK_TO_TOUCH, .TRY]
        case .MISSED_TACKLE:
            return []
        case .LINE_BREAK:
            return []
        case .FOWL:
            return [.SCRUM, .TAP]
        case .TRY:
            return [.CONVERSION]
        case .CONVERSION:
            return []
        case .KICK_FROM_PLAY:
            return []
        case .DROP_GOAL:
            return []
        case .KICK_AT_GOAL:
            return []
        case .KICK_TO_TOUCH:
            return []
        case .SCRUM:
            return [.PENALTY, .FOWL]
        case .TAP:
            return []
        case .POACH:
            return []
        }
    }
    
    var hasPlayerAttribute: Bool {
        switch self {
        case .MISSED_TACKLE:
            return true
        case .LINE_BREAK:
            return true
        case .FOWL:
            return true
        case .PENALTY:
            return true
        case .TRY:
            return true
        case .CONVERSION:
            return true
        case .KICK_FROM_PLAY:
            return true
        case .DROP_GOAL:
            return true
        case .KICK_AT_GOAL:
            return true
        case .KICK_TO_TOUCH:
            return true
        case .SCRUM:
            return false
        case .TAP:
            return true
        case .POACH:
            return true
        }
    }
    
    var topLevelEvents: [EventType] {
        return [.PENALTY, .FOWL, .TRY, .KICK_FROM_PLAY, .DROP_GOAL, .POACH]
    }
}
