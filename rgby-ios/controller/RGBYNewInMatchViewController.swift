//
//  RGBYNewInMatchViewController.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/20/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation
import UIKit

class RGBYNewInMatchViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var matchEventTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        matchEventTable.dataSource = self
    }
    /*
     return self.matchDetail!.matchEventArray.filter({ (event: RGBYMatchEvent) -> Bool in
        return RGBYEventType.scoreEvents.contains(event.eventType!)
     }).count
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RGBYDemoData.demoMatchEventList().count
    }

    /*
     
    */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RGBYMatchEventCell.REUSE_IDENTIFIER)! as! RGBYMatchEventCell
        let matchEvent = RGBYDemoData.demoMatchEventList()[indexPath.row]
        if matchEvent.isMyTeam != nil && matchEvent.isMyTeam! {
            cell.teamLabel.text = matchEvent.eventTableSummary()
            cell.oppositionLabel.text = ""
        } else {
            cell.oppositionLabel.text = matchEvent.eventTableSummary()
            cell.teamLabel.text = ""
        }
        if let type = matchEvent.eventType {
            if type == .DROP_GOAL || type == .KICK_AT_GOAL {
                cell.eventIcon.image = UIImage(named: "DropGoalIcon")
            } else if type == .TRY {
                cell.eventIcon.image = UIImage(named: "TryIcon")
            } else if type == .CONVERSION {
                cell.eventIcon.image = UIImage(named: "PenaltyIcon")
            }
        }
        return cell
    }
}

class RGBYMatchEventCell: UITableViewCell {
    
    static var REUSE_IDENTIFIER = "rgbyMatchEventCell"
    
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var eventIcon: UIImageView!
    @IBOutlet weak var oppositionLabel: UILabel!
    
}
