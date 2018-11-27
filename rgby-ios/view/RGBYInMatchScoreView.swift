//
//  RGBYInMatchScoreView.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/15/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYInMatchScoreView: UIView {
    
    @IBOutlet weak var myTeamNameLabel: UILabel!
    @IBOutlet weak var oppositionTeamNameLabel: UILabel!
    @IBOutlet weak var myTeamScoreLabel: UILabel!
    @IBOutlet weak var oppositionTeamScoreLabel: UILabel!
    @IBOutlet weak var eventTableView: UITableView!

}

class RGBYMatchDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventIcon: UIImageView!
    @IBOutlet weak var eventTypeLabel: UILabel!
    @IBOutlet weak var eventDetailLabel: UILabel!
    
    func setData(matchEvent: RGBYMatchEvent) {
        eventTypeLabel.text = matchEvent._eventType?.displayName
        if let subject = matchEvent._subject {
            eventDetailLabel.text = String(matchEvent._eventTime) + " " + subject._firstName + " " + subject._lastName
        } else {
            eventDetailLabel.text = String(matchEvent._eventTime) + " Unknown Player"
        }
    }
}
