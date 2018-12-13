//
//  File.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/28/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class RGBYClub: Object, Codable {
    enum Property: String {
        case id, title, imageURL
    }

    dynamic var id = ""
    dynamic var title = ""
    dynamic var imageURL = ""

    convenience init(_ id: String, _ title: String, _ imageURL: String) {
        self.init()
        self.id = id
        self.title = title
        self.imageURL = imageURL
    }

    override static func primaryKey() -> String? {
        return RGBYClub.Property.id.rawValue
    }
}

extension RGBYClub {
    
    static func get(id: String, in realm: Realm = try! Realm()) -> RGBYClub? {
        return realm.object(ofType: RGBYClub.self, forPrimaryKey: id)
    }
    
    static func all(in realm: Realm = try! Realm()) -> Results<RGBYClub> {
        return realm.objects(RGBYClub.self)
            .sorted(byKeyPath: RGBYClub.Property.id.rawValue)
    }
    
    @discardableResult
    static func create(club: RGBYClub, in realm: Realm = try! Realm())
        -> RGBYClub {
            try! realm.write {
                realm.add(club, update: true)
            }
            return club
    }
    
    @discardableResult
    static func update(id: String, title: String, imageURL: String, in realm: Realm = try! Realm())
        -> RGBYClub {
            let item = RGBYClub(id, title, imageURL)
            try! realm.write {
                realm.add(item)
            }
            return item
    }
    
    @discardableResult
    static func create(title: String, imageURL: String, in realm: Realm = try! Realm())
        -> RGBYClub {
            let item = RGBYClub(NSUUID().uuidString, title, imageURL)
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
