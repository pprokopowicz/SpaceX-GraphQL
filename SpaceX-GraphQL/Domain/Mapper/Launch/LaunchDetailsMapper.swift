//
//  LaunchDetailsMapper.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation

protocol LaunchDetailsMapper {
    func map(_ model: LaunchDetailsQuery.Data.Launch) throws -> LaunchDetails
}

struct LaunchDetailsMapperImpl: LaunchDetailsMapper {
    
    private let rocketMapper: RocketMapper
    private let mediaMapper: MediaMapper
    
    init(
        rocketMapper: RocketMapper,
        mediaMapper: MediaMapper
    ) {
        self.rocketMapper = rocketMapper
        self.mediaMapper = mediaMapper
    }
    
    func map(_ model: LaunchDetailsQuery.Data.Launch) throws -> LaunchDetails {
        guard let id = model.id else { throw MappingError.optionalProperty }
        guard let missionName = model.missionName else { throw MappingError.optionalProperty }
        guard let stringDate = model.launchDateUnix else { throw MappingError.optionalProperty }
        guard let date = Double(stringDate).map(Date.init(timeIntervalSince1970:)) else { throw MappingError.wrongFormat }
        guard let rocket = model.rocket else { throw MappingError.optionalProperty }
        guard let links = model.links else { throw MappingError.optionalProperty }
        
        return LaunchDetails(
            id: id,
            details: model.details,
            missionName: missionName,
            launchDate: date,
            rocket: try rocketMapper.map(rocket),
            media: try mediaMapper.map(links)
        )
    }
}
