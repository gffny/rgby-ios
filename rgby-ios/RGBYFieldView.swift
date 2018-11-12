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
    var state: FieldViewInput
    var location: CGPoint

    // initialiser
    override init(frame: CGRect) {
        state = FieldViewInput.FIELD_LOCATION
        location = CGPoint.init(x: 0, y: 0)
        super.init(frame: frame)
    }

    init(frame: CGRect, fieldViewInput: FieldViewInput) {
        self.state = fieldViewInput
        location = CGPoint.init(x: 0, y: 0)
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        state = FieldViewInput.FIELD_LOCATION
        location = CGPoint.init(x: 0, y: 0)
        super.init(coder: aDecoder)
    }
    
    func loadEventTypeDisplayInput() {
        //
        state = FieldViewInput.EVENT_TYPE
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // FIELD_LOCATION?
            // get the location
            // switch the display
        //
        if state == FieldViewInput.FIELD_LOCATION {
            if let touch = touches.first {
                location = touch.location(in: self)
            }
            super.touchesBegan(touches, with: event)
            loadEventTypeDisplayInput()
        }
    }
}

enum FieldViewInput {
    case FIELD_LOCATION
    case EVENT_TYPE
    case EVENT_RESULT
}
