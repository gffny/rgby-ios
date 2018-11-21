//
//  RGBYMatchDaySquad.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/15/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

class RGBYMatchDaySquad {
    
    var _looseHeadProp: RGBYPlayer
    var _hooker: RGBYPlayer
    var _tightHeadProp: RGBYPlayer
    var _looseHeadSecondRow: RGBYPlayer
    var _tightHeadSecondRow: RGBYPlayer
    var _blindSideFlanker: RGBYPlayer
    var _opensideFlanker: RGBYPlayer
    var _number8: RGBYPlayer
    var _scrumHalf: RGBYPlayer
    var _outHalf: RGBYPlayer
    var _leftWing: RGBYPlayer
    var _insideCenter: RGBYPlayer
    var _outsideCenter: RGBYPlayer
    var _rightWing: RGBYPlayer
    var _fullback: RGBYPlayer
    var _subsitutes: [RGBYPlayer]
    var _subbedPlayers: [RGBYPlayer]
    var _bloodBin: [RGBYPlayer]
    
    init(looseHeadProp: RGBYPlayer, hooker: RGBYPlayer, tightHeadProp: RGBYPlayer, looseHeadSecondRow: RGBYPlayer, tightHeadSecondRow: RGBYPlayer, blindSideFlanker: RGBYPlayer, opensideFlanker: RGBYPlayer, number8: RGBYPlayer, scrumHalf: RGBYPlayer, outHalf: RGBYPlayer, leftWing: RGBYPlayer, insideCenter: RGBYPlayer, outsideCenter: RGBYPlayer, rightWing: RGBYPlayer, fullback: RGBYPlayer, subsitutes: [RGBYPlayer]) {
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
        _subbedPlayers = [RGBYPlayer]()
        _bloodBin = [RGBYPlayer]()
    }
    
    var listTeam: [RGBYPlayer] {
        get {
            return [_looseHeadProp, _hooker, _tightHeadProp, _looseHeadSecondRow, _tightHeadSecondRow, _blindSideFlanker, _opensideFlanker, _number8, _scrumHalf, _outHalf, _leftWing, _insideCenter, _outsideCenter, _rightWing, _fullback];
        }
    }
    
    var looseHeadProp: RGBYPlayer {
        get {
            return _looseHeadProp
        }
    }
}
