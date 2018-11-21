//
//  RGBYPlayer.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/15/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

class RGBYPlayer {
    
    var _firstName: String
    var _lastName: String
    var _preferredPosition: RGBYPlayerPosition
    var _imageURL: URL?
    
    init(firstName: String, lastName: String, preferredPosition: RGBYPlayerPosition) {
        _firstName = firstName
        _lastName = lastName
        _preferredPosition = preferredPosition
        _imageURL = nil
    }

    init(firstName: String, lastName: String, preferredPosition: RGBYPlayerPosition, imageURL: URL?) {
        _firstName = firstName
        _lastName = lastName
        _preferredPosition = preferredPosition
        _imageURL = imageURL
    }
}
