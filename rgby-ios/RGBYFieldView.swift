//
//  RGBYFieldView.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/11/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import UIKit

class RGBYFieldView: UIView {

    // state { field location input, event type input, event result input }
    var fieldLocation: CGPoint

    // initialiser
    override init(frame: CGRect) {
        fieldLocation = CGPoint.init(x: 0, y: 0)
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fieldLocation = CGPoint.init(x: 0, y: 0)
        super.init(coder: aDecoder)
    }
    
    func loadEventTypeDisplayInput() {
        //
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        if let touch = touches.first {
            fieldLocation = touch.location(in: self)
        }
        super.touchesBegan(touches, with: event)
        loadEventTypeDisplayInput()
    }
}
