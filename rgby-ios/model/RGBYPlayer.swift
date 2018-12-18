//
//  RGBYPlayer.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/15/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class RGBYPlayer: Object, Codable {
    enum Property: String {
        case id, fName, lName, preferredPosition, imageURL
    }

    dynamic var id = NSUUID().uuidString
    dynamic var fName = ""
    dynamic var lName = ""
    dynamic var preferredPositionRaw = RGBYPlayerPosition.SCRUM_HALF.rawValue
    dynamic var imageURL = ""
    
    var preferredPosition: RGBYPlayerPosition {
        get {
            return RGBYPlayerPosition(rawValue: preferredPositionRaw)!
        } set {
            self.preferredPositionRaw = newValue.rawValue
        }
    }

    override static func primaryKey() -> String? {
        return RGBYPlayer.Property.id.rawValue
    }

    convenience init(_ id: String, _ firstName: String, _ lastName: String, _ preferredPosition: RGBYPlayerPosition, _ imageURL: String) {
        self.init()
        self.id = id
        self.fName = firstName
        self.lName = lastName
        self.preferredPosition = preferredPosition
        self.imageURL = imageURL
    }
}

extension RGBYPlayer {
    
    static func get(id: String, in realm: Realm = try! Realm()) -> RGBYPlayer? {
        return realm.object(ofType: RGBYPlayer.self, forPrimaryKey: id)
    }
    
    static func all(in realm: Realm = try! Realm()) -> Results<RGBYPlayer> {
        return realm.objects(RGBYPlayer.self)
            .sorted(byKeyPath: RGBYPlayer.Property.id.rawValue)
    }
    
    @discardableResult
    static func create(player: RGBYPlayer, in realm: Realm = try! Realm())
        -> RGBYPlayer {
            try! realm.write {
                realm.add(player, update: true)
            }
            return player
    }
    
    @discardableResult
    static func update(id: String, fName: String, lName: String, position: RGBYPlayerPosition, imageURL: String, in realm: Realm = try! Realm())
        -> RGBYPlayer {
            let item = RGBYPlayer(id, fName, lName, position, imageURL)
            try! realm.write {
                realm.add(item)
            }
            return item
    }
    
    @discardableResult
    static func create(fName: String, lName: String, position: RGBYPlayerPosition, imageURL: String, in realm: Realm = try! Realm())
        -> RGBYPlayer {
            let item = RGBYPlayer(NSUUID().uuidString, fName, lName, position, imageURL)
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
