//
//  Image+SFSymbols.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation

enum Asset {}

extension Asset {
    enum System {
        static let chevronRight: SystemAsset = SystemAsset(name: "chevron.right")
    }
}

struct SystemAsset {
    let name: String
}
