//
//  ContainerBuilder.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import Resolver

extension Resolver: ResolverRegistering {
    func registerServices() {
        register(CharacterService.self) { CharacterServiceImpl() }.scope(.cached)
        
        // register(CharacterDetailService.self) { MockCharacterDetailService() } // Method1
        register(EpisodeService.self) { EpisodeServiceImpl() }
        
        register(UserService.self) { UserServiceImpl() }.scope(.cached)
        register(AppointmentsService.self) { AppointmentsServiceImpl() }
        register(ProductService.self) { ProductServiceImpl() }.scope(.cached)
        register(UpdateProductsService.self) { UpdateProductsServiceImpl() }
    }

    public static func registerAllServices() {
        Resolver.main.registerServices()
    }
}
