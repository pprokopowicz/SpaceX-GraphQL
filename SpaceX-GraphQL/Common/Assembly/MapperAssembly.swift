//
//  MapperAssembly.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation
import Swinject

// swiftlint:disable force_unwrapping

struct MapperAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(PastLaunchMapper.self) { _ in
            PastLaunchMapperImpl()
        }
        
        container.register(LaunchDetailsMapper.self) { (resolver: Swinject.Resolver) in
            LaunchDetailsMapperImpl(
                rocketMapper: resolver.resolve(RocketMapper.self)!,
                mediaMapper: resolver.resolve(MediaMapper.self)!
            )
        }
        
        container.register(MediaMapper.self) { (_) in
            MediaMapperImpl()
        }
        
        container.register(RocketMapper.self) { (_) in
            RocketMapperImpl()
        }
    }
}

// swiftlint:enable force_unwrapping
