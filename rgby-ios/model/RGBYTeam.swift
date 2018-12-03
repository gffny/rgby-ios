//
//  RGBYTeam.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/28/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

class RGBYTeam {
    
    var id: String?
    var title: String?
    var club: RGBYClub?
    var player: [RGBYPlayer] = []

    init(id: String, title:String) {
        self.id = id
        self.title = title
    }

    init(id: String, title: String, club: RGBYClub) {
        self.id = id
        self.title = title
        self.club = club
    }
}
