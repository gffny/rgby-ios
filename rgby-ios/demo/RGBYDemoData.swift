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
    static var demoOppTeam:RGBYTeam = RGBYTeam(id: "team-2", title: "Boston NZ Kiwis RFC 1st XV", shortTitle: "BNZ Kiwi")
    static var demoCompetition:RGBYCompetition = RGBYCompetition(id: "comp-1", title: "NERFU DIII League 2018")
    
    static var demoCH:RGBYPlayer = RGBYPlayer(id: "01", firstName: "Cian", lastName: "Healy", preferredPosition: .LOOSE_HEAD_PROP);
    static var demoRB:RGBYPlayer = RGBYPlayer(id: "02", firstName: "Rory", lastName: "Best", preferredPosition: .HOOKER)
    static var demoTF:RGBYPlayer = RGBYPlayer(id: "03", firstName: "Tadhg", lastName: "Furlong", preferredPosition: .TIGHT_HEAD_PROP)
    static var demoJR:RGBYPlayer = RGBYPlayer(id: "04", firstName: "James", lastName: "Ryan", preferredPosition: .SECOND_ROW)
    static var demoDT:RGBYPlayer = RGBYPlayer(id: "05", firstName: "Devin", lastName: "Toner", preferredPosition: .SECOND_ROW)
    static var demoPOM:RGBYPlayer = RGBYPlayer(id: "06", firstName: "Peter", lastName: "O'Mahoney", preferredPosition: .BLINDSIDE_FLANKER)
    static var demoDL:RGBYPlayer = RGBYPlayer(id: "07", firstName: "Dan", lastName: "Leavy", preferredPosition: .OPENSIDE_FLANKER)
    static var demoCJS:RGBYPlayer = RGBYPlayer(id: "09", firstName: "CJ", lastName: "Stander", preferredPosition: .NUMBER_8)
    static var demoKM:RGBYPlayer = RGBYPlayer(id: "10", firstName: "Kieran", lastName: "Marmion", preferredPosition: .SCRUM_HALF)
    static var demoJSe:RGBYPlayer = RGBYPlayer(id: "11", firstName: "Johnny", lastName: "Sexton", preferredPosition: .OUT_HALF)
    static var gffny: RGBYPlayer = RGBYPlayer(id: "12", firstName: "John", lastName: "Gaffney", preferredPosition: .OUT_HALF, imageURL: URL(string: "https://pbs.twimg.com/profile_images/901474596909699072/lIXjjFex.jpg"))
    static var demoJSt:RGBYPlayer = RGBYPlayer(id: "13", firstName: "Jacob", lastName: "Stockdale", preferredPosition: .LEFT_WING)
    static var demoBA:RGBYPlayer = RGBYPlayer(id: "14", firstName: "Bundee", lastName: "Aki", preferredPosition: .INSIDE_CENTER)
    static var demoGR:RGBYPlayer = RGBYPlayer(id: "15", firstName: "Gary", lastName: "Ringrose", preferredPosition: .OUTSIDE_CENTER)
    static var demoKE:RGBYPlayer = RGBYPlayer(id: "16", firstName: "Keith", lastName: "Earls", preferredPosition: .RIGHT_WING)
    static var demoRK:RGBYPlayer = RGBYPlayer(id: "17", firstName: "Rob", lastName: "Kearney", preferredPosition: .FULLBACK)
    static var demoSC:RGBYPlayer = RGBYPlayer(id: "18", firstName: "Seán", lastName: "Cronin", preferredPosition: .HOOKER)
    static var demoJMcG:RGBYPlayer = RGBYPlayer(id: "19", firstName: "Jack", lastName: "McGrath", preferredPosition: .LOOSE_HEAD_PROP)
    static var demoAP:RGBYPlayer = RGBYPlayer(id: "20", firstName: "Andrew", lastName: "Porter", preferredPosition: .TIGHT_HEAD_PROP)
    static var demoIH:RGBYPlayer = RGBYPlayer(id: "21", firstName: "Iain", lastName: "Henderson", preferredPosition: .SECOND_ROW)
    static var demoJvdF:RGBYPlayer = RGBYPlayer(id: "22", firstName: "Josh", lastName: "van der Flier", preferredPosition: .OPENSIDE_FLANKER)
    static var demoLMcG:RGBYPlayer = RGBYPlayer(id: "23", firstName: "Luke", lastName: "McGrath", preferredPosition: .SCRUM_HALF)
    static var demoJC:RGBYPlayer = RGBYPlayer(id: "24", firstName: "Joey", lastName: "Carbery", preferredPosition: .OUT_HALF)
    static var demoJL:RGBYPlayer = RGBYPlayer(id: "25", firstName: "Jordan", lastName: "Larmour", preferredPosition: .FULLBACK)

    static var demoTeam:RGBYTeam = RGBYTeam(id: "team-1", title: "MIT RFC 1st XV", shortTitle: "MITRFC", club: demoClub, playerList: [demoCH, demoRB, demoTF, demoJR, demoDT, demoPOM, demoDL, demoCJS, demoKM, demoJSe, gffny, demoJSt, demoBA, demoGR, demoKE, demoRK, demoSC, demoJMcG, demoAP, demoIH, demoJvdF, demoLMcG, demoJC, demoJL])

    static var demoMatch:RGBYMatch = RGBYMatch(id: "match-1", title: "The Match?", date: Date(), location: "Briggs Field, Vassar St., Cambridge, MA 02143", homeTeam: demoTeam, awayTeam: demoOppTeam)
    
    static var demoMatchDaySquadMIT:RGBYMatchDaySquad = RGBYMatchDaySquad(match: demoMatch, team: demoTeam, looseHeadProp: demoCH, hooker: demoRB, tightHeadProp: demoTF, looseHeadSecondRow: demoJR, tightHeadSecondRow: demoDT, blindSideFlanker: demoPOM, opensideFlanker: demoDL, number8: demoCJS, scrumHalf: demoKM, outHalf: demoJSe, leftWing: demoJSt, insideCenter: demoBA, outsideCenter: demoGR, rightWing: demoKE, fullback: demoRK, subsitutes: [demoSC, demoJMcG, demoAP, demoIH, demoJvdF, demoLMcG, demoJC, demoJL])
    
    static var demoMatchDaySquadNZ:RGBYMatchDaySquad = RGBYMatchDaySquad(match: demoMatch, team: demoOppTeam, looseHeadProp: demoKT, hooker: demoCT, tightHeadProp: demoOF, looseHeadSecondRow: demoBR, tightHeadSecondRow: demoSW, blindSideFlanker: demoLS, opensideFlanker: demoASa, number8: demoKR, scrumHalf: demoASm, outHalf: demoBB, leftWing: demoRI, insideCenter: demoRC, outsideCenter: demoJG, rightWing: demoBS, fullback: demoDMcK, subsitutes: [demoDC, demoOT, demoNL, demoSB, demoMT, demoTJP, demoRM, demoALB])
    
    static var demoKT:RGBYPlayer = RGBYPlayer(id: "26", firstName: "Karl", lastName: "Tu'inukuafe", preferredPosition: .LOOSE_HEAD_PROP)
    static var demoCT:RGBYPlayer = RGBYPlayer(id: "27", firstName: "Codie", lastName: "Taylor", preferredPosition: .HOOKER)
    static var demoOF:RGBYPlayer = RGBYPlayer(id: "28", firstName: "Owen", lastName: "Franks", preferredPosition: .TIGHT_HEAD_PROP)
    static var demoBR:RGBYPlayer = RGBYPlayer(id: "29", firstName: "Brodie", lastName: "Retallick", preferredPosition: .SECOND_ROW)
    static var demoSW:RGBYPlayer = RGBYPlayer(id: "30", firstName: "Samuel", lastName: "Whitelock", preferredPosition: .SECOND_ROW)
    static var demoLS:RGBYPlayer = RGBYPlayer(id: "31", firstName: "Liam", lastName: "Squire", preferredPosition: .BLINDSIDE_FLANKER)
    static var demoASa:RGBYPlayer = RGBYPlayer(id: "32", firstName: "Ardie", lastName: "Savea", preferredPosition: .OPENSIDE_FLANKER)
    static var demoKR:RGBYPlayer = RGBYPlayer(id: "33", firstName: "Kieran", lastName: "Reid", preferredPosition: .NUMBER_8)
    static var demoASm:RGBYPlayer = RGBYPlayer(id: "34", firstName: "Aaron", lastName: "Smith", preferredPosition: .SCRUM_HALF)
    static var demoBB:RGBYPlayer = RGBYPlayer(id: "35", firstName: "Beauden", lastName: "Barrett", preferredPosition: .OUT_HALF)
    static var demoRI:RGBYPlayer = RGBYPlayer(id: "36", firstName: "Rieko", lastName: "Ioane", preferredPosition: .LEFT_WING)
    static var demoRC:RGBYPlayer = RGBYPlayer(id: "37", firstName: "Ryan", lastName: "Crotty", preferredPosition: .INSIDE_CENTER)
    static var demoJG:RGBYPlayer = RGBYPlayer(id: "38", firstName: "Jack", lastName: "Goodhue", preferredPosition: .OUTSIDE_CENTER)
    static var demoBS:RGBYPlayer = RGBYPlayer(id: "39", firstName: "Ben", lastName: "Smith", preferredPosition: .RIGHT_WING)
    static var demoDMcK:RGBYPlayer = RGBYPlayer(id: "40", firstName: "Damien", lastName: "McKenzie", preferredPosition: .FULLBACK)
    static var demoDC:RGBYPlayer = RGBYPlayer(id: "41", firstName: "Dane", lastName: "Coles", preferredPosition: .HOOKER)
    static var demoOT:RGBYPlayer = RGBYPlayer(id: "42", firstName: "Ofa", lastName: "Tuungafasi", preferredPosition: .LOOSE_HEAD_PROP)
    static var demoNL:RGBYPlayer = RGBYPlayer(id: "43", firstName: "Nepo", lastName: "Laulala", preferredPosition: .TIGHT_HEAD_PROP)
    static var demoSB:RGBYPlayer = RGBYPlayer(id: "44", firstName: "Scott", lastName: "Barrett", preferredPosition: .SECOND_ROW)
    static var demoMT:RGBYPlayer = RGBYPlayer(id: "45", firstName: "Matt", lastName: "Todd", preferredPosition: .OPENSIDE_FLANKER)
    static var demoTJP:RGBYPlayer = RGBYPlayer(id: "46", firstName: "TJ", lastName: "Perenara", preferredPosition: .SCRUM_HALF)
    static var demoRM:RGBYPlayer = RGBYPlayer(id: "47", firstName: "Richie", lastName: "Mo'unga", preferredPosition: .OUT_HALF)
    static var demoALB:RGBYPlayer = RGBYPlayer(id: "48", firstName: "Anton", lastName: "Lienert-Brown", preferredPosition: .FULLBACK)
    
    static var demoMatchDetail: RGBYMatchDetail = RGBYMatchDetail(match: demoMatch, myMatchDaySquad: demoMatchDaySquadMIT, oppMatchDaySquad: demoMatchDaySquadNZ)
}
