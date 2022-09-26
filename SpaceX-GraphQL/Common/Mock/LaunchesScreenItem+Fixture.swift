//
//  LaunchesScreenItem+Fixture.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation

extension LaunchesScreenItem {
    static func fixture(hasMoreItems: Bool = true) -> Self {
        Self(
            pastLaunches: [
                .fixture(id: "0"), .fixture(id: "1", missionName: "Short"), .fixture(id: "2", missionName: "Long Long Long Long Long Long mission name"),
                .fixture(id: "3"), .fixture(id: "4"), .fixture(id: "5")
            ],
            hasMoreItems: hasMoreItems
        )
    }
}
