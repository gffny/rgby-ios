//
//  RGBYInMatchPenaltyInputViewController.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/14/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYInMatchPenaltyInputViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        print("RGBYInMatchIncidentViewController:: viewDidLoad");
    }

    @IBAction func handlePenalty(_ sender: UIButton) {
        // do other task
        print("RGBYInMatchPenaltyInputViewController:: penalty clicked")
        self.dismiss(animated: true, completion: nil)
        // check if the button is in the player button index and assume that it's the unknown player otherwise

    }

    @IBAction func handleGoBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
