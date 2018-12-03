//
//  RGBYMatch.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/28/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

class RGBYMatch {
    
    var id: String?
    var title: String?
    var date: Date?
    var location: String?
    var homeTeam: RGBYTeam?
    var awayTeam: RGBYTeam?
    
    init(id: String, title: String, date: Date, location: String, homeTeam: RGBYTeam, awayTeam: RGBYTeam) {
        self.id = id
        self.title = title
        self.date = date
        self.location = location
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
    }
}
