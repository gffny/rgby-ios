//
//  RGBYCompetition.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/28/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

class RGBYCompetition {
    
    // 2018 New England DIII League
    var id: String?
    var title: String?
    var teamList: [RGBYTeam] = []
    var fixtureList: [RGBYMatch] = []

    init(id: String, title: String) {
        self.id = id
        self.title = title
    }
}
