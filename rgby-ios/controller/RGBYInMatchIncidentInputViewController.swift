//
//  RGBYInMatchIncidentViewController.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/14/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYInMatchIncidentInputViewController: UIViewController  {
    
//    @IBOutlet weak var penaltyButton: UIButton!
    var tapLocation: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        print("RGBYInMatchIncidentViewController:: viewDidLoad");
    }

    @IBAction func handlePenalty(_ sender: Any) {
        print("RGBYInMatchIncidentViewController:: penalty clicked")
        performSegue(withIdentifier: "presentPenaltyInput", sender: self)
    }
    
    @IBAction func handleFoul(_ sender: Any) {
    }
    
    @IBAction func handleScore(_ sender: Any) {
        print("RGBYInMatchIncidentViewController:: score clicked")
        performSegue(withIdentifier: "presentScoreInput", sender: self)
    }

    @IBAction func handleTurnOver(_ sender: Any) {
    }
    
    @IBAction func handleTackleOrMiss(_ sender: Any) {
    }

    @IBAction func handleGoBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is RGBYInMatchPenaltyInputViewController {
            let vc = segue.destination as? RGBYInMatchPenaltyInputViewController
            vc?.tapLocation = self.tapLocation
            vc?.loadingModalVC = self
        } else if segue.destination is RGBYInMatchScoreInputViewContoller {
            let vc = segue.destination as? RGBYInMatchScoreInputViewContoller
            vc?.tapLocation = self.tapLocation
            vc?.loadingModalVC = self
        }
    }
}
