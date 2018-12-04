//
//  RGBYPenaltyType.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/3/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

enum RGBYPenaltyType {

    // RUCK
    case OFFSIDE, NOT_RELEASING, OFF_FEET
    // TACKLE
    case HIGH_TACKLE, LATE_TACKLE, TACKLE_WITHOUT_BALL
    // SCRUM
    case SCRUM, LINEOUT, MAUL
    // FOUL PLAY
    case FOUL_PLAY

    static var listCases: [RGBYPenaltyType] {
        return [.OFFSIDE, .NOT_RELEASING, .OFF_FEET, .HIGH_TACKLE, .LATE_TACKLE, .TACKLE_WITHOUT_BALL, .SCRUM, .LINEOUT, .MAUL, .FOUL_PLAY]
    }

    var displayTitle: String {
        switch self {
        case .OFFSIDE:
            return "Offside"
        case .NOT_RELEASING:
            return "Not Releasing"
        case .OFF_FEET:
            return "Off Feet"
        case .HIGH_TACKLE:
            return "High Tackle"
        case .LATE_TACKLE:
            return "Late Tackle"
        case .TACKLE_WITHOUT_BALL:
            return "Tackle without the ball"
        case .SCRUM:
            return "Scrum Penalty"
        case .LINEOUT:
            return "Lineout Penalty"
        case .MAUL:
            return "Maul Penalty"
        case .FOUL_PLAY:
            return "Foul Play"
        }
    }
}
