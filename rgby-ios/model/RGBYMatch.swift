//
//  RGBYMatch.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/28/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class RGBYMatch: Object {//, Decodable {
    enum Property: String {
        case id, title, date, location, team, matchDaySquad, opposition, isHomeMatch
    }

    dynamic var id = UUID().uuidString
    dynamic var title = ""
    dynamic var date = Date()
    dynamic var location = ""
    dynamic var team: RGBYTeam?
    dynamic var matchDaySquad: RGBYMatchDaySquad?
    dynamic var opposition: RGBYTeam?
    dynamic var isHomeMatch = false
    dynamic var extraTimePeriods = 0 // 0 for league, 2 for cup?
    dynamic var regularPeriodLength = 2400 // 40 minutes in seconds
    dynamic var extraTimePeriodLength = 900 // 15 minutes in seconds

    override static func primaryKey() -> String? {
        return RGBYMatch.Property.id.rawValue
    }

    convenience init(_ id: String, _ title: String, _ date: Date, _ location: String, _ team: RGBYTeam, _ matchDaySquad: RGBYMatchDaySquad, _ opposition: RGBYTeam, _ isHomeMatch: Bool, _ extraTimePeriods: Int?, _ regularPeriodLength: Int?, _ extraTimePeriodLength: Int?) {
        self.init()
        self.id = id
        self.title = title
        self.date = date
        self.location = location
        self.team = team
        self.matchDaySquad = matchDaySquad
        self.opposition = opposition
        self.isHomeMatch = isHomeMatch
        self.extraTimePeriods = extraTimePeriods ?? 0
        self.regularPeriodLength = regularPeriodLength ?? 2400 // 40 minutes in seconds
        self.extraTimePeriodLength = extraTimePeriodLength ?? 900 // 15 minutes in seconds
    }
}

extension RGBYMatch {

    static func get(id: String, in realm: Realm = try! Realm()) -> RGBYMatch? {
        return realm.object(ofType: RGBYMatch.self, forPrimaryKey: id)
    }

    static func all(in realm: Realm = try! Realm()) -> Results<RGBYMatch> {
        return realm.objects(RGBYMatch.self)
            .sorted(byKeyPath: RGBYMatch.Property.date.rawValue)
    }

    static func upcomingFor(team: RGBYTeam, in realm: Realm = try! Realm()) -> Results<RGBYMatch> {
        // return results filtered to the team and after todays date
        return realm.objects(RGBYMatch.self).filter("team = %@ AND date > %@", team, Date()).sorted(byKeyPath: "date")
    }

    @discardableResult
    static func update(match: RGBYMatch, in realm: Realm = try! Realm())
        -> RGBYMatch {
            try! realm.write {
                realm.add(match, update: true)
            }
            return match
    }

    @discardableResult
    static func update(id: String, title: String, date: Date, location: String, team: RGBYTeam, matchDaySquad: RGBYMatchDaySquad, opposition: RGBYTeam, isHomeMatch: Bool, _ extraTimePeriods: Int?, _ regularPeriodLength: Int?, _ extraTimePeriodLength: Int?, in realm: Realm = try! Realm())
        -> RGBYMatch {
            let item = RGBYMatch(id, title, date, location, team, matchDaySquad, opposition, isHomeMatch, extraTimePeriods, regularPeriodLength, extraTimePeriodLength)
            try! realm.write {
                realm.add(item)
            }
            return item
    }

    @discardableResult
    static func create(title: String, date: Date, location: String, team: RGBYTeam, matchDaySquad: RGBYMatchDaySquad, opposition: RGBYTeam, isHomeMatch: Bool, _ extraTimePeriods: Int?, _ regularPeriodLength: Int?, _ extraTimePeriodLength: Int?, in realm: Realm = try! Realm())
        -> RGBYMatch {
            let item = RGBYMatch(NSUUID().uuidString, title, date, location, team, matchDaySquad, opposition, isHomeMatch, extraTimePeriods, regularPeriodLength, extraTimePeriodLength)
            try! realm.write {
                realm.add(item)
            }
            return item
    }

    func delete() {
        guard let realm = realm else { return }
        try! realm.write {
            realm.delete(self)
        }
    }
}
