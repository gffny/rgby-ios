//
//  RGBYTurnOverType.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/4/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

enum RGBYTurnOverType {
    
    case KICK_AWAY, TACKLE_TO_TOUCH, POACH, TACKLE_HELD_UP

    static var listCases: [RGBYTurnOverType] {
        return [.KICK_AWAY, .TACKLE_TO_TOUCH, .POACH, TACKLE_HELD_UP]
    }
    
    var displayTitle: String {
        switch self {
        case .KICK_AWAY:
            return "Kick Away"
        case .TACKLE_TO_TOUCH:
            return "Tackle to Touch"
        case .POACH:
            return "Poach"
        case .TACKLE_HELD_UP:
            return "Tackle Held Up"
        }
    }
}
