//
//  RGBYDemoData.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/29/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

class RGBYDemoData {
    
    static var demoClub:RGBYClub = RGBYClub(id: "club-1", title: "MIT RFC", imageURL: URL(fileURLWithPath: "http://rugby.mit.edu/sites/all/themes/danland/logo.png"))
    static var demoTeam:RGBYTeam = RGBYTeam(id: "team-1", title: "MIT RFC 1st XV", club: demoClub)
    static var demoOppTeam:RGBYTeam = RGBYTeam(id: "team-2", title: "Boston NZ Kiwis RFC 1st XV")
    static var demoCompetition:RGBYCompetition = RGBYCompetition(id: "comp-1", title: "NERFU DIII League 2018")
    static var demoMatch:RGBYMatch = RGBYMatch(id: "match-1", title: "The Match?", date: Date(), location: "Briggs Field, Vassar St., Cambridge, MA 02143", homeTeam: demoTeam, awayTeam: demoOppTeam)

    static var demoMatchDaySquadMIT:RGBYMatchDaySquad = RGBYMatchDaySquad(match: demoMatch, team: demoTeam, looseHeadProp: demoCH, hooker: demoRB, tightHeadProp: demoTF, looseHeadSecondRow: demoJR, tightHeadSecondRow: demoDT, blindSideFlanker: demoPOM, opensideFlanker: demoDL, number8: demoCJS, scrumHalf: demoKM, outHalf: demoJSe, leftWing: demoJSt, insideCenter: demoBA, outsideCenter: demoGR, rightWing: demoKE, fullback: demoRK, subsitutes: [demoSC, demoJMcG, demoAP, demoIH, demoJvdF, demoLMcG, demoJC, demoJL])
    
    static var demoCH:RGBYPlayer = RGBYPlayer(firstName: "Cian", lastName: "Healy", preferredPosition: .LOOSE_HEAD_PROP);
    static var demoRB:RGBYPlayer = RGBYPlayer(firstName: "Rory", lastName: "Best", preferredPosition: .HOOKER)
    static var demoTF:RGBYPlayer = RGBYPlayer(firstName: "Tadhg", lastName: "Furlong", preferredPosition: .TIGHT_HEAD_PROP)
    static var demoJR:RGBYPlayer = RGBYPlayer(firstName: "James", lastName: "Ryan", preferredPosition: .SECOND_ROW)
    static var demoDT:RGBYPlayer = RGBYPlayer(firstName: "Devin", lastName: "Toner", preferredPosition: .SECOND_ROW)
    static var demoPOM:RGBYPlayer = RGBYPlayer(firstName: "Peter", lastName: "O'Mahoney", preferredPosition: .BLINDSIDE_FLANKER)
    static var demoDL:RGBYPlayer = RGBYPlayer(firstName: "Dan", lastName: "Leavy", preferredPosition: .OPENSIDE_FLANKER)
    static var demoCJS:RGBYPlayer = RGBYPlayer(firstName: "CJ", lastName: "Stander", preferredPosition: .NUMBER_8)
    static var demoKM:RGBYPlayer = RGBYPlayer(firstName: "Kieran", lastName: "Marmion", preferredPosition: .SCRUM_HALF)
    static var demoJSe:RGBYPlayer = RGBYPlayer(firstName: "Johnny", lastName: "Sexton", preferredPosition: .OUT_HALF)
    static var demoJSt:RGBYPlayer = RGBYPlayer(firstName: "Jacob", lastName: "Stockdale", preferredPosition: .LEFT_WING)
    static var demoBA:RGBYPlayer = RGBYPlayer(firstName: "Bundee", lastName: "Aki", preferredPosition: .INSIDE_CENTER)
    static var demoGR:RGBYPlayer = RGBYPlayer(firstName: "Gary", lastName: "Ringrose", preferredPosition: .OUTSIDE_CENTER)
    static var demoKE:RGBYPlayer = RGBYPlayer(firstName: "Keith", lastName: "Earls", preferredPosition: .RIGHT_WING)
    static var demoRK:RGBYPlayer = RGBYPlayer(firstName: "Rob", lastName: "Kearney", preferredPosition: .FULLBACK)
    static var demoSC:RGBYPlayer = RGBYPlayer(firstName: "Seán", lastName: "Cronin", preferredPosition: .HOOKER)
    static var demoJMcG:RGBYPlayer = RGBYPlayer(firstName: "Jack", lastName: "McGrath", preferredPosition: .LOOSE_HEAD_PROP)
    static var demoAP:RGBYPlayer = RGBYPlayer(firstName: "Andrew", lastName: "Porter", preferredPosition: .TIGHT_HEAD_PROP)
    static var demoIH:RGBYPlayer = RGBYPlayer(firstName: "Iain", lastName: "Henderson", preferredPosition: .SECOND_ROW)
    static var demoJvdF:RGBYPlayer = RGBYPlayer(firstName: "Josh", lastName: "van der Flier", preferredPosition: .OPENSIDE_FLANKER)
    static var demoLMcG:RGBYPlayer = RGBYPlayer(firstName: "Luke", lastName: "McGrath", preferredPosition: .SCRUM_HALF)
   static var demoJC:RGBYPlayer = RGBYPlayer(firstName: "Joey", lastName: "Carbery", preferredPosition: .OUT_HALF)
    static var demoJL:RGBYPlayer = RGBYPlayer(firstName: "Jordan", lastName: "Larmour", preferredPosition: .FULLBACK)

