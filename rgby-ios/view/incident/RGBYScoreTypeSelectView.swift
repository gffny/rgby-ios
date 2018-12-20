//
//  RGBYScoreTypeSelectView.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/27/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYScoreTypeSelectView: UIControl {

    let nibName = "RGBYScoreTypeSelectView"
    @IBOutlet var contentView: UIView!
    var selectedScoreType: String?

    @IBOutlet weak var tryButton: UIButton!
    @IBOutlet weak var convButton: UIButton!
    @IBOutlet weak var penaltyButton: UIButton!
    @IBOutlet weak var dropGoalButton: UIButton!
    
    public static var PENALTY: String = "penalty"
    public static var TRY: String = "try"
    public static var CONVERSION: String = "conversion"
    public static var DROP_GOAL: String = "dropgoal"

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
        self.tryButton.addTarget(self, action: #selector(handleScoreTypeSelected(sender:)), for: .touchUpInside)
        self.convButton.addTarget(self, action: #selector(handleScoreTypeSelected(sender:)), for: .touchUpInside)
        self.penaltyButton.addTarget(self, action: #selector(handleScoreTypeSelected(sender:)), for: .touchUpInside)
        self.dropGoalButton.addTarget(self, action: #selector(handleScoreTypeSelected(sender:)), for: .touchUpInside)
    }
}

extension RGBYScoreTypeSelectView {

    //MARK: MAIN ACTION: .valueChanged
    fileprivate func performAction() {
        sendActions(for: .valueChanged)
    }

    @objc fileprivate func handleScoreTypeSelected(sender: UIButton) {
        print("RGBYScoreTypeSelectView:: handleScoreTypeSelected")
        if (sender == tryButton) {
            self.selectedScoreType = RGBYScoreTypeSelectView.TRY
        } else if (sender == convButton) {
            self.selectedScoreType = RGBYScoreTypeSelectView.CONVERSION
        } else if (sender == penaltyButton) {
            self.selectedScoreType = RGBYScoreTypeSelectView.PENALTY
        } else if (sender == dropGoalButton) {
            self.selectedScoreType = RGBYScoreTypeSelectView.DROP_GOAL
        }
        self.performAction()
    }
}
