//
//  RGBYMatchDaySquad.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/15/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

class RGBYMatchDaySquad {
    
    var _teamTitle: String?
    var _looseHeadProp: RGBYMatchDaySquadMember
    var _hooker: RGBYMatchDaySquadMember
    var _tightHeadProp: RGBYMatchDaySquadMember
    var _looseHeadSecondRow: RGBYMatchDaySquadMember
    var _tightHeadSecondRow: RGBYMatchDaySquadMember
    var _blindSideFlanker: RGBYMatchDaySquadMember
    var _opensideFlanker: RGBYMatchDaySquadMember
    var _number8: RGBYMatchDaySquadMember
    var _scrumHalf: RGBYMatchDaySquadMember
    var _outHalf: RGBYMatchDaySquadMember
    var _leftWing: RGBYMatchDaySquadMember
    var _insideCenter: RGBYMatchDaySquadMember
    var _outsideCenter: RGBYMatchDaySquadMember
    var _rightWing: RGBYMatchDaySquadMember
    var _fullback: RGBYMatchDaySquadMember
    var _subsitutes: [RGBYMatchDaySquadMember]
    var _subbedPlayers: [RGBYMatchDaySquadMember]
    var _bloodBin: [RGBYMatchDaySquadMember]
    
    init(looseHeadProp: RGBYMatchDaySquadMember, hooker: RGBYMatchDaySquadMember, tightHeadProp: RGBYMatchDaySquadMember, looseHeadSecondRow: RGBYMatchDaySquadMember, tightHeadSecondRow: RGBYMatchDaySquadMember, blindSideFlanker: RGBYMatchDaySquadMember, opensideFlanker: RGBYMatchDaySquadMember, number8: RGBYMatchDaySquadMember, scrumHalf: RGBYMatchDaySquadMember, outHalf: RGBYMatchDaySquadMember, leftWing: RGBYMatchDaySquadMember, insideCenter: RGBYMatchDaySquadMember, outsideCenter: RGBYMatchDaySquadMember, rightWing: RGBYMatchDaySquadMember, fullback: RGBYMatchDaySquadMember, subsitutes: [RGBYMatchDaySquadMember], teamTitle: String?) {
        _looseHeadProp = looseHeadProp
        _hooker = hooker
        _tightHeadProp = tightHeadProp
        _looseHeadSecondRow = looseHeadSecondRow
        _tightHeadSecondRow = tightHeadSecondRow
        _blindSideFlanker = blindSideFlanker
        _opensideFlanker = opensideFlanker
        _number8 = number8
        _scrumHalf = scrumHalf
        _outHalf = outHalf
        _leftWing = leftWing
        _insideCenter = insideCenter
        _outsideCenter = outsideCenter
        _rightWing = rightWing
        _fullback = fullback
        _subsitutes = subsitutes
        _subbedPlayers = [RGBYMatchDaySquadMember]()
        _bloodBin = [RGBYMatchDaySquadMember]()
        _teamTitle = teamTitle
    }

    var listTeam: [RGBYMatchDaySquadMember] {
        get {
            return [_looseHeadProp, _hooker, _tightHeadProp, _looseHeadSecondRow, _tightHeadSecondRow, _blindSideFlanker, _opensideFlanker, _number8, _scrumHalf, _outHalf, _leftWing, _insideCenter, _outsideCenter, _rightWing, _fullback];
        }
    }

    var looseHeadProp: RGBYMatchDaySquadMember {
        get {
            return _looseHeadProp
        }
    }
}