    static var demoMatchDaySquadNZ:RGBYMatchDaySquad = RGBYMatchDaySquad(match: demoMatch, team: demoOppTeam, looseHeadProp: demoKT, hooker: demoCT, tightHeadProp: demoOF, looseHeadSecondRow: demoBR, tightHeadSecondRow: demoSW, blindSideFlanker: demoLS, opensideFlanker: demoASa, number8: demoKR, scrumHalf: demoASm, outHalf: demoBB, leftWing: demoRI, insideCenter: demoRC, outsideCenter: demoJG, rightWing: demoBS, fullback: demoDMcK, subsitutes: [demoDC, demoOT, demoNL, demoSB, demoMT, demoTJP, demoRM, demoALB])
    
    static var demoKT:RGBYPlayer = RGBYPlayer(firstName: "Karl", lastName: "Tu'inukuafe", preferredPosition: .LOOSE_HEAD_PROP)
    static var demoCT:RGBYPlayer = RGBYPlayer(firstName: "Codie", lastName: "Taylor", preferredPosition: .HOOKER)
    static var demoOF:RGBYPlayer = RGBYPlayer(firstName: "Owen", lastName: "Franks", preferredPosition: .TIGHT_HEAD_PROP)
    static var demoBR:RGBYPlayer = RGBYPlayer(firstName: "Brodie", lastName: "Retallick", preferredPosition: .SECOND_ROW)
    static var demoSW:RGBYPlayer = RGBYPlayer(firstName: "Samuel", lastName: "Whitelock", preferredPosition: .SECOND_ROW)
    static var demoLS:RGBYPlayer = RGBYPlayer(firstName: "Liam", lastName: "Squire", preferredPosition: .BLINDSIDE_FLANKER)
    static var demoASa:RGBYPlayer = RGBYPlayer(firstName: "Ardie", lastName: "Savea", preferredPosition: .OPENSIDE_FLANKER)
    static var demoKR:RGBYPlayer = RGBYPlayer(firstName: "Kieran", lastName: "Reid", preferredPosition: .NUMBER_8)
    static var demoASm:RGBYPlayer = RGBYPlayer(firstName: "Aaron", lastName: "Smith", preferredPosition: .SCRUM_HALF)
    static var demoBB:RGBYPlayer = RGBYPlayer(firstName: "Beauden", lastName: "Barrett", preferredPosition: .OUT_HALF)
    static var demoRI:RGBYPlayer = RGBYPlayer(firstName: "Rieko", lastName: "Ioane", preferredPosition: .LEFT_WING)
    static var demoRC:RGBYPlayer = RGBYPlayer(firstName: "Ryan", lastName: "Crotty", preferredPosition: .INSIDE_CENTER)
    static var demoJG:RGBYPlayer = RGBYPlayer(firstName: "Jack", lastName: "Goodhue", preferredPosition: .OUTSIDE_CENTER)
    static var demoBS:RGBYPlayer = RGBYPlayer(firstName: "Ben", lastName: "Smith", preferredPosition: .RIGHT_WING)
    static var demoDMcK:RGBYPlayer = RGBYPlayer(firstName: "Damien", lastName: "McKenzie", preferredPosition: .FULLBACK)
    static var demoDC:RGBYPlayer = RGBYPlayer(firstName: "Dane", lastName: "Coles", preferredPosition: .HOOKER)
    static var demoOT:RGBYPlayer = RGBYPlayer(firstName: "Ofa", lastName: "Tuungafasi", preferredPosition: .LOOSE_HEAD_PROP)
    static var demoNL:RGBYPlayer = RGBYPlayer(firstName: "Nepo", lastName: "Laulala", preferredPosition: .TIGHT_HEAD_PROP)
    static var demoSB:RGBYPlayer = RGBYPlayer(firstName: "Scott", lastName: "Barrett", preferredPosition: .SECOND_ROW)
    static var demoMT:RGBYPlayer = RGBYPlayer(firstName: "Matt", lastName: "Todd", preferredPosition: .OPENSIDE_FLANKER)
    static var demoTJP:RGBYPlayer = RGBYPlayer(firstName: "TJ", lastName: "Perenara", preferredPosition: .SCRUM_HALF)
    static var demoRM:RGBYPlayer = RGBYPlayer(firstName: "Richie", lastName: "Mo'unga", preferredPosition: .OUT_HALF)
    static var demoALB:RGBYPlayer = RGBYPlayer(firstName: "Anton", lastName: "Lienert-Brown", preferredPosition: .FULLBACK)
    
    static var demoMatchDetail: RGBYMatchDetail = RGBYMatchDetail(match: demoMatch, myMatchDaySquad: demoMatchDaySquadMIT, oppMatchDaySquad: demoMatchDaySquadNZ)
}
