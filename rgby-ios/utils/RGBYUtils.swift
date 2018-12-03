//
//  RGBYUtils.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/2/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

class RGBYUtils {

    static func formatMatchClock(time: Int) -> String {
        let minutes = Int(round(Double(time/60)))
        let seconds = time % 60
        if minutes < 10 && seconds < 10 {
            return String("0\(minutes):0\(seconds)")
        } else if minutes < 10 {
            return String("0\(minutes):\(seconds)")
        } else {
            return String("\(minutes):\(seconds)")
        }
    }
}
