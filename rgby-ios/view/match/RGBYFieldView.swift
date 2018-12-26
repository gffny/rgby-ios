//
//  RGBYFieldView.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/2/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYFieldView: UIControl, UITableViewDataSource {

    let nibName = "RGBYFieldView"
    let INCIDENT_CELL_REUSE_ID = "INCIDENT_CELL_REUSE_ID"

    @IBOutlet weak var fieldView: UIImageView!
    @IBOutlet weak var incidentView: UIView!
    @IBOutlet weak var modeSwitch: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var incidentTable: UITableView!
    
    // SUBMENU BUTTONS
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var scoreButton: UIButton!
    @IBOutlet weak var penaltyButton: UIButton!
    @IBOutlet weak var foulButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    
    var matchEventArray: [RGBYMatchEvent] = []
    private var _selectedIncidentFilter = IncidentTableFilter.ALL

    required init?(coder aDecoder: NSCoder) {
        print("RGBYFieldView:: init(coder)")
        super.init(coder: aDecoder)
        setupView()
    }

    override init(frame: CGRect) {
        print("RGBYFieldView:: init(frame)")
        super.init(frame: frame)
        setupView()
    }

    func setupView() {
        print("RGBYFieldView::setupView")
        // load the view from the nib
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        // set the view bounds
        self.contentView.frame = bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(contentView)
        self.incidentTable.dataSource = self
        self.incidentTable.register(UINib.init(nibName: RGBYIncidentTableCell.nibName, bundle: nil), forCellReuseIdentifier: INCIDENT_CELL_REUSE_ID)
    }

    func updateEventArray(matchEventArray: [RGBYMatchEvent]) {
        // assume that only new events (after the x number of events currently in the array) need to up updated
        var startIndex = self.matchEventArray.count
        while startIndex < matchEventArray.count {
            let newEvent = matchEventArray[startIndex]
            self.matchEventArray.append(newEvent)
            self.addEventOnView(newEvent: newEvent)
            startIndex += 1
        }
        self.incidentTable.reloadData()
    }

    func addEventOnView(newEvent: RGBYMatchEvent) {
        print("adding new event to view")
        if RGBYEventType.scoreEvents.contains(newEvent.eventType!) {
            let frontimgview = UIImageView(image: newEvent.eventType!.eventIcon)
            let x = self.fieldView.frame.width * newEvent.fieldLocation!.x
            let y = self.fieldView.frame.height * newEvent.fieldLocation!.y
            let w = self.fieldView.frame.width / 20
            let h = self.fieldView.frame.height / 20
            frontimgview.frame = CGRect(x: x - (w / 2), y: y - (h / 2), width: h, height: h)
            // Add the front image on top of the background
            self.incidentView.addSubview(frontimgview)
        }
    }

    @IBAction func handleMenuButton(_ sender: UIButton) {
        if sender == self.allButton {
            // all
            self._selectedIncidentFilter = IncidentTableFilter.ALL
        } else if sender == self.scoreButton {
            // all
            self._selectedIncidentFilter = IncidentTableFilter.SCORE
        } else if sender == self.penaltyButton {
            // all
            self._selectedIncidentFilter = IncidentTableFilter.PENALTY
        } else if sender == self.foulButton {
            // all
            self._selectedIncidentFilter = IncidentTableFilter.FOUL
        } else {
            // other
            self._selectedIncidentFilter = IncidentTableFilter.OTHER
        }
        self.incidentTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.matchEventArray.filter{ (matchEvent) -> Bool in
            switch self._selectedIncidentFilter {
            case .ALL:
                return true
            case .SCORE:
                return RGBYEventType.scoreEvents.contains(matchEvent.eventType!)
            case .PENALTY:
                return matchEvent.eventType == RGBYEventType.PENALTY
            case .FOUL:
                return matchEvent.eventType == RGBYEventType.FOUL
            case .OTHER:
                return true
            }
        }.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.incidentTable.dequeueReusableCell(withIdentifier: INCIDENT_CELL_REUSE_ID, for: indexPath) as! RGBYIncidentTableCell
        cell.matchEvent = self.matchEventArray.filter{ (matchEvent) -> Bool in
            switch self._selectedIncidentFilter {
            case .ALL:
                return true
            case .SCORE:
                return RGBYEventType.scoreEvents.contains(matchEvent.eventType!)
            case .PENALTY:
                return matchEvent.eventType == RGBYEventType.PENALTY
            case .FOUL:
                return matchEvent.eventType == RGBYEventType.FOUL
            case .OTHER:
                return true
            }
        }[indexPath.row]
        return cell
    }
}

private enum IncidentTableFilter {
    
    case ALL, SCORE, PENALTY, FOUL, OTHER
}
