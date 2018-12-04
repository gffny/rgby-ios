//
//  RGBYProfileView.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/4/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYProfileView: UIControl {
    
    let nibName = "RGBYProfileView"

    @IBOutlet weak var penImage: UIImageView!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet var contentView: UIView!
    
    var player: RGBYPlayer?
    
    required init?(coder aDecoder: NSCoder) {
        print("RGBYProfileView:: init(coder)")
        super.init(coder: aDecoder)
        defaultView()
    }
    
    override init(frame: CGRect) {
        print("RGBYProfileView:: init(coder)")
        super.init(frame: frame)
        defaultView()
    }
    
    func defaultView() {
        // load the view from the nib
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        // set the view bounds
        self.contentView.frame = bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        // set the pen image, etc
        penImage.image = UIImage(named: "AppIcon")
        penImage.layer.borderWidth = 3
        penImage.layer.masksToBounds = false
        penImage.layer.borderColor = UIColor.white.cgColor
        penImage.layer.cornerRadius = penImage.frame.height/2
        penImage.clipsToBounds = true
        lastName.text = "Gaffney"
        firstName.text = "John"
        position.text = "Outhalf"
    }
    
    func setPlayerData(player: RGBYPlayer) {
        self.player = player
        if let penImageUrl = player.imageURL {
            let data = try? Data(contentsOf: penImageUrl)
            if let imageData = data {
                penImage.image = UIImage(data: imageData)
            }
        }
        self.lastName.text = player.lastName
        self.firstName.text = player.firstName
        self.position.text = player.preferredPosition.displayName
    }
}
