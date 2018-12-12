//
//  File.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/28/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class RGBYClub: Object, Codable {

    @objc dynamic var id: String = ""
    @objc dynamic var title: String?
    @objc dynamic var imageURL: String?

//    init(id: String, title: String, imageURL: URL) {
//        self.id = id
//        self.title = title
//        self.imageURL = imageURL
//    }
//    
    convenience init(id: String, title: String, imageURL: String) {
        self.init()
        self.id = id
        self.title = title
        self.imageURL = imageURL
    }

    required init() {
        super.init()
    }

    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }

    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }

    override static func primaryKey() -> String? {
        return "id"
    }
}
