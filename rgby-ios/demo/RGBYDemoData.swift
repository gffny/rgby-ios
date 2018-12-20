//
//  RGBYDemoData.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/29/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation
import RealmSwift

class RGBYDemoData {

    // create demoClub
    static var demoClub: RGBYClub = RGBYClub("club-1", "MIT RFC", "https://s3.amazonaws.com/rgby-cch/clublogo.png", Data())
    static var demoOppClub: RGBYClub = RGBYClub("club-2", "Boston NZ Kiwis RFC", "https://s3.amazonaws.com/rgby-cch/nz-kiwis.png", Data())
    // create demoPlayers
    static var demoCH:RGBYPlayer = RGBYPlayer("01", "Cian", "Healy", .LOOSE_HEAD_PROP, "")
    static var demoRB:RGBYPlayer = RGBYPlayer("02", "Rory", "Best", .HOOKER, "")
    static var demoTF:RGBYPlayer = RGBYPlayer("03", "Tadhg", "Furlong", .TIGHT_HEAD_PROP, "")
    static var demoJR:RGBYPlayer = RGBYPlayer("04", "James", "Ryan", .SECOND_ROW, "")
    static var demoDT:RGBYPlayer = RGBYPlayer("05", "Devin", "Toner", .SECOND_ROW, "")
    static var demoPOM:RGBYPlayer = RGBYPlayer("06", "Peter", "O'Mahoney", .BLINDSIDE_FLANKER, "")
    static var demoDL:RGBYPlayer = RGBYPlayer("07", "Dan", "Leavy", .OPENSIDE_FLANKER, "")
    static var demoCJS:RGBYPlayer = RGBYPlayer("09", "CJ", "Stander", .NUMBER_8, "")
    static var demoKM:RGBYPlayer = RGBYPlayer("10", "Kieran", "Marmion", .SCRUM_HALF, "")
    static var demoJSe:RGBYPlayer = RGBYPlayer("11", "Johnny", "Sexton", .OUT_HALF, "")
    static var gffny: RGBYPlayer = RGBYPlayer("12", "John", "Gaffney", .OUT_HALF, "https://pbs.twimg.com/profile_images/901474596909699072/lIXjjFex.jpg")
    static var demoJSt:RGBYPlayer = RGBYPlayer("13", "Jacob", "Stockdale", .LEFT_WING, "")
    static var demoBA:RGBYPlayer = RGBYPlayer("14", "Bundee", "Aki", .INSIDE_CENTER, "")
    static var demoGR:RGBYPlayer = RGBYPlayer("15", "Gary", "Ringrose", .OUTSIDE_CENTER, "")
    static var demoKE:RGBYPlayer = RGBYPlayer("16", "Keith", "Earls", .RIGHT_WING, "")
    static var demoRK:RGBYPlayer = RGBYPlayer("17", "Rob", "Kearney", .FULLBACK, "")
    static var demoSC:RGBYPlayer = RGBYPlayer("18", "Seán", "Cronin", .HOOKER, "")
    static var demoJMcG:RGBYPlayer = RGBYPlayer("19", "Jack", "McGrath", .LOOSE_HEAD_PROP, "")
    static var demoAP:RGBYPlayer = RGBYPlayer("20", "Andrew", "Porter", .TIGHT_HEAD_PROP, "")
    static var demoIH:RGBYPlayer = RGBYPlayer("21", "Iain", "Henderson", .SECOND_ROW, "")
    static var demoJvdF:RGBYPlayer = RGBYPlayer("22", "Josh", "van der Flier", .OPENSIDE_FLANKER, "")
    static var demoLMcG:RGBYPlayer = RGBYPlayer("23", "Luke", "McGrath", .SCRUM_HALF, "")
    static var demoJC:RGBYPlayer = RGBYPlayer("24", "Joey", "Carbery", .OUT_HALF, "")
    static var demoJL:RGBYPlayer = RGBYPlayer("25", "Jordan", "Larmour", .FULLBACK, "")

