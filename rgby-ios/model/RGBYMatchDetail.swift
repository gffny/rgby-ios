//
//  RGBYMatchDetail.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/14/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation
import CoreGraphics

class RGBYMatchDetail {
    
    static let sharedInstance = RGBYMatchDetail()
    private var _myTeamScore: Int = 0
    private var _oppositionTeamScore: Int = 0
    private var _matchEventArray = [RGBYMatchEvent]()
    private var _myTeam = [RGBYPlayer]()
    private var _oppositionTeam = [RGBYPlayer]()
    private var _myTeamMatchDaySquad: RGBYMatchDaySquad
    private var _oppositionTeamMatchDaySquad = [RGBYPlayer]()
    
    init() {
        _myTeamMatchDaySquad = RGBYMatchDaySquad(
            looseHeadProp: RGBYPlayer(firstName: "Cian", lastName: "Healy", preferredPosition: .LOOSE_HEAD_PROP),
            hooker: RGBYPlayer(firstName: "Rory", lastName: "Best", preferredPosition: .HOOKER),
            tightHeadProp: RGBYPlayer(firstName: "Tadhg", lastName: "Furlong", preferredPosition: .TIGHT_HEAD_PROP),
            looseHeadSecondRow: RGBYPlayer(firstName: "James", lastName: "Ryan", preferredPosition: .SECOND_ROW),
            tightHeadSecondRow: RGBYPlayer(firstName: "Devin", lastName: "Toner", preferredPosition: .SECOND_ROW),
            blindSideFlanker: RGBYPlayer(firstName: "Peter", lastName: "O'Mahoney", preferredPosition: .BLINDSIDE_FLANKER),
            opensideFlanker: RGBYPlayer(firstName: "Dan", lastName: "Leavy", preferredPosition: .OPENSIDE_FLANKER),
            number8: RGBYPlayer(firstName: "CJ", lastName: "Stander", preferredPosition: .NUMBER_8),
            scrumHalf: RGBYPlayer(firstName: "Kieran", lastName: "Marmion", preferredPosition: .SCRUM_HALF),
            outHalf: RGBYPlayer(firstName: "Johnny", lastName: "Sexton", preferredPosition: .OUT_HALF),
            leftWing: RGBYPlayer(firstName: "Jacob", lastName: "Stockdale", preferredPosition: .LEFT_WING),
            insideCenter: RGBYPlayer(firstName: "Bundee", lastName: "Aki", preferredPosition: .INSIDE_CENTER),
            outsideCenter: RGBYPlayer(firstName: "Gary", lastName: "Ringrose", preferredPosition: .OUTSIDE_CENTER),
            rightWing: RGBYPlayer(firstName: "Keith", lastName: "Earls", preferredPosition: .RIGHT_WING),
            fullback: RGBYPlayer(firstName: "Rob", lastName: "Kearney", preferredPosition: .FULLBACK),
            subsitutes: [
                RGBYPlayer(firstName: "Seán", lastName: "Cronin", preferredPosition: .HOOKER),
                RGBYPlayer(firstName: "Jack", lastName: "McGrath", preferredPosition: .LOOSE_HEAD_PROP),
                RGBYPlayer(firstName: "Andrew", lastName: "Porter", preferredPosition: .TIGHT_HEAD_PROP),
                RGBYPlayer(firstName: "Iain", lastName: "Henderson", preferredPosition: .SECOND_ROW),
                RGBYPlayer(firstName: "Josh", lastName: "van der Flier", preferredPosition: .OPENSIDE_FLANKER),
                RGBYPlayer(firstName: "Luke", lastName: "McGrath", preferredPosition: .SCRUM_HALF),
                RGBYPlayer(firstName: "Joey", lastName: "Carbery", preferredPosition: .OUT_HALF),
                RGBYPlayer(firstName: "Jordan", lastName: "Larmour", preferredPosition: .FULLBACK)
            ])
    }

    var myTeamScore: Int {
        set {
            _myTeamScore = newValue
            NotificationCenter.default.post(name: .matchDetailDataUpdateNotification, object: nil)
        }
        get {
            return _myTeamScore
        }
    }

    var oppositionTeamScore: Int {
        set {
            _oppositionTeamScore = newValue
            NotificationCenter.default.post(name: .matchDetailDataUpdateNotification, object: nil)
        }
        get {
            return _oppositionTeamScore
        }
    }

    var matchEventArray: [RGBYMatchEvent] {
        get {
            return _matchEventArray
        }
        set {
            _matchEventArray = newValue
            NotificationCenter.default.post(name: .matchDetailDataUpdateNotification, object: nil)
        }
    }
    
    var myTeamMatchDaySquad: RGBYMatchDaySquad {
        get {
            return _myTeamMatchDaySquad
        }
    }
}

extension Notification.Name {
    static let matchDetailDataUpdateNotification = Notification.Name(rawValue: "RGBYMatchDetailDataUpdate")
}

