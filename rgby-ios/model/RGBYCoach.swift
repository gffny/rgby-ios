//
//  RGBYCoach.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/11/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class RGBYCoach: Object {
    enum Property: String {
        case id, lastUpdate, lastLogin, club, clubId, fName, lName
    }

    dynamic var id = UUID().uuidString
    dynamic var lastUpdate = Date()
    dynamic var lastLogin = Date()
    dynamic var club: RGBYClub?
    dynamic var teamList = List<RGBYTeam>()
    dynamic var fName = ""
    dynamic var lName = ""

    override static func primaryKey() -> String? {
        return RGBYCoach.Property.id.rawValue
    }

    convenience init(_ id: String, _ lastUpdate: Date, _ lastLogin: Date, _ club: RGBYClub, _ fName: String, _ lName: String) {
        self.init()
        self.id = id
        self.lastUpdate = lastUpdate
        self.lastLogin = lastLogin
        self.club = club
        self.fName = fName
        self.lName = lName
    }
    
    func getCodeable() -> RGBYCoachCodable {
        let codable = RGBYCoachCodable()
        codable.id = self.id
        codable.lastUpdate = self.lastUpdate
        codable.lastLogin = self.lastLogin
        codable.fName = self.fName
        codable.lName = self.lName
        codable.clubId = self.club?.id
        return codable
    }
}

extension RGBYCoach {

    static func get(id: String, in realm: Realm = try! Realm()) -> RGBYCoach? {
        return realm.object(ofType: RGBYCoach.self, forPrimaryKey: id)
    }

    static func all(in realm: Realm = try! Realm()) -> Results<RGBYCoach> {
        return realm.objects(RGBYCoach.self)
            .sorted(byKeyPath: RGBYCoach.Property.lastUpdate.rawValue)
    }

    @discardableResult
    static func create(coach: RGBYCoach, in realm: Realm = try! Realm())
        -> RGBYCoach {
            try! realm.write {
                realm.add(coach, update: true)
            }
            return coach
    }

    @discardableResult
    static func update(id: String, lastUpdate: Date, lastLogin: Date, club: RGBYClub, fName: String, lName: String, in realm: Realm = try! Realm())
        -> RGBYCoach {
            let item = RGBYCoach(id, lastUpdate, lastLogin, club, fName, lName)
            try! realm.write {
                realm.add(item)
            }
            return item
    }

    @discardableResult
    static func updateLastLogin(coach: RGBYCoach, in realm: Realm = try! Realm()) -> RGBYCoach {
        try! realm.write {
            coach.lastLogin = Date()
        }
        return coach
    }

    @discardableResult
    static func create(club: RGBYClub, fName: String, lName: String, in realm: Realm = try! Realm())
        -> RGBYCoach {
            let item = RGBYCoach(NSUUID().uuidString, Date(), Date(), club, fName, lName)
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

class RGBYCoachCodable: Codable {
    var id: String?
    var lastUpdate: Date?
    var lastLogin: Date?
    var clubId: String?
    var fName: String?
    var lName: String?

    func getModel() -> RGBYCoach {
        let club = RGBYClub.get(id: self.clubId ?? "") ?? RGBYClub()
        return RGBYCoach(self.id!, self.lastUpdate!, self.lastLogin ?? Date(), club, self.fName!, self.lName!)
    }
}
