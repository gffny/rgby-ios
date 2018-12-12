//
//  File.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/28/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation

class RGBYClub: Codable {

    var id: String?
    var title: String?
    var imageURL: URL?

    init(id: String, title: String, imageURL: URL) {
        self.id = id
        self.title = title
        self.imageURL = imageURL
    }
}
