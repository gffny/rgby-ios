//
//  RGBYPlayerButton.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/24/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYPlayerButton: UIButton {
    
    var _player: RGBYMatchDaySquadMember!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    var player: RGBYMatchDaySquadMember {
        set {
            _player = newValue
            self.setTitle(String(newValue._squadNumber) + " " + newValue._firstName + " " + newValue._lastName, for: .normal)
        }
        get {
            return _player
        }
    }
}
