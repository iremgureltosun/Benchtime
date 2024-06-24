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

                ListUsersView()
                    .tabItem {
                        Label("Users", systemImage: "person")
                    }
                
                StoreView()
                    .tabItem {
                        Label("Store", systemImage: "person")
                    }
                
//                TitlePlaygroundView()
//                    .tabItem {
//                        Label("Play", systemImage: "message")
//                    }
//
//                AnimatedClockView()
//                    .tabItem {
//                        Label("Clock", systemImage: "clock")
//                    }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case let .characterDetail(id):
                    CharacterDetailView(id: id)
                case .addProduct:
                    AddProductView()
                }
            }
        }
    }
}

#Preview {
    MainView()
}
