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

    func substitutePlayer(position: String, with: RGBYPlayer) -> RGBYPlayer? {

        // remove the player from the substitute list
        for (index, player) in self.subsituteList.enumerated() {
            if player == with {
                self.subsituteList.remove(at: index)
            }
        }

        switch position {
        case "1":
            let subbedPlayer = self.looseHeadProp!
            self.subbedPlayerList.append(subbedPlayer)
            self.looseHeadProp = with
            return subbedPlayer
        case "2":
            let subbedPlayer = self.hooker!
            self.subbedPlayerList.append(subbedPlayer)
            self.hooker = with
            return subbedPlayer
        case "3":
            let subbedPlayer =  self.tightHeadProp!
            self.subbedPlayerList.append(subbedPlayer)
            self.tightHeadProp = with
            return subbedPlayer
        case "4":
            let subbedPlayer = self.looseHeadSecondRow!
            self.subbedPlayerList.append(subbedPlayer)
            self.looseHeadSecondRow = with
            return subbedPlayer
        case "5":
            let subbedPlayer = self.tightHeadSecondRow!
            self.subbedPlayerList.append(subbedPlayer)
            self.tightHeadSecondRow = with
            return subbedPlayer
        case "6":
            let subbedPlayer = self.blindSideFlanker!
            self.subbedPlayerList.append(subbedPlayer)
            self.blindSideFlanker = with
            return subbedPlayer
        case "7":
            let subbedPlayer = self.opensideFlanker!
            self.subbedPlayerList.append(subbedPlayer)
            self.opensideFlanker = with
            return subbedPlayer
        case "8":
            let subbedPlayer = self.number8!
            self.subbedPlayerList.append(subbedPlayer)
            self.number8 = with
            return subbedPlayer
        case "9":
            let subbedPlayer = self.scrumHalf!
            self.subbedPlayerList.append(subbedPlayer)
            self.scrumHalf = with
            return subbedPlayer
        case "10":
            let subbedPlayer = self.outHalf!
            self.subbedPlayerList.append(subbedPlayer)
            self.outHalf = with
            return subbedPlayer
        case "11":
            let subbedPlayer = self.leftWing!
            self.subbedPlayerList.append(subbedPlayer)
            self.leftWing = with
            return subbedPlayer
        case "12":
            let subbedPlayer = self.insideCenter!
            self.subbedPlayerList.append(subbedPlayer)
            self.insideCenter = with
            return subbedPlayer
        case "13":
            let subbedPlayer = self.outsideCenter!
            self.subbedPlayerList.append(subbedPlayer)
            self.outsideCenter = with
            return subbedPlayer
        case "14":
            let subbedPlayer = self.rightWing!
            self.subbedPlayerList.append(subbedPlayer)
            self.rightWing = with
            return subbedPlayer
        case "15":
            let subbedPlayer = self.fullback!
            self.subbedPlayerList.append(subbedPlayer)
            self.fullback = with
            return subbedPlayer
        default:
            print("error, player subbed is not position 1-15")
            return nil
        }
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
