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
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // add it to this view
        addSubview(contentView)
        tryButton.addTarget(self, action: #selector(handleScoreTypeSelected(sender:)), for: .touchUpInside)
        convButton.addTarget(self, action: #selector(handleScoreTypeSelected(sender:)), for: .touchUpInside)
        penaltyButton.addTarget(self, action: #selector(handleScoreTypeSelected(sender:)), for: .touchUpInside)
        tryButton.addTarget(self, action: #selector(handleScoreTypeSelected(sender:)), for: .touchUpInside)
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
            selectedScoreType = RGBYScoreTypeSelectView.TRY
        } else if (sender == convButton) {
            selectedScoreType = RGBYScoreTypeSelectView.CONVERSION
        } else if (sender == penaltyButton) {
            selectedScoreType = RGBYScoreTypeSelectView.PENALTY
        } else if (sender == dropGoalButton) {
            selectedScoreType = RGBYScoreTypeSelectView.DROP_GOAL
        }
        self.performAction()
    }
}
