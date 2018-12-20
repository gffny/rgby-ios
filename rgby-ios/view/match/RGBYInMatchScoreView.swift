//
//  RGBYInMatchScoreView.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/15/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYInMatchScoreView: UIView {

    @IBOutlet weak var eventTableView: UITableView!

}

class RGBYMatchDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventIcon: UIImageView!
    @IBOutlet weak var eventTypeLabel: UILabel!
    @IBOutlet weak var eventDetailLabel: UILabel!
    
    func setData(matchEvent: RGBYMatchEvent) {
        eventTypeLabel.text = matchEvent.eventType?.displayName
        if let subject = matchEvent.subject {
            eventDetailLabel.text = "\(matchEvent.eventTime) \(subject.fName) \(subject.lName)"
        } else if let postion = matchEvent.subjectPosition {
            eventDetailLabel.text = "\(matchEvent.eventTime) \(postion.displayName)"
        } else {
            eventDetailLabel.text = "\(matchEvent.eventTime) Unknown Player"
        }
    }
}
