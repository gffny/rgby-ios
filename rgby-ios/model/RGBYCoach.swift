//
//  RGBYCoach.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 12/11/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation
import RealmSwift

final class RGBYCoach: Object, Codable {

    @objc dynamic var id: String
    @objc dynamic var lastUpdate: Date
    @objc dynamic var clubId: String? = nil
    //@objc dynamic var teamList: [String]?
    @objc dynamic var fName: String? = nil
    @objc dynamic var lName: String? = nil

    override static func primaryKey() -> String? {
        return "id"
    }

}
