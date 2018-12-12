//
//  RGBYTeam.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/28/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

class RGBYTeam: Codable {
    
    var id: String?
    var title: String?
    private var _shortTitle: String?
    var club: RGBYClub?
    var playerList: [RGBYPlayer] = []

    init(id: String, title:String, shortTitle: String) {
        self.id = id
        self.title = title
        self._shortTitle = shortTitle
    }

    init(id: String, title: String, shortTitle: String, club: RGBYClub) {
        self.id = id
        self.title = title
        self._shortTitle = shortTitle
        self.club = club
    }
    
    init(id: String, title:String, shortTitle: String, club: RGBYClub, playerList: [RGBYPlayer]) {
        self.id = id
        self.title = title
        self._shortTitle = shortTitle
        self.club = club
        self.playerList = playerList
    }

    var shortTitle: String {
        get {
            if (self._shortTitle ?? "").isEmpty {
                return self.title!
            }
            return self._shortTitle!
        }
    }
}
