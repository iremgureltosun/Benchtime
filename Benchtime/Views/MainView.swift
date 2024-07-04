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
                    .environment(\.appManager, appManager)
                    .tabItem {
                        Label("Store", systemImage: "person")
                    }
            }
            .toolbar {
                // Menu on the Left
                ToolbarItem(placement: .navigationBarLeading) {
                    Menu {
                        Button("Animated Clock") {
                            appManager.navigate(to: .animatedClock)
                        }
                        Button("Playground View") {
                            appManager.navigate(to: .titlePlayground)
                        }
                        Button("Faceted Builders View") {
                            appManager.navigate(to: .facetedBuilder)
                        }
                        Button("Chain Of Responsibility View") {
                            appManager.navigate(to: .markPhoto)
                        }
                        Button("Memento Search View") {
                            appManager.navigate(to: .mementoSearchView)
                        }
                        Button("Memento Drawing View") {
                            appManager.navigate(to: .mementoDoUndo)
                        }
                        Button("Decorator Example View") {
                            appManager.navigate(to: .decoratorExampleView)
                        }
                        Button("Composite Example View") {
                            appManager.navigate(to: .compositeExampleView)
                        }
                        Button("Flyweight Font View") {
                            appManager.navigate(to: .flyWeightTextEditorView)
                        }
                        Button("Flyweight Zoo View") {
                            appManager.navigate(to: .flyWeightZooView)
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    }
                }
            }
            .navigationDestination(for: Route.self) { route in
                appManager.view(for: route)
            }
        }
    }
}

#Preview {
    MainView()
}
