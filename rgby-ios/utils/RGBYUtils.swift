//
//  RGBYUtils.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/2/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

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
    
    static func formatIncidentButton(yPos: Int, width: Int, height: Int, text: String, buttonColor: UIColor) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: yPos, width: width, height: height))
        button.titleLabel?.font = UIFont(name:"HelveticaNeue-CondensedBold", size: 30.0)
        button.setTitleColor(.black, for: .normal)
        button.setTitle(text, for: .normal)
        button.backgroundColor = buttonColor
        return button
    }
    
    static func mmddyyyhhmm() -> DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "MM/dd/yyyy HH:mm"
        return df
    }

    static func mmmddyyyhhmm() -> DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd MMM yyyy hh:mma"
        return df
    }

    static func formatPenImage(imageURL: URL? = nil) -> UIImage {
        if imageURL == nil {
            return UIImage(named: "AppIcon")!
        }
        let data = try? Data(contentsOf: imageURL!)
        if let imageData = data {
            return UIImage(data: imageData)!
        } else {
            // set default pen image
            return UIImage(named: "AppIcon")!
        }
    }
}
