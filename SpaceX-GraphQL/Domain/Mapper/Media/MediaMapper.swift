//
//  MediaMapper.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 26/09/2022.
//

import Foundation

protocol MediaMapper {
    func map(_ model: LaunchDetailsQuery.Data.Launch.Link) throws -> Media
}

struct MediaMapperImpl: MediaMapper {
    func map(_ model: LaunchDetailsQuery.Data.Launch.Link) throws  -> Media {
        guard let images = model.flickrImages?.compactMap({ $0 }).compactMap(URL.init(string:)) else { throw MappingError.wrongFormat }
        guard let video = model.videoLink.map(URL.init(string:)) else { throw MappingError.wrongFormat }
        guard let redditMedia = model.redditMedia.map(URL.init(string:)) else { throw MappingError.wrongFormat }
                
        return Media(
            images: images,
            video: video,
            redditMedia: redditMedia
        )
    }
}
