//
//  MapperAssembly.swift
//  SpaceX-GraphQL
//
//  Created by Piotr Prokopowicz on 24/09/2022.
//

import Foundation
import Swinject

struct MapperAssembly: Assembly {
    func assemble(container: Swinject.Container) {
        container.register(PastLaunchMapper.self) { _ in
            PastLaunchMapperImpl()
        }
    }
}
