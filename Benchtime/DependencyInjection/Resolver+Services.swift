//
//  ContainerBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import Resolver

extension Resolver: ResolverRegistering {
    func registerServices() {
        register(CharacterService.self) { CharacterServiceImpl() }
        print("Services are registered!")
    }

    public static func registerAllServices() {
        Resolver.main.registerServices()
    }
}
