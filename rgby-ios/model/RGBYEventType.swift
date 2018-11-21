//
//  EventType.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/11/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

enum RGBYEventType {
    
    case MISSED_TACKLE, LINE_BREAK, FOUL, PENALTY, TRY, CONVERSION, KICK_FROM_PLAY, DROP_GOAL, KICK_AT_GOAL, KICK_TO_TOUCH, SCRUM, TAP, POACH, TACKLE
    
    var displayName: String {
        switch self {
        case .MISSED_TACKLE:
            return "Missed Tackle"
        case .LINE_BREAK:
            return "Line break"
        case .FOUL:
            return "Foul"
        case .PENALTY:
            return "Penalty"
        case .TRY:
            return "Try"
        case .CONVERSION:
            return "Conversion"
        case .KICK_FROM_PLAY:
            return "Kick from Play"
        case .DROP_GOAL:
            return "Drop Goal"
        case .KICK_AT_GOAL:
            return "Kick At Goal"
        case .KICK_TO_TOUCH:
            return "Kick to Touch"
        case .SCRUM:
            return "Scrum"
        case .TAP:
            return "Quick Tap"
        case .POACH:
            return "Poach"
        case .TACKLE:
            return "Tackle"
        }
    }
    
    var resultingEvents: [RGBYEventType] {
        switch self {
        case .PENALTY: return [.SCRUM, .KICK_AT_GOAL, .KICK_TO_TOUCH, .TRY]
        case .MISSED_TACKLE:
            return []
        case .LINE_BREAK:
            return []
        case .FOUL:
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
            return [.PENALTY, .FOUL]
        case .TAP:
            return []
        case .POACH:
            return []
        case .TACKLE:
            return []
        }
    }
    
    var hasPlayerAttribute: Bool {
        switch self {
        case .MISSED_TACKLE:
            return true
        case .LINE_BREAK:
            return true
        case .FOUL:
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
        case .TACKLE:
            return true
        }
    }
    
    var topLevelEvents: [RGBYEventType] {
        return [.PENALTY, .FOUL, .TRY, .KICK_FROM_PLAY, .DROP_GOAL, .POACH, .LINE_BREAK, .TACKLE]
    }
    
}
