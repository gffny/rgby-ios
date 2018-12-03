//
//  RGBYPlayerButton.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/24/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYPlayerButton: UIButton {
    
    var _player: RGBYPlayer!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    var player: RGBYPlayer {
        set {
            _player = newValue
            self.setTitle(newValue.firstName + " " + newValue.lastName, for: .normal)
        }
        get {
            return _player
        }
    }
}
