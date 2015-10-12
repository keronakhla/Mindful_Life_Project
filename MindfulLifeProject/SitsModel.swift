//
//  SitsModel.swift
//  MindfulLifeProject
//
//  Created by Christopher Queen on 10/10/15.
//  Copyright © 2015 Christopher Queen. All rights reserved.
//

import Foundation

struct Sit {
    var name: String?
    var src: String?
}

struct SitList {
    var name: String?
    var sits:[Sit]
}

// Individual Sits
let aishaAnchorSpot = Sit(name: "Aisha Anchor Spot", src: "/src")
let angelinaAnchorSpot = Sit(name: "Angelina Anchor Spot", src: "/src")

let aishaAnchorWords = Sit(name: "Aisha Anchor Words", src: "/src")
let angelinaAnchorWords = Sit(name: "Angelina Anchor Words", src: "/src")

//Sit Lists
let anchorSpotSits = SitList(name: "Anchor Spot", sits: [aishaAnchorSpot, angelinaAnchorSpot])
let anchorWordSits = SitList(name: "Anchor Words", sits: [aishaAnchorWords, angelinaAnchorWords])

//All Sits
let allSits = [anchorSpotSits, anchorWordSits]