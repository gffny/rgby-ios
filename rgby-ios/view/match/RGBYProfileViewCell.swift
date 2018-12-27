//
//  RGBYProfileViewCell.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/26/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYProfileViewCell: UITableViewCell {

    static var nibName = "RGBYProfileViewCell"

    // image data
    @IBOutlet weak var penImage: UIImageView!
    @IBOutlet weak var squadNumber: UILabel!

    // profile data
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var preferredPosition: UILabel!
    
    var player: RGBYPlayer? {
        didSet {
            self.lastName.text = player?.lName
            self.firstName.text = player?.fName
            self.preferredPosition.text = player?.preferredPosition.displayName
            // set default pen image
            //FIXME create a player pen icon
            penImage.image = UIImage(named: "AppIcon")
            if player != nil && !player!.imageURL.isEmpty {
                let data = try? Data(contentsOf: URL(string: player!.imageURL)!)
                if let imageData = data {
                    penImage.image = UIImage(data: imageData)
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.penImage.image = UIImage(named: "AppIcon")
        self.penImage.layer.borderWidth = 3
        self.penImage.layer.masksToBounds = false
        self.penImage.layer.borderColor = UIColor.white.cgColor
        self.penImage.layer.cornerRadius = self.penImage.frame.height/2
        self.penImage.clipsToBounds = true
        self.squadNumber.layer.borderWidth = 3
        self.squadNumber.layer.masksToBounds = false
        self.squadNumber.layer.borderColor = UIColor.white.cgColor
        self.squadNumber.layer.cornerRadius = self.squadNumber.frame.height/2
        self.contentView.backgroundColor = UIColor.lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
