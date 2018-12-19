//
//  RGBYCompetition.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/28/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class RGBYCompetition: Object {
    enum Property: String {
        case id, title, teamList, fixtureList
    }

    dynamic var id = ""
    dynamic var title = ""
    dynamic var teamList = List<RGBYTeam>()
    dynamic var fixtureList = List<RGBYMatch>()

    convenience init(_ id: String, _ title: String, _ teamList: List<RGBYTeam>, _ fixtureList: List<RGBYMatch>) {
        self.init()
        self.id = id
        self.title = title
        self.teamList = teamList
        self.fixtureList = fixtureList
    }

    override static func primaryKey() -> String? {
        return RGBYCompetition.Property.id.rawValue
    }
}

extension RGBYCompetition {
    
    static func get(id: String, in realm: Realm = try! Realm()) -> RGBYCompetition? {
        return realm.object(ofType: RGBYCompetition.self, forPrimaryKey: id)
    }
    
    static func all(in realm: Realm = try! Realm()) -> Results<RGBYCompetition> {
        return realm.objects(RGBYCompetition.self)
            .sorted(byKeyPath: RGBYCompetition.Property.id.rawValue)
    }
    
    @discardableResult
    static func update(competition: RGBYCompetition, in realm: Realm = try! Realm())
        -> RGBYCompetition {
            try! realm.write {
                realm.add(competition, update: true)
            }
            return competition
    }
    
    @discardableResult
    //id, title, teamList, fixtureList
    static func update(id: String, title: String, teamList: List<RGBYTeam>, fixtureList: List<RGBYMatch>, in realm: Realm = try! Realm())
        -> RGBYCompetition {
            let item = RGBYCompetition(id, title, teamList, fixtureList)
            try! realm.write {
                realm.add(item)
            }
            return item
    }
    
    @discardableResult
    static func create(title: String, teamList: List<RGBYTeam>, fixtureList: List<RGBYMatch>, in realm: Realm = try! Realm())
        -> RGBYCompetition {
            let item = RGBYCompetition(NSUUID().uuidString, title, teamList, fixtureList)
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