    static var demoKT:RGBYPlayer = RGBYPlayer("26", "Karl", "Tu'inukuafe", .LOOSE_HEAD_PROP, "")
    static var demoCT:RGBYPlayer = RGBYPlayer("27", "Codie", "Taylor", .HOOKER, "")
    static var demoOF:RGBYPlayer = RGBYPlayer("28", "Owen", "Franks", .TIGHT_HEAD_PROP, "")
    static var demoBR:RGBYPlayer = RGBYPlayer("29", "Brodie", "Retallick", .SECOND_ROW, "")
    static var demoSW:RGBYPlayer = RGBYPlayer("30", "Samuel", "Whitelock", .SECOND_ROW, "")
    static var demoLS:RGBYPlayer = RGBYPlayer("31", "Liam", "Squire", .BLINDSIDE_FLANKER, "")
    static var demoASa:RGBYPlayer = RGBYPlayer("32", "Ardie", "Savea", .OPENSIDE_FLANKER, "")
    static var demoKR:RGBYPlayer = RGBYPlayer("33", "Kieran", "Reid", .NUMBER_8, "")
    static var demoASm:RGBYPlayer = RGBYPlayer("34", "Aaron", "Smith", .SCRUM_HALF, "")
    static var demoBB:RGBYPlayer = RGBYPlayer("35", "Beauden", "Barrett", .OUT_HALF, "")
    static var demoRI:RGBYPlayer = RGBYPlayer("36", "Rieko", "Ioane", .LEFT_WING, "")
    static var demoRC:RGBYPlayer = RGBYPlayer("37", "Ryan", "Crotty", .INSIDE_CENTER, "")
    static var demoJG:RGBYPlayer = RGBYPlayer("38", "Jack", "Goodhue", .OUTSIDE_CENTER, "")
    static var demoBS:RGBYPlayer = RGBYPlayer("39", "Ben", "Smith", .RIGHT_WING, "")
    static var demoDMcK:RGBYPlayer = RGBYPlayer("40", "Damien", "McKenzie", .FULLBACK, "")
    static var demoDC:RGBYPlayer = RGBYPlayer("41", "Dane", "Coles", .HOOKER, "")
    static var demoOT:RGBYPlayer = RGBYPlayer("42", "Ofa", "Tuungafasi", .LOOSE_HEAD_PROP, "")
    static var demoNL:RGBYPlayer = RGBYPlayer("43", "Nepo", "Laulala", .TIGHT_HEAD_PROP, "")
    static var demoSB:RGBYPlayer = RGBYPlayer("44", "Scott", "Barrett", .SECOND_ROW, "")
    static var demoMT:RGBYPlayer = RGBYPlayer("45", "Matt", "Todd", .OPENSIDE_FLANKER, "")
    static var demoTJP:RGBYPlayer = RGBYPlayer("46", "TJ", "Perenara", .SCRUM_HALF, "")
    static var demoRM:RGBYPlayer = RGBYPlayer("47", "Richie", "Mo'unga", .OUT_HALF, "")
    static var demoALB:RGBYPlayer = RGBYPlayer("48", "Anton", "Lienert-Brown", .FULLBACK, "")

//  [demoCH, demoRB, demoTF, demoJR, demoDT, demoPOM, demoDL, demoCJS, demoKM, demoJSe, gffny, demoJSt, demoBA, demoGR, demoKE, demoRK, demoSC, demoJMcG, demoAP, demoIH, demoJvdF, demoLMcG, demoJC, demoJL]
    // create demoTeam
    static var demoTeam:RGBYTeam = RGBYTeam("team-1", "MIT RFC 1st XV", "MITRFC", demoClub, List<RGBYPlayer>())
    static var demoOppTeam:RGBYTeam = RGBYTeam("team-2", "BNZ Kiwis 1st XV", "BNZ Kiwis", demoOppClub, List<RGBYPlayer>())
    
    //var subList: List<RGBYPlayer> = [demoSC, demoJMcG, demoAP, demoIH, demoJvdF, demoLMcG, demoJC, demoJL]
    static var demoMatchDaySquadMIT:RGBYMatchDaySquad = RGBYMatchDaySquad(demoCH, demoRB, demoTF, demoJR, demoDT, demoPOM, demoDL, demoCJS, demoKM, demoJSe, demoJSt, demoBA, demoGR, demoKE, demoRK, List<RGBYPlayer>(), List<RGBYPlayer>(), List<RGBYPlayer>())
    
    //var subList: List<RGBYPlayer> = [demoDC, demoOT, demoNL, demoSB, demoMT, demoTJP, demoRM, demoALB]
    static var demoMatchDaySquadNZ:RGBYMatchDaySquad = RGBYMatchDaySquad(demoKT, demoCT, demoOF, demoBR, demoSW, demoLS, demoASa, demoKR, demoASm, demoBB, demoRI, demoRC, demoJG, demoBS, demoDMcK, List<RGBYPlayer>(), List<RGBYPlayer>(), List<RGBYPlayer>())
    
    static var demoCompetition:RGBYCompetition = RGBYCompetition("comp-1", "NERFU DIII League 2018", List<RGBYTeam>(), List<RGBYMatch>())

    static var demoMatch:RGBYMatch = RGBYMatch("match-1", "MIT RFC vs BNZ Kiwis", RGBYUtils.mmddyyyhhmm().date(from: "03/17/2019 12:00")!, "Briggs Field, Vassar St., Cambridge, MA 02143", demoTeam, demoMatchDaySquadMIT, demoOppTeam, true)
    
