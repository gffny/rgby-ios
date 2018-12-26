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
    @IBOutlet weak var incidentIcon: UIImageView!
    @IBOutlet weak var oppositionLabel: UILabel!

    var matchEvent: RGBYMatchEvent? {
        didSet {
            self.incidentIcon.image = matchEvent?.eventType?.eventIcon ?? UIImage(named: "AppIcon")
            self.teamLabel.text = matchEvent!.isMyTeam! ? RGBYUtils.formatPlayerName(player: matchEvent!.subject) : matchEvent!.subjectPosition?.displayName
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
