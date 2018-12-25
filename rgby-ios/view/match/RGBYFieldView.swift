//
//  RGBYFieldView.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/2/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYFieldView: UIControl {
    
   let nibName = "RGBYFieldView"

    @IBOutlet weak var fieldView: UIImageView!
    @IBOutlet weak var incidentView: UIView!
    @IBOutlet weak var modeSwitch: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var incidentTable: UITableView!

    var fieldTapLocation: CGPoint = CGPoint(x: 100, y: 100)
    var matchEventArray: [RGBYMatchEvent] = []

    required init?(coder aDecoder: NSCoder) {
        print("RGBYFieldView:: init(coder)")
        super.init(coder: aDecoder)
        setupView()
    }

    override init(frame: CGRect) {
        print("RGBYFieldView:: init(coder)")
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
        // add it to this view
        self.addSubview(contentView)
        self.fieldView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleFieldTap)))
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
    }

    func addEventOnView(newEvent: RGBYMatchEvent) {
        print("adding new event to view")
        if RGBYEventType.scoreEvents.contains(newEvent.eventType!) {
            let frontimgview = UIImageView(image: newEvent.eventType!.eventIcon)
            let x = self.incidentView.frame.width * newEvent.fieldLocation!.x
            let y = self.incidentView.frame.height * newEvent.fieldLocation!.y
            let w = self.incidentView.frame.width / 20
            let h = self.incidentView.frame.height / 20
            frontimgview.frame = CGRect(x: x - (w / 2), y: y - (h / 2), width: w, height: h)
            // Add the front image on top of the background
            self.incidentView.addSubview(frontimgview)
        }
    }

    @objc func handleFieldTap(sender: UITapGestureRecognizer) {
        print("RGBYFieldView:: handle field tap")
        self.fieldTapLocation = sender.location(in: self.fieldView)
        self.performAction()
    }

    // UI Table View Data Source Protocol
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0;
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = incidentTable.dequeueReusableCell(withIdentifier: "rgbyMatchEventCell")! as! RGBYMatchDetailTableViewCell
//        cell.setData(matchEvent: self.matchDetail.matchEventArray.filter({ (event: RGBYMatchEvent) -> Bool in
//            return RGBYEventType.scoreEvents.contains(event.eventType!)
//        })[indexPath.row])
//        return cell
//    }
//
}

extension RGBYFieldView {

    //MARK: MAIN ACTION: .valueChanged
    fileprivate func performAction() {
        sendActions(for: .valueChanged)
    }
}
