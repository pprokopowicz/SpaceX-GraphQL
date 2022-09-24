//
//  PastLaunchMapper.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation

protocol PastLaunchMapper {
    func map(_ model: PastLaunchesQuery.Data.LaunchesPast) throws -> PastLaunch
}

struct PastLaunchMapperImpl: PastLaunchMapper {
    func map(_ model: PastLaunchesQuery.Data.LaunchesPast) throws -> PastLaunch {
        guard let missionName = model.missionName else { throw MappingError.optionalProperty }
        guard let id = model.id else { throw MappingError.optionalProperty }
        return PastLaunch(id: id, missionName: missionName)
    }
}
