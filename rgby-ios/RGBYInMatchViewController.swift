//
//  RGBYInGameViewController.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/9/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYInMatchViewController: UIViewController {
    
    @IBOutlet weak var fieldView: RGBYFieldView!
    
    @IBOutlet weak var scoreView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("RGBYInGameViewController:: viewDidLoad");
        let fieldTap = UITapGestureRecognizer(target: self, action:  #selector (self.handleFieldTap (_:)))
        self.fieldView.addGestureRecognizer(fieldTap)
    }

    // or for Swift 4
    @objc func handleFieldTap(_ sender:UITapGestureRecognizer){
        // do other task
        print("RGBYInGameViewController:: handleFieldTap")
        let tapLocation1 = sender.location(in: self.view.superview)
        print(tapLocation1.x)
        print(tapLocation1.y)
        
    }
    
}
