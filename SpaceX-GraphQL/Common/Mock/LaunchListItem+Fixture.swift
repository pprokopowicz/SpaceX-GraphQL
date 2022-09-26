//
//  LaunchListItem+Fixture.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation

extension LaunchListItem {
    static func fixture(
        id: String = "0",
        missionName: String = "MissionName"
    ) -> Self {
        Self(
            id: id,
            missionName: missionName
        )
    }
}
