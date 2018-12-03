//
//  RGBYMatchClock.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/2/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYMatchClock: UIControl {

    let nibName = "RGBYMatchClock"

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var clockActionButton: UIButton!

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
        self.clockActionButton.addTarget(self, action: #selector(handleClockAction(sender:)), for: .touchUpInside)
    }

    func setClockText(text: String) {
        self.clockActionButton.setTitle(text, for: .normal)
    }

}

extension RGBYMatchClock {
    
    //MARK: MAIN ACTION: .valueChanged
    fileprivate func performAction() {
        sendActions(for: .valueChanged)
    }
    
    @objc fileprivate func handleClockAction(sender: UIButton) {
        performAction()
    }
}
