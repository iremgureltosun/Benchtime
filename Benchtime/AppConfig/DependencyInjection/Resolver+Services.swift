//
//  ContainerBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import Resolver

extension Resolver: ResolverRegistering {
    func registerServices() {
        register(CharacterService.self) { CharacterServiceImpl() }.scope(.application)
        
        // register(CharacterDetailService.self) { MockCharacterDetailService() } // Method1
        register(EpisodeService.self) { EpisodeServiceImpl() }
        
        register(UserService.self) { UserServiceImpl() }
        register(AppointmentsService.self) { AppointmentsServiceImpl() }
    }

    public static func registerAllServices() {
        Resolver.main.registerServices()
    }
}