    static func demoMatchEventList() -> [RGBYMatchEvent] {
        let evt1 = RGBYMatchEvent(eventPeriod: 1, periodTimeInSec: 365, eventType: .PENALTY, fieldLocation: CGPoint(x: 10, y: 20), subject: nil, subjectPosition: .BLINDSIDE_FLANKER, parentEvent: nil, isMyTeam: false, additionalIncidentType: nil)
        let evt2 = RGBYMatchEvent(eventPeriod: 1, periodTimeInSec: 445, eventType: .KICK_AT_GOAL, fieldLocation: CGPoint(x: 10, y: 20), subject: gffny, subjectPosition: .INSIDE_CENTER, parentEvent: nil, isMyTeam: true, additionalIncidentType: nil)
        let evt3 = RGBYMatchEvent(eventPeriod: 1, periodTimeInSec: 1065, eventType: .PENALTY, fieldLocation: CGPoint(x: 10, y: 20), subject: nil, subjectPosition: .FULLBACK, parentEvent: nil, isMyTeam: false, additionalIncidentType: nil)
        let evt4 = RGBYMatchEvent(eventPeriod: 1, periodTimeInSec: 1354, eventType: .TRY, fieldLocation: CGPoint(x: 10, y: 20), subject: demoGR, subjectPosition: .OUTSIDE_CENTER, parentEvent: nil, isMyTeam: true, additionalIncidentType: nil)
        let evt5 = RGBYMatchEvent(eventPeriod: 1, periodTimeInSec: 1856, eventType: .CONVERSION, fieldLocation: CGPoint(x: 10, y: 20), subject: gffny, subjectPosition: .INSIDE_CENTER, parentEvent: nil, isMyTeam: true, additionalIncidentType: nil)
        let evt6 = RGBYMatchEvent(eventPeriod: 1, periodTimeInSec: 2345, eventType: .KICK_AT_GOAL, fieldLocation: CGPoint(x: 10, y: 20), subject: nil, subjectPosition: .OUT_HALF, parentEvent: nil, isMyTeam: false, additionalIncidentType: nil)
        let evt7 = RGBYMatchEvent(eventPeriod: 1, periodTimeInSec: 2565, eventType: .PENALTY, fieldLocation: CGPoint(x: 10, y: 20), subject: nil, subjectPosition: .BLINDSIDE_FLANKER, parentEvent: nil, isMyTeam: false, additionalIncidentType: nil)
        let evt8 = RGBYMatchEvent(eventPeriod: 2, periodTimeInSec: 445, eventType: .KICK_AT_GOAL, fieldLocation: CGPoint(x: 10, y: 20), subject: gffny, subjectPosition: .INSIDE_CENTER, parentEvent: nil, isMyTeam: true, additionalIncidentType: nil)
        let evt9 = RGBYMatchEvent(eventPeriod: 2, periodTimeInSec: 1065, eventType: .PENALTY, fieldLocation: CGPoint(x: 10, y: 20), subject: nil, subjectPosition: .FULLBACK, parentEvent: nil, isMyTeam: false, additionalIncidentType: nil)
        let evt10 = RGBYMatchEvent(eventPeriod: 2, periodTimeInSec: 1354, eventType: .TRY, fieldLocation: CGPoint(x: 10, y: 20), subject: demoGR, subjectPosition: .OUTSIDE_CENTER, parentEvent: nil, isMyTeam: true, additionalIncidentType: nil)
        let evt11 = RGBYMatchEvent(eventPeriod: 2, periodTimeInSec: 1856, eventType: .CONVERSION, fieldLocation: CGPoint(x: 10, y: 20), subject: gffny, subjectPosition: .INSIDE_CENTER, parentEvent: nil, isMyTeam: true, additionalIncidentType: nil)
        let evt12 = RGBYMatchEvent(eventPeriod: 2, periodTimeInSec: 2345, eventType: .KICK_AT_GOAL, fieldLocation: CGPoint(x: 10, y: 20), subject: nil, subjectPosition: .OUT_HALF, parentEvent: nil, isMyTeam: false, additionalIncidentType: nil)
        return [evt1, evt2, evt3, evt4, evt5, evt6, evt7, evt8, evt9, evt10, evt11, evt12]
    }

    static func loadDemoData(in realm: Realm = try! Realm()) {
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoCH)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoRB)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoTF)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoJR)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoDT)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoPOM)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoDL)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoCJS)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoKM)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoJSe)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.gffny)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoJSt)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoBA)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoGR)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoKE)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoRK)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoSC)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoJMcG)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoAP)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoIH)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoJvdF)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoLMcG)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoJC)
        RGBYDemoData.demoTeam.playerList.append(RGBYDemoData.demoJL)
        for (_, player) in RGBYDemoData.demoTeam.playerList.enumerated() {
            RGBYPlayer.create(player: player, in: realm)
        }
        RGBYDemoData.demoCompetition.fixtureList.append(RGBYDemoData.demoMatch)
        RGBYDemoData.demoCompetition.teamList.append(RGBYDemoData.demoTeam)
        RGBYClub.update(club: RGBYDemoData.demoClub, in: realm)
        RGBYClub.update(club: RGBYDemoData.demoOppClub, in: realm)
        RGBYTeam.update(team: RGBYDemoData.demoTeam, in: realm)
        RGBYMatch.update(match: RGBYDemoData.demoMatch, in: realm)
        RGBYCompetition.update(competition: RGBYDemoData.demoCompetition, in: realm)
    }
}
