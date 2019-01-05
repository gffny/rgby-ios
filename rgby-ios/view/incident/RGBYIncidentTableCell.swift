//
//  RGBYIncidentTableCell.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/25/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYIncidentTableCell: UITableViewCell {

    static var nibName = "RGBYIncidentTableCell"

    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var teamSubLabel: UILabel!
    @IBOutlet weak var incidentIcon: UIImageView!
    @IBOutlet weak var oppositionLabel: UILabel!
    @IBOutlet weak var oppositionSubLabel: UILabel!
    
    var matchEvent: RGBYMatchEvent? {
        didSet {
            self.incidentIcon.image = matchEvent?.eventType?.eventIcon ?? UIImage(named: "AppIcon")
            if matchEvent!.isMyTeam! {
                self.oppositionLabel.text = ""
                self.oppositionSubLabel.text = ""
                self.teamLabel.text = RGBYUtils.formatPlayerName(player: matchEvent!.subject)
                self.teamSubLabel.text = "\(matchEvent!.eventTime) \(matchEvent!.eventType?.displayName ?? "")"
            } else {
                self.teamLabel.text = ""
                self.teamSubLabel.text = ""
                self.oppositionLabel.text = matchEvent!.subjectPosition?.displayName
                self.oppositionSubLabel.text = "\(matchEvent!.eventTime) \(matchEvent!.eventType?.displayName ?? "")"
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
