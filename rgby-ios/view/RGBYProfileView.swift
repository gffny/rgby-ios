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
    @IBOutlet weak var positionNumber: UILabel!
    @IBOutlet var contentView: UIView!

    var player: RGBYPlayer?

    required init?(coder aDecoder: NSCoder) {
        print("RGBYProfileView:: init(coder)")
        super.init(coder: aDecoder)
        defaultView()
    }

    override init(frame: CGRect) {
        print("RGBYProfileView:: init(frame)")
        super.init(frame: frame)
        defaultView()
    }

    init(frame: CGRect, isMovePointer: Bool) {
        print("RGBYProfileView:: init(frame) as movePointer")
        super.init(frame: frame)
        if isMovePointer {
            self.alpha = 0.7
            self.layer.borderWidth = 3
            self.layer.masksToBounds = false
            self.layer.borderColor = UIColor.black.cgColor
            self.layer.cornerRadius = self.frame.height/2
        }
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
        self.penImage.image = UIImage(named: "AppIcon")
        self.penImage.layer.borderWidth = 3
        self.penImage.layer.masksToBounds = false
        self.penImage.layer.borderColor = UIColor.white.cgColor
        self.penImage.layer.cornerRadius = self.penImage.frame.height/2
        self.penImage.clipsToBounds = true
        self.positionNumber.layer.borderWidth = 3
        self.positionNumber.layer.masksToBounds = false
        self.positionNumber.layer.borderColor = UIColor.white.cgColor
        self.positionNumber.layer.cornerRadius = self.positionNumber.frame.height/2
        self.contentView.backgroundColor = UIColor.lightGray
        resetProfileView()
    }

    // for use with profiles of a player not a player and position
    func setPlayerData(player: RGBYPlayer) {
        self.player = player
        if player.imageURL.isEmpty {
            // set default pen image
            //FIXME create a player pen icon
            penImage.image = UIImage(named: "AppIcon")
        } else {
            let data = try? Data(contentsOf: URL(string: player.imageURL)!)
            if let imageData = data {
                penImage.image = UIImage(data: imageData)
            }
        }
        self.lastName.text = player.lName
        self.firstName.text = player.fName
        self.position.text = player.preferredPosition.displayName
        self.positionNumber.isHidden = true
        self.penImage.isHidden = false
    }

    // for use with profiles of a specific position
    func setPlayerData(player: RGBYPlayer, position: RGBYPlayerPosition, positionNumber: Int) {
        self.setPlayerData(player: player)
        self.position.text = position.displayName
        self.positionNumber.text = "\(positionNumber)"
    }

    // for use with profiles of a specific position overriding number
    func setPlayerData(player: RGBYPlayer, position: RGBYPlayerPosition) {
        self.setPlayerData(player: player, position: position, positionNumber: position.positionOrderNumber)
    }

    func resetProfileView() {
        self.lastName.text = "Unselected"
        self.firstName.text = ""
        self.position.text = ""
        self.player = nil
        self.positionNumber.isHidden = false
        self.penImage.isHidden = true
    }

    // view defaults
    func enable() {
        self.isEnabled = true
        self.alpha = 1
    }

    func disable() {
        self.isEnabled = false
        self.alpha = 0.7
    }
}
