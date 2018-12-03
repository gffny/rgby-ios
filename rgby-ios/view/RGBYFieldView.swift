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
    @IBOutlet var contentView: UIView!

    var fieldTapLocation: CGPoint = CGPoint(x: 100, y: 100)
    var matchEventArray: [RGBYMatchEvent] = []
    
    required init?(coder aDecoder: NSCoder) {
        print("RGBYScoreTypeSelectView:: init(coder)")
        super.init(coder: aDecoder)
        setupView()
    }
    
    override init(frame: CGRect) {
        print("RGBYScoreTypeSelectView:: init(coder)")
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        print("RGBYScoreTypeSelectView::setupView")
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
            startIndex+=1
            
        }
    }

    func addEventOnView(newEvent: RGBYMatchEvent) {
        print("adding new event to view")
        let frontimgview = UIImageView(image: newEvent.eventType!.eventIcon)
        let x = self.contentView.frame.width * newEvent.fieldLocation!.x
        let y = self.contentView.frame.height * newEvent.fieldLocation!.y
        let w = self.contentView.frame.width / 20
        let h = self.contentView.frame.height / 20
        frontimgview.frame = CGRect(x: x - (w/2), y: y - (h/2), width: w, height: h)
        self.incidentView.addSubview(frontimgview) // Add the front image on top of the background
    }

    @objc func handleFieldTap(sender: UITapGestureRecognizer) {
        print("RGBYFieldView:: handle field tap")
        self.fieldTapLocation = sender.location(in: self.fieldView)
        self.performAction()
    }
}

extension RGBYFieldView {

    //MARK: MAIN ACTION: .valueChanged
    fileprivate func performAction() {
        sendActions(for: .valueChanged)
    }
}
