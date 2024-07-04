//
//  NavigationStrategy.swift
//  Benchtime
//
//  Created by Tosun, Irem on 4.07.2024.
//

import SwiftUI

protocol NavigationStrategy {
    associatedtype Destination: View
    func view(for route: Route) -> Destination
}
