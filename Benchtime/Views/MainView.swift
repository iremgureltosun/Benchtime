//
//  MainView.swift
//  Benchtime
//
//  Created by Tosun, Irem on 20.05.2024.
//

import SwiftUI

struct MainView: View {
    @State var appManager = ApplicationManager.shared

    var body: some View {
        NavigationStack(path: $appManager.routes) {
            TabView {
                CharacterListView()
                    .environment(\.appManager, appManager)
                    .padding(.bottom, 10)
                    .tabItem {
                        Label("Characters", systemImage: "person")
                    }

                PlaygroundView()
                    .tabItem {
                        Label("Playground", systemImage: "message")
                    }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case let .characterDetail(id):
                    CharacterDetailView(id: id)
                }
            }
        }
    }
}

#Preview {
    MainView()
}
