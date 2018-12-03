//
//  RGBYMatchDaySquad.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/15/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

class RGBYMatchDaySquad {

    var match: RGBYMatch
    var team: RGBYTeam
    var looseHeadProp: RGBYPlayer?
    var hooker: RGBYPlayer?
    var tightHeadProp: RGBYPlayer?
    var looseHeadSecondRow: RGBYPlayer?
    var tightHeadSecondRow: RGBYPlayer?
    var blindSideFlanker: RGBYPlayer?
    var opensideFlanker: RGBYPlayer?
    var number8: RGBYPlayer?
    var scrumHalf: RGBYPlayer?
    var outHalf: RGBYPlayer?
    var leftWing: RGBYPlayer?
    var insideCenter: RGBYPlayer?
    var outsideCenter: RGBYPlayer?
    var rightWing: RGBYPlayer?
    var fullback: RGBYPlayer?
    var subsitutes: [RGBYPlayer] = []
    var subbedPlayers: [RGBYPlayer] = []
    var bloodBin: [RGBYPlayer] = []
    
    init(match: RGBYMatch, team: RGBYTeam) {
        self.match = match
        self.team = team
    }
    
    init(match: RGBYMatch, team:RGBYTeam, looseHeadProp: RGBYPlayer, hooker: RGBYPlayer, tightHeadProp: RGBYPlayer, looseHeadSecondRow: RGBYPlayer, tightHeadSecondRow: RGBYPlayer, blindSideFlanker: RGBYPlayer, opensideFlanker: RGBYPlayer, number8: RGBYPlayer, scrumHalf: RGBYPlayer, outHalf: RGBYPlayer, leftWing: RGBYPlayer, insideCenter: RGBYPlayer, outsideCenter: RGBYPlayer, rightWing: RGBYPlayer, fullback: RGBYPlayer, subsitutes: [RGBYPlayer]) {
        self.match = match
        self.team = team
        self.looseHeadProp = looseHeadProp
        self.hooker = hooker
        self.tightHeadProp = tightHeadProp
        self.looseHeadSecondRow = looseHeadSecondRow
        self.tightHeadSecondRow = tightHeadSecondRow
        self.blindSideFlanker = blindSideFlanker
        self.opensideFlanker = opensideFlanker
        self.number8 = number8
        self.scrumHalf = scrumHalf
        self.outHalf = outHalf
        self.leftWing = leftWing
        self.insideCenter = insideCenter
        self.outsideCenter = outsideCenter
        self.rightWing = rightWing
        self.fullback = fullback
        self.subsitutes = subsitutes
        self.subbedPlayers = [RGBYPlayer]()
        self.bloodBin = [RGBYPlayer]()
    }

    var listTeam: [RGBYPlayer] {
        get {
            return [
                self.looseHeadProp!,
                self.hooker!,
                self.tightHeadProp!,
                self.looseHeadSecondRow!,
                self.tightHeadSecondRow!,
                self.blindSideFlanker!,
                self.opensideFlanker!,
                self.number8!,
                self.scrumHalf!,
                self.outHalf!,
                self.leftWing!,
                self.insideCenter!,
                self.outsideCenter!,
                self.rightWing!,
                self.fullback!
            ];
        }
    }
}
