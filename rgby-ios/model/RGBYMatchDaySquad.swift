//
//  RGBYMatchDaySquad.swift
//  rgby-ios
//
//  Created by John D. Gaffney on 11/15/18.
//  Copyright © 2018 gffny.com. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class RGBYMatchDaySquad: Object {
    enum Property: String {
        case looseHeadProp, hooker, tightHeadProp, looseHeadSecondRow, tightHeadSecondRow, blindsideFlanker, opensideFlanker, number8, scrumHalf, outHalf, leftWing, insideCenter, outsideCenter, rightWing, fullback, subsituteList, subbedPlayreeList, bloodBinList
    }

    dynamic var looseHeadProp: RGBYPlayer?
    dynamic var hooker: RGBYPlayer?
    dynamic var tightHeadProp: RGBYPlayer?
    dynamic var looseHeadSecondRow: RGBYPlayer?
    dynamic var tightHeadSecondRow: RGBYPlayer?
    dynamic var blindSideFlanker: RGBYPlayer?
    dynamic var opensideFlanker: RGBYPlayer?
    dynamic var number8: RGBYPlayer?
    dynamic var scrumHalf: RGBYPlayer?
    dynamic var outHalf: RGBYPlayer?
    dynamic var leftWing: RGBYPlayer?
    dynamic var insideCenter: RGBYPlayer?
    dynamic var outsideCenter: RGBYPlayer?
    dynamic var rightWing: RGBYPlayer?
    dynamic var fullback: RGBYPlayer?
    dynamic var subsituteList = List<RGBYPlayer>()
    dynamic var subbedPlayerList = List<RGBYPlayer>()
    dynamic var bloodBinList = List<RGBYPlayer>()

    convenience init(_ looseHeadProp: RGBYPlayer?, _ hooker: RGBYPlayer?, _ tightHeadProp: RGBYPlayer?, _ looseHeadSecondRow: RGBYPlayer?, _ tightHeadSecondRow: RGBYPlayer?, _ blindSideFlanker: RGBYPlayer?, _ opensideFlanker: RGBYPlayer?, _ number8: RGBYPlayer?, _ scrumHalf: RGBYPlayer?, _ outHalf: RGBYPlayer?, _ leftWing: RGBYPlayer?, _ insideCenter: RGBYPlayer?, _ outsideCenter: RGBYPlayer?, _ rightWing: RGBYPlayer?, _ fullback: RGBYPlayer?, _ subsituteList: List<RGBYPlayer>, _ subbedPlayerList: List<RGBYPlayer>, _ bloodBinList: List<RGBYPlayer>) {
        self.init()
        self.looseHeadProp = looseHeadProp
        self.hooker = hooker
        self.tightHeadProp = tightHeadProp
        self.looseHeadSecondRow = looseHeadSecondRow
        self.tightHeadSecondRow = tightHeadSecondRow
        self.blindSideFlanker = blindSideFlanker
        self.opensideFlanker = opensideFlanker
        self.number8 = number8
        self.scrumHalf = scrumHalf
        self.outHalf = outHalf
        self.leftWing = leftWing
        self.insideCenter = insideCenter
        self.outsideCenter = outsideCenter
        self.rightWing = rightWing
        self.fullback = fullback
        self.subsituteList = subsituteList
        self.subbedPlayerList = subbedPlayerList
        self.bloodBinList = bloodBinList
    }

    dynamic var listTeam: [RGBYPlayer] {
        get {
            return [
                self.looseHeadProp!,
                self.hooker!,
                self.tightHeadProp!,
                self.looseHeadSecondRow!,
                self.tightHeadSecondRow!,
                self.blindSideFlanker!,
                self.opensideFlanker!,
                self.number8!,
                self.scrumHalf!,
                self.outHalf!,
                self.leftWing!,
                self.insideCenter!,
                self.outsideCenter!,
                self.rightWing!,
                self.fullback!
            ];
        }
    }
}
