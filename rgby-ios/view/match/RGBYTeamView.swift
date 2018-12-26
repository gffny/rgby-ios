//
//  RGBYStatsView.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/26/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYTeamView: UIView {

    private var nibName = "RGBYTeamView"

    @IBOutlet var contentView: UIView!

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init?(coder aDecoder: NSCoder) {
        print("RGBYTeamView:: init(coder)")
        super.init(coder: aDecoder)
        setupView()
    }
    
    override init(frame: CGRect) {
        print("RGBYTeamView:: init(frame)")
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        print("RGBYTeamView::setupView")
        // load the view from the nib
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        // set the view bounds
        self.contentView.frame = bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(self.contentView)
    }
}
