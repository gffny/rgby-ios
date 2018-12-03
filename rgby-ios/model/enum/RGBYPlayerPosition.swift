//
//  RGBYPlayerPosition.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/15/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

enum RGBYPlayerPosition {
    
    case LOOSE_HEAD_PROP, HOOKER, TIGHT_HEAD_PROP, SECOND_ROW, BLINDSIDE_FLANKER, OPENSIDE_FLANKER, NUMBER_8, SCRUM_HALF, OUT_HALF, LEFT_WING, INSIDE_CENTER, OUTSIDE_CENTER, RIGHT_WING, FULLBACK

    static var listTeamPositions: [RGBYPlayerPosition] {
        return [.LOOSE_HEAD_PROP, .HOOKER, .TIGHT_HEAD_PROP, .SECOND_ROW, .SECOND_ROW, .BLINDSIDE_FLANKER, .OPENSIDE_FLANKER, .NUMBER_8, .SCRUM_HALF, .OUT_HALF, .LEFT_WING, .INSIDE_CENTER, .OUTSIDE_CENTER, .RIGHT_WING, .FULLBACK]
    }

    var displayName: String {
        switch self {
        case .LOOSE_HEAD_PROP:
            return "Loose Head Prop"
        case .HOOKER:
            return "Hooker"
        case .TIGHT_HEAD_PROP:
            return "Tight Head Prop"
        case .SECOND_ROW:
            return "Second Row"
        case .BLINDSIDE_FLANKER:
            return "Blind Side Flanker"
        case .OPENSIDE_FLANKER:
            return "Openside Flanker"
        case .NUMBER_8:
            return "Number 8"
        case .SCRUM_HALF:
            return "Scrum Half"
        case .OUT_HALF:
            return "Out Half"
        case .LEFT_WING:
            return "Left Wing"
        case .INSIDE_CENTER:
            return "Inside Center"
        case .OUTSIDE_CENTER:
            return "Outside Center"
        case .RIGHT_WING:
            return "Right Wing"
        case .FULLBACK:
            return "Fullback"
        }
    }
}
