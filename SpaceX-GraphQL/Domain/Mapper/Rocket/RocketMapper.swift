//
//  RocketMapper.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation

protocol RocketMapper {
    func map(_ model: LaunchDetailsQuery.Data.Launch.Rocket) throws -> Rocket
}

struct RocketMapperImpl: RocketMapper {
    func map(_ model: LaunchDetailsQuery.Data.Launch.Rocket) throws -> Rocket {
        guard let id = model.rocket?.id else { throw MappingError.optionalProperty }
        guard let rocketName = model.rocketName else { throw MappingError.optionalProperty }
        guard let rocketType = model.rocketType else { throw MappingError.optionalProperty }
        
        return Rocket(
            id: id,
            name: rocketName,
            type: rocketType
        )
    }
}
