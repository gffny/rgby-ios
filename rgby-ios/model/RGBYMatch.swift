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

    override static func primaryKey() -> String? {
        return RGBYMatch.Property.id.rawValue
    }

    convenience init(_ id: String, _ title: String, _ date: Date, _ location: String, _ team: RGBYTeam, _ matchDaySquad: RGBYMatchDaySquad, _ opposition: RGBYTeam, _ isHomeMatch: Bool) {
        self.init()
        self.id = id
        self.title = title
        self.date = date
        self.location = location
        self.team = team
        self.matchDaySquad = matchDaySquad
        self.opposition = opposition
        self.isHomeMatch = isHomeMatch
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
    static func create(match: RGBYMatch, in realm: Realm = try! Realm())
        -> RGBYMatch {
            try! realm.write {
                realm.add(match, update: true)
            }
            return match
    }

    @discardableResult
    static func update(id: String, title: String, date: Date, location: String, team: RGBYTeam, matchDaySquad: RGBYMatchDaySquad, opposition: RGBYTeam, isHomeMatch: Bool, in realm: Realm = try! Realm())
        -> RGBYMatch {
            let item = RGBYMatch(id, title, date, location, team, matchDaySquad, opposition, isHomeMatch)
            try! realm.write {
                realm.add(item)
            }
            return item
    }

    @discardableResult
    static func create(title: String, date: Date, location: String, team: RGBYTeam, matchDaySquad: RGBYMatchDaySquad, opposition: RGBYTeam, isHomeMatch: Bool, in realm: Realm = try! Realm())
        -> RGBYMatch {
            let item = RGBYMatch(NSUUID().uuidString, title, date, location, team, matchDaySquad, opposition, isHomeMatch)
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
