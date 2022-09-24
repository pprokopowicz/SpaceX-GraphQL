//
//  LaunchItem.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation

struct PastLaunchesScreenItem {
    let pastLaunches: [PastLaunchItem]
    let hasMoreItems: Bool
}

struct PastLaunchItem: Identifiable {
    let id: String
    let missionName: String
}
