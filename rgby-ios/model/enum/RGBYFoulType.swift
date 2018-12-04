//
//  RGBYFoulType.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/4/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

enum RGBYFoulType {

    // BALL HANDLING
    case KNOCK_ON, FORWARD_PASS
    // OPEN PLAY
    case OFFSIDE
    // SCRUM
    case SCRUM
    // FOUL PLAY
    case FOUL_PLAY, LINEOUT
    
    static var listCases: [RGBYFoulType] {
        return [.KNOCK_ON, .FORWARD_PASS, .OFFSIDE, .SCRUM, .FOUL_PLAY, .LINEOUT]
    }

    var displayTitle: String {
        switch self {
        case .KNOCK_ON:
            return "Knock On"
        case .FORWARD_PASS:
            return "Forward Pass"
        case .OFFSIDE:
            return "Offside"
        case .SCRUM:
            return "Scrum Foul"
        case .LINEOUT:
            return "Lineout Foul"
        case .FOUL_PLAY:
            return "Other"
        }
    }
}
