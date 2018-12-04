//
//  EventType.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/11/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

enum RGBYEventType {
    
    case MISSED_TACKLE, LINE_BREAK, FOUL, PENALTY, TRY, CONVERSION, KICK_FROM_PLAY, DROP_GOAL, KICK_AT_GOAL, KICK_TO_TOUCH, SCRUM, TAP, POACH, TACKLE, HELD_UP, PLAYER_IN_TOUCH
    
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
        }
    }
    
    var resultingEvents: [RGBYEventType] {
        switch self {
        case .MISSED_TACKLE, .LINE_BREAK, .CONVERSION, .KICK_FROM_PLAY, .DROP_GOAL, .KICK_AT_GOAL, .KICK_TO_TOUCH, .TAP, .POACH, .TACKLE, .PLAYER_IN_TOUCH, .HELD_UP:
            return []
        case .PENALTY: return [.SCRUM, .KICK_AT_GOAL, .KICK_TO_TOUCH, .TRY]
        case .FOUL:
            return [.SCRUM, .TAP]
        case .SCRUM:
            return [.PENALTY, .FOUL]
        case .TRY:
            return [.CONVERSION]
        }
    }

    var hasPlayerAttribute: Bool {
        switch self {
        case .MISSED_TACKLE, .LINE_BREAK, .FOUL, .PENALTY, .TRY, .CONVERSION, .KICK_FROM_PLAY:
            return true
        case .DROP_GOAL, .KICK_AT_GOAL, .KICK_TO_TOUCH, .TAP, .POACH, .TACKLE, .PLAYER_IN_TOUCH, .HELD_UP:
            return true
        case .SCRUM:
            return false
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
        case .MISSED_TACKLE, .LINE_BREAK, .FOUL, .PENALTY, .KICK_FROM_PLAY, .KICK_TO_TOUCH:
            return 0
        case .SCRUM, .TAP, .POACH, .TACKLE, .HELD_UP, .PLAYER_IN_TOUCH:
            return 0
        }
    }
    
    var eventIcon: UIImage {
        switch self {
        case .TRY, .CONVERSION:
            return UIImage(named: "TryIcon")!
        case .KICK_AT_GOAL:
            return UIImage(named: "PenaltyIcon")!
        case .DROP_GOAL:
            return UIImage(named: "DropGoalIcon")!
        case .MISSED_TACKLE, .LINE_BREAK, .FOUL, .PENALTY, .KICK_FROM_PLAY, .KICK_TO_TOUCH:
            return UIImage(named: "Blah")!
        case .SCRUM, .TAP, .POACH, .TACKLE, .PLAYER_IN_TOUCH, .HELD_UP:
            return UIImage(named: "Blah")!
        }
    }
    
    static var topLevelEvents: [RGBYEventType] {
        return [.PENALTY, .FOUL, .TRY, .KICK_FROM_PLAY, .DROP_GOAL, .POACH, .LINE_BREAK, .TACKLE]
    }

    static var scoreEvents: [RGBYEventType] {
        return [.TRY, .CONVERSION, .DROP_GOAL, .KICK_AT_GOAL]
    }
}
