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
            looseHeadProp: RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Cian", lastName: "Healy", preferredPosition: .LOOSE_HEAD_PROP), squadNumber: 1),
            hooker: RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Rory", lastName: "Best", preferredPosition: .HOOKER), squadNumber: 2),
            tightHeadProp: RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Tadhg", lastName: "Furlong", preferredPosition: .TIGHT_HEAD_PROP), squadNumber: 3),
            looseHeadSecondRow: RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "James", lastName: "Ryan", preferredPosition: .SECOND_ROW), squadNumber: 4),
            tightHeadSecondRow: RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Devin", lastName: "Toner", preferredPosition: .SECOND_ROW), squadNumber: 5),
            blindSideFlanker: RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Peter", lastName: "O'Mahoney", preferredPosition: .BLINDSIDE_FLANKER), squadNumber: 6),
            opensideFlanker: RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Dan", lastName: "Leavy", preferredPosition: .OPENSIDE_FLANKER), squadNumber: 7),
            number8: RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "CJ", lastName: "Stander", preferredPosition: .NUMBER_8), squadNumber: 8),
            scrumHalf: RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Kieran", lastName: "Marmion", preferredPosition: .SCRUM_HALF), squadNumber: 9),
            outHalf: RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Johnny", lastName: "Sexton", preferredPosition: .OUT_HALF), squadNumber: 10),
            leftWing: RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Jacob", lastName: "Stockdale", preferredPosition: .LEFT_WING), squadNumber: 11),
            insideCenter: RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Bundee", lastName: "Aki", preferredPosition: .INSIDE_CENTER), squadNumber: 12),
            outsideCenter: RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Gary", lastName: "Ringrose", preferredPosition: .OUTSIDE_CENTER), squadNumber: 13),
            rightWing: RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Keith", lastName: "Earls", preferredPosition: .RIGHT_WING), squadNumber: 14),
            fullback: RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Rob", lastName: "Kearney", preferredPosition: .FULLBACK), squadNumber: 15),
            subsitutes: [
                RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Seán", lastName: "Cronin", preferredPosition: .HOOKER), squadNumber: 16),
                RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Jack", lastName: "McGrath", preferredPosition: .LOOSE_HEAD_PROP), squadNumber: 17),
                RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Andrew", lastName: "Porter", preferredPosition: .TIGHT_HEAD_PROP), squadNumber: 18),
                RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Iain", lastName: "Henderson", preferredPosition: .SECOND_ROW), squadNumber: 19),
                RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Josh", lastName: "van der Flier", preferredPosition: .OPENSIDE_FLANKER), squadNumber: 20),
                RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Luke", lastName: "McGrath", preferredPosition: .SCRUM_HALF), squadNumber: 21),
                RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Joey", lastName: "Carbery", preferredPosition: .OUT_HALF), squadNumber: 22),
                RGBYMatchDaySquadMember(player: RGBYPlayer(firstName: "Jordan", lastName: "Larmour", preferredPosition: .FULLBACK), squadNumber: 23)
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

