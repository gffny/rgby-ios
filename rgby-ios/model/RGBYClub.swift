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
        case id, title, imageURL, imageData
    }

    dynamic var id = ""
    dynamic var title = ""
    dynamic var imageURL = ""
    dynamic var imageData = Data()

    convenience init(_ id: String, _ title: String, _ imageURL: String, _ imageData: Data) {
        self.init()
        self.id = id
        self.title = title
        self.imageURL = imageURL
        self.imageData = imageData
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
    static func update(club: RGBYClub, in realm: Realm = try! Realm())
        -> RGBYClub {
            try! realm.write {
                realm.add(club, update: true)
            }
            return club
    }

    @discardableResult
    static func update(id: String, title: String, imageURL: String, imageData: Data, in realm: Realm = try! Realm())
        -> RGBYClub {
            let item = RGBYClub(id, title, imageURL, imageData)
            try! realm.write {
                realm.add(item)
            }
            return item
    }

    static func retrieveImageData(club: RGBYClub, in realm: Realm = try! Realm()) -> Data? {
        print("retreving image for club \(club.title)")
        // check if the image data is there
        if !club.imageData.isEmpty {
            return club.imageData
        }
        print("club does not have image data")
        // check if the image URL is there
        if club.imageURL.isEmpty {
            print("club image data and url are empty; returning nil for image data")
            return nil
        }
        //TODO hanlde catching data load errors here!
        print("retrieving image data from \(club.imageURL)")
        let data = try? Data(contentsOf: URL(string: club.imageURL)!)
        if let imageData = data {
            try! realm.write {
                club.imageData = imageData
                realm.add(club, update: true)
            }
            return imageData
        }
        // set default pen image
        return nil
    }

    @discardableResult
    static func create(title: String, imageURL: String, imageData: Data, in realm: Realm = try! Realm())
        -> RGBYClub {
            let item = RGBYClub(NSUUID().uuidString, title, imageURL, imageData)
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
