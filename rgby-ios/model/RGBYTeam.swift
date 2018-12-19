//
//  RGBYTeam.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/28/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class RGBYTeam: Object {//, Codable {
    enum Property: String {
        case id, title, shortTitle, club, playerList
    }

    dynamic var id = ""
    dynamic var title = ""
    dynamic var shortTitle = ""
    dynamic var club: RGBYClub?
    dynamic var playerList = List<RGBYPlayer>()

    override static func primaryKey() -> String? {
        return RGBYTeam.Property.id.rawValue
    }
    
    convenience init(_ id: String, _ title: String, _ shortTitle: String, _ club: RGBYClub, _ playerList: List<RGBYPlayer>) {
        self.init()
        self.id = id
        self.title = title
        self.shortTitle = shortTitle
        self.club = club
        self.playerList = playerList
    }
}

extension RGBYTeam {
    
    static func get(id: String, in realm: Realm = try! Realm()) -> RGBYTeam? {
        return realm.object(ofType: RGBYTeam.self, forPrimaryKey: id)
    }
    
    static func all(in realm: Realm = try! Realm()) -> Results<RGBYTeam> {
        return realm.objects(RGBYTeam.self)
            .sorted(byKeyPath: RGBYTeam.Property.id.rawValue)
    }
    
    @discardableResult
    static func update(team: RGBYTeam, in realm: Realm = try! Realm())
        -> RGBYTeam {
            try! realm.write {
                realm.add(team, update: true)
            }
            return team
    }
    
    @discardableResult
    static func update(id: String, title: String, shortTitle: String, club: RGBYClub, playerList: List<RGBYPlayer>, in realm: Realm = try! Realm())
        -> RGBYTeam {
            let item = RGBYTeam(id, title, shortTitle, club, playerList)
            try! realm.write {
                realm.add(item)
            }
            return item
    }
    
    @discardableResult
    static func create(title: String, shortTitle: String, club: RGBYClub, playerList: List<RGBYPlayer>, in realm: Realm = try! Realm())
        -> RGBYTeam {
            let item = RGBYTeam(NSUUID().uuidString, title, shortTitle, club, playerList)
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
