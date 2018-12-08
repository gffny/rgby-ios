//
//  RGBYPlayer.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/15/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

class RGBYPlayer {

    var id: String
    var firstName: String
    var lastName: String
    var preferredPosition: RGBYPlayerPosition
    var imageURL: URL?
    
    init(id: String, firstName: String, lastName: String, preferredPosition: RGBYPlayerPosition) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.preferredPosition = preferredPosition
    }

    init(id: String, firstName: String, lastName: String, preferredPosition: RGBYPlayerPosition, imageURL: URL?) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.preferredPosition = preferredPosition
        self.imageURL = imageURL
    }
}
