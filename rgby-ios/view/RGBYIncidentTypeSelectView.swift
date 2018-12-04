//
//  RGBYIncidentTypeSelectView.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/27/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYIncidentTypeSelectView: UIControl {
    
    let nibName = "RGBYIncidentTypeSelectView"
    @IBOutlet var contentView: UIView!

    @IBOutlet weak var penaltyButton: UIButton!
    @IBOutlet weak var foulButton: UIButton!
    @IBOutlet weak var scoreButton: UIButton!
    @IBOutlet weak var turnOverButton: UIButton!
    @IBOutlet weak var tackleButton: UIButton!
    
    public static var PENALTY: String = "penalty"
    public static var FOUL: String = "foul"
    public static var SCORE: String = "score"
    public static var TURN_OVER: String = "turnover"
    public static var TACKLE: String = "tackle"

    var selectedIncident: String?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("RGBYIncidentTypeSelectView::init(coder)")
        setupView()
    }

    override init(frame: CGRect) {
        print("RGBYIncidentTypeSelectView::init(CGRect)")
        super.init(frame: frame)
        setupView()
    }

    func setupView() {
        print("RGBYTeamListView::setupView")
        // load the view from the nib
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        // set the view bounds
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // add it to this view
        addSubview(contentView)
        // add the button handlers
        penaltyButton.addTarget(self, action: #selector(handleIncidentSelected(sender:)), for: .touchUpInside)
        foulButton.addTarget(self, action: #selector(handleIncidentSelected(sender:)), for: .touchUpInside)
        scoreButton.addTarget(self, action: #selector(handleIncidentSelected(sender:)), for: .touchUpInside)
        turnOverButton.addTarget(self, action: #selector(handleIncidentSelected(sender:)), for: .touchUpInside)
        tackleButton.addTarget(self, action: #selector(handleIncidentSelected(sender:)), for: .touchUpInside)
    }
}

extension RGBYIncidentTypeSelectView {

    //MARK: MAIN ACTION: .valueChanged
    fileprivate func performAction() {
        sendActions(for: .valueChanged)
    }

    //MARK: CHANGING APPEREANCE OF BUTTON ON TAP
    @objc fileprivate func handleIncidentSelected(sender: UIButton) {
        print("RGBYIncidentTypeSelectView:: handleSelection")
        if (sender == penaltyButton) {
            // handle penalty
            print("RGBYIncidentTypeSelectView:: penalty")
            selectedIncident = RGBYIncidentTypeSelectView.PENALTY
        } else if (sender == foulButton) {
            // handle foul
            print("RGBYIncidentTypeSelectView:: penalty")
            selectedIncident = RGBYIncidentTypeSelectView.FOUL
        } else if (sender == scoreButton) {
            // handle score
            print("RGBYIncidentTypeSelectView:: score")
            selectedIncident = RGBYIncidentTypeSelectView.SCORE
        } else if (sender == turnOverButton) {
            // handle turnover
            print("RGBYIncidentTypeSelectView:: turnover")
            selectedIncident = RGBYIncidentTypeSelectView.TURN_OVER
        } else if (sender == tackleButton) {
            // handle tackle
            print("RGBYIncidentTypeSelectView:: tackle")
            selectedIncident = RGBYIncidentTypeSelectView.TACKLE
        }
        // maybe handle some styling here if need be for the button tapping
        self.performAction()
    }
}

