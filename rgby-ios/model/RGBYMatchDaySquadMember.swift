//
//  RGBYMatchDaySquadMember.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/24/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

class RGBYMatchDaySquadMember: RGBYPlayer {
    
    var _squadNumber: Int = 0
    
    init(player: RGBYPlayer, squadNumber:Int) {
        super.init(firstName: player._firstName, lastName: player._lastName, preferredPosition: player._preferredPosition, imageURL: player._imageURL)
        _squadNumber = squadNumber
    }
    
    var squadNumber: Int {
        get {
            return _squadNumber
        }
        set {
            _squadNumber = newValue
        }
    }
}
