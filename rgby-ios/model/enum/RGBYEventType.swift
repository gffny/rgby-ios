//
//  EventType.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/11/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

enum RGBYEventType: String {

    case MISSED_TACKLE, LINE_BREAK, FOUL, PENALTY, TRY, CONVERSION, KICK_FROM_PLAY, DROP_GOAL, KICK_AT_GOAL, KICK_TO_TOUCH, SCRUM, TAP, POACH, TACKLE, HELD_UP, PLAYER_IN_TOUCH, SUBSTITUTION, DROP_OFF_22, RESTART_KICK_OFF, LINE_OUT

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
        case .PLAYER_IN_TOUCH:
            return "Player in Touch"
        case .HELD_UP:
            return "Tackle Held Up"
        case .SUBSTITUTION:
            return "Substitution"
        case .DROP_OFF_22:
            return "22 Drop Out"
        case .RESTART_KICK_OFF:
            return "Kick Off (Restart)"
        case .LINE_OUT:
            return "Lineout"
        }
    }

    var resultingEvents: [RGBYEventType] {
        switch self {
        case .PENALTY:
            return [.SCRUM, .KICK_AT_GOAL, .KICK_TO_TOUCH, .TRY]
        case .FOUL:
            return [.SCRUM, .TAP]
        case .SCRUM:
            return [.PENALTY, .FOUL]
        case .TRY:
            return [.CONVERSION]
        case .CONVERSION:
            return [.RESTART_KICK_OFF, .DROP_OFF_22]
        default:
            return []
        }
    }

    var hasPlayerAttribute: Bool {
        switch self {
        case .SCRUM:
            return false
        default:
            return true
        }
    }

    var eventScoreValue: Int {
        switch self {
        case .TRY:
            return 5
        case .CONVERSION:
            return 2
        case .KICK_AT_GOAL, .DROP_GOAL:
            return 3
        default:
            return 0
        }
    }

    var eventIcon: UIImage {
        return UIImage(named: "EVT_\(self.rawValue)")!
    }

    static var topLevelEvents: [RGBYEventType] {
        return [.PENALTY, .FOUL, .TRY, .KICK_FROM_PLAY, .DROP_GOAL, .POACH, .LINE_BREAK, .TACKLE]
    }

    static var scoreEvents: [RGBYEventType] {
        return [.TRY, .CONVERSION, .DROP_GOAL, .KICK_AT_GOAL]
    }
}
